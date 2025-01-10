import 'package:flutter/material.dart';
import 'sidebar/td_sidebar.dart';
import 'sidebar/td_sidebar_item.dart';

class SideBarWidget extends StatefulWidget {
  final List<SideItemProps> sideItems;
  final double itemHeight;
  final Function(int) onChanged;
  final Function(int) onSelected;
  final int? currentValue;

  const SideBarWidget({
    Key? key,
    required this.sideItems,
    this.currentValue,
    this.itemHeight = 278.5,
    required this.onChanged,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SideBarWidgetState();
}

class _SideBarWidgetState extends State<SideBarWidget> {
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.currentValue ?? (widget.sideItems.isNotEmpty ? widget.sideItems.first.value : 0);
  }

  void _onSelected(int value) {
    if (_currentValue != value && value < widget.sideItems.length) {
      setState(() {
        _currentValue = value;
      });

      widget.onSelected(value);
    }
  }

  void _onChanged(int value) {
    setState(() {
      _currentValue = value;
    });

    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    final demoHeight = MediaQuery.of(context).size.height;

    final validCurrentValue = _currentValue < widget.sideItems.length ? _currentValue : 0;

    return SizedBox(
      width: 200,
      child: TDSideBar( 
        height: demoHeight,
         
        style: TDSideBarStyle.normal,
        value: validCurrentValue,
        children: widget.sideItems
            .map((ele) => TDSideBarItem(
                label: ele.label ?? '',
                value: ele.value,
                textStyle: ele.textStyle,
                icon: ele.icon))
            .toList(),
        onChanged: _onChanged,
        onSelected: _onSelected,
      ),
    );
  }
}
