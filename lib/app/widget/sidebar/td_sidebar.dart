import 'package:flutter/material.dart';
import 'td_sidebar_controller.dart';
import 'td_sidebar_item.dart';
import 'td_wrap_sidebar_item.dart';

enum TDSideBarStyle {
  normal,
  outline,
}

class SideItemProps {
  int index;
  int value;
  bool? disabled;
  IconData? icon;
  String? label;

  TextStyle? textStyle;

  SideItemProps(
      {required this.value,
      required this.index,
      this.disabled,
      this.icon,
      this.label,
      this.textStyle});
}

class TDSideBar extends StatefulWidget {
  const TDSideBar({
    Key? key,
  
    this.value,
    this.defaultValue,
    this.selectedColor,
    this.children = const [],
    this.onChanged,
    this.onSelected,
    this.height,
    this.controller,
    this.contentPadding,
    this.selectedTextStyle,
    this.style = TDSideBarStyle.normal,
  }) : super(key: key);

  final int? value;

  final int? defaultValue;

  final List<TDSideBarItem> children;

  final ValueChanged<int>? onChanged;

  final ValueChanged<int>? onSelected;

  final Color? selectedColor;

  final TextStyle? selectedTextStyle;

  final TDSideBarStyle style;

  final double? height;

  final EdgeInsetsGeometry? contentPadding;

  final TDSideBarController? controller;

  @override
  State<TDSideBar> createState() => _TDSideBarState();
}

class _TDSideBarState extends State<TDSideBar> {
  late List<SideItemProps> displayChildren;
  late int? currentValue;
  late int? currentIndex;
  final _scrollerController = ScrollController();
  final GlobalKey globalKey = GlobalKey();
  final double itemHeight = 56.0;

  SideItemProps findSideItem(int value) {
    return displayChildren.where((element) => element.value == value).first;
  }

 
  void selectValue(int value, {bool needScroll = false}) {
    SideItemProps? item;
    for (var element in displayChildren) {
      if (element.value == value) {
        item = element;
      }
    }

    if (needScroll && item != null) {
      try {
        var height = globalKey.currentContext!.size!.height;
        var offset = _scrollerController.offset;
        var distance = item.index * itemHeight - offset;
        if (distance + itemHeight > height) {
          _scrollerController.animateTo(offset + itemHeight,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeIn);
        } else if (distance < 0) {
          _scrollerController.animateTo(offset - itemHeight,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeIn);
        }
      } catch (e) {
        print(e);
      }
    }

    if (item != null) {
      onSelect(item, isController: true);
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.controller != null) {
      widget.controller!.addListener(() {
        selectValue(widget.controller!.currentValue, needScroll: true);
      });
    }

    displayChildren = widget.children
        .asMap()
        .entries
        .map((entry) => SideItemProps(
              index: entry.key,
              disabled: entry.value.disabled,
              value: entry.value.value,
              icon: entry.value.icon,
              label: entry.value.label,
              textStyle: entry.value.textStyle,
            ))
        .toList();

    currentValue = widget.value ??
        widget.defaultValue ??
        (displayChildren.isNotEmpty ? displayChildren[0].value : null);
    if (currentValue != null) {
      try {
        final item = findSideItem(currentValue!);
        currentIndex = item.index;
      } catch (e) {
        currentIndex = null;
        currentValue = null;
      }
    } else {
      currentIndex = null;
    }
  }

  void onSelect(SideItemProps item, {isController = false}) {
    if (currentIndex != item.index) {
      if (isController) {
        if (widget.onChanged != null) {
          widget.onChanged!(item.value);
        }
      } else {
        if (widget.onSelected != null) {
          widget.onSelected!(item.value);
        }
      }

      setState(() {
        currentIndex = item.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        key: globalKey,
        constraints: BoxConstraints(
            minWidth: 106,
            maxHeight: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top),
        child: SizedBox(
            height: widget.height ?? MediaQuery.of(context).size.height,
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                removeBottom: true,
                child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: displayChildren.length,
                    controller: _scrollerController,
                    itemBuilder: (BuildContext context, int index) {
                      var ele = displayChildren[index];

                      return TDWrapSideBarItem(
                        style: widget.style,
                        value: ele.value,
                        icon: ele.icon,
                        disabled: ele.disabled ?? false,
                        label: ele.label ?? '',
                        textStyle: ele.textStyle,
                        selected: currentIndex == ele.index,
                        selectedColor: widget.selectedColor,
                        selectedTextStyle: widget.selectedTextStyle,
                        contentPadding: widget.contentPadding,
                        topAdjacent: currentIndex != null &&
                            currentIndex! + 1 == ele.index,
                        bottomAdjacent: currentIndex != null &&
                            currentIndex! - 1 == ele.index,
                        onTap: () {
                          if (!(ele.disabled ?? false)) {
                            onSelect(ele, isController: false);
                          }
                        },
                      );
                    }))));
  }
}
