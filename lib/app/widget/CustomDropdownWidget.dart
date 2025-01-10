import 'package:flutter/material.dart';

import '../core/model/selectionPopupModel/selection_popup_model.dart';

class CustomDropdown extends StatefulWidget {
  final List<SelectionPopupModel> items;
  final SelectionPopupModel? selectedItem;
  final ValueChanged<SelectionPopupModel?> onChanged;
  final String hintText;
  final Widget? icon;
  final double borderRadius;
  final Color borderColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry padding;

  const CustomDropdown({
    Key? key,
    required this.items,
    required this.onChanged,
    this.selectedItem,
    this.hintText = "Select an option",
    this.icon,
    this.borderRadius = 8.0,
    this.borderColor = Colors.grey,
    this.backgroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final GlobalKey _dropdownKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  void _toggleDropdown() {
    if (_isOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    final RenderBox renderBox = _dropdownKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    _overlayEntry = _createOverlayEntry(offset, size);
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isOpen = true;
    });
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    setState(() {
      _isOpen = false;
    });
  }

  OverlayEntry _createOverlayEntry(Offset offset, Size size) {
    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height,
        
        width: size.width+40,
        child: Material(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          elevation: 2,
          child: Container(
            decoration: BoxDecoration(
              color: widget.backgroundColor ?? Colors.white,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(color: widget.borderColor),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: widget.items
                  .map(
                    (item) => GestureDetector(
                      onTap: () {
                        widget.onChanged(item);
                        _closeDropdown();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        child: Text(
                          item.title,
                          style: const TextStyle(fontSize: 16, color:  Colors.white,),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleDropdown,
      child: Container(
        key: _dropdownKey,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          // border: Border.all(color: widget.borderColor),
        ),
        padding: widget.padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selectedItem?.title ?? widget.hintText,
              style: TextStyle(
                fontSize: 16,

                color:  Colors.white,
              ),
            ),
            widget.icon ??
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
          ],
        ),
      ),
    );
  }
}
