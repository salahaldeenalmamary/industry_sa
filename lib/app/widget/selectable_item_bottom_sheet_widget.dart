import 'package:flutter/material.dart';

/// Represents an item that can be selected in the SelectableItemBottomSheet.
class SelectableItem<T> {
  /// The title of the selectable item.
  final String title;

  /// Indicates whether the item is currently selected.
  bool isSelected;

  /// The value associated with the selectable item.
  final T? value;

  SelectableItem({required this.title, this.isSelected = false, this.value});

  /// Creates a copy of the SelectableItem with optional parameter overrides.
  SelectableItem<T> copyWith({
    String? title,
    bool? isSelected,
    T? value,
  }) {
    return SelectableItem(
      title: title ?? this.title,
      isSelected: isSelected ?? this.isSelected,
      value: value ?? this.value,
    );
  }
}

class SelectableItemBottomSheet<T> extends StatefulWidget {
  /// The title of the bottom sheet.
  final String title;

  /// Callback function for single item selection.
  final Function(SelectableItem<T>)? onItemSelected;

  /// Callback function for multiple item selection.
  final Function(List<SelectableItem<T>>)? onItemsSelected;

  /// List of selectable items.
  final List<SelectableItem<T>> selectableItems;

  /// Initially selected item for single selection mode.
  final SelectableItem<T>? selectedItem;

  /// Initially selected items for multiple selection mode.
  final List<SelectableItem<T>>? initialSelectedItems;

  /// Flag to enable multiple selection mode.
  final bool isMultipleSelection;

  /// Flag to enable search functionality.
  final bool canSearchItems;

  ///to add a custom view
  final Widget? child;

  const SelectableItemBottomSheet({
    super.key,
    required this.title,
    required this.selectableItems,
    this.onItemSelected,
    this.onItemsSelected,
    this.selectedItem,
    this.initialSelectedItems,
    this.isMultipleSelection = false,
    this.canSearchItems = false,
    this.child,
  }) : assert(
            (isMultipleSelection && onItemsSelected != null) ||
                (!isMultipleSelection && onItemSelected != null),
            "Provide onItemSelected for single selection or onItemsSelected for multiple selection");

  @override
  State<StatefulWidget> createState() => _SelectableItemBottomSheetState<T>();
}

class _SelectableItemBottomSheetState<T>
    extends State<SelectableItemBottomSheet<T>> {
  late List<SelectableItem<T>> _items;
  late List<SelectableItem<T>> _filteredItems;
  late List<SelectableItem<T>> _selectedItems;
  late List<SelectableItem<T>> _tempSelectedItems;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.selectableItems);
    _filteredItems = List.from(_items);
    _selectedItems = widget.isMultipleSelection
        ? (widget.initialSelectedItems != null
            ? List.from(widget.initialSelectedItems!)
            : [])
        : (widget.selectedItem != null ? [widget.selectedItem!] : []);
    _tempSelectedItems = List.from(_selectedItems);
    _searchController = TextEditingController();

    for (var item in _selectedItems) {
      final index = _items.indexWhere((element) => element.value == item.value);
      if (index != -1) {
        _items[index].isSelected = true;
      }
    }
    _updateFilteredItems();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchItems(String value) {
    setState(() {
      if (value.length > 1) {
        _filteredItems = _items
            .where((element) =>
                element.title.toLowerCase().contains(value.toLowerCase()))
            .toList();
      } else {
        _updateFilteredItems();
      }
    });
  }

  void _updateFilteredItems() {
    _filteredItems = [
      ..._tempSelectedItems,
      ..._items.where((item) => !_tempSelectedItems.contains(item))
    ];
  }

  void _toggleItemSelection(SelectableItem<T> item) {
    setState(() {
      if (widget.isMultipleSelection) {
        item.isSelected = !item.isSelected;
        if (item.isSelected) {
          _tempSelectedItems.add(item);
        } else {
          _tempSelectedItems
              .removeWhere((element) => element.value == item.value);
        }
      } else {
        _tempSelectedItems.clear();
        _tempSelectedItems.add(item);
        for (var element in _items) {
          element.isSelected = element.value == item.value;
        }
      }
    });
  }

  void _showItemListModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isDismissible: !widget.isMultipleSelection,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(0.0),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.5,
              maxChildSize: 0.7,
              expand: false,
              builder: (_, scrollController) {
                return WillPopScope(
                  onWillPop: () async {
                    _tempSelectedItems = List.from(_selectedItems);
                    _updateFilteredItems();
                    return true;
                  },
                  child: Container(
                    color: Theme.of(context).cardColor,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Theme.of(context).cardColor,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 10, top: 22, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.title,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _tempSelectedItems =
                                        List.from(_selectedItems);
                                    _updateFilteredItems();
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(Icons.close),
                                ),
                              ],
                            ),
                          ),
                        ),
                        CustomPaint(
                          size: const Size(double.infinity, 4),
                          painter: SharpDividerPainter(),
                        ),
                        if (widget.canSearchItems)
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 14, top: 10, bottom: 10),
                            child: TextField(
                              controller: _searchController,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _searchItems(value);
                                });
                              },
                              decoration: InputDecoration(
                                hintText: "",
                                hintStyle: const TextStyle(
                                    fontSize: 11, color: Color(0xFF9E9E9E)),
                                prefixIcon: const Icon(Icons.search,
                                    color: Color(0xFF9E9E9E), size: 20),
                                suffixIcon: _searchController.text.isNotEmpty
                                    ? IconButton(
                                        icon: const Icon(
                                          Icons.clear,
                                          color: Color(0xFF9E9E9E),
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _searchController.clear();
                                            _updateFilteredItems();
                                          });
                                        },
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            controller: scrollController,
                            itemCount: _filteredItems.length,
                            itemBuilder: (context, index) {
                              final item = _filteredItems[index];
                              return Column(
                                children: [
                                  ListTile(
                                    contentPadding: const EdgeInsets.only(
                                        left: 24, right: 14),
                                    title: Text(
                                      item.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: _tempSelectedItems.contains(item)
                                            ? const Color(0xFF50BEA7)
                                            : const Color(0xFF777777),
                                      ),
                                    ),
                                    trailing: _tempSelectedItems.contains(item)
                                        ? Container(
                                            alignment: Alignment.center,
                                            width: 22,
                                            height: 22,
                                            margin:
                                                const EdgeInsets.only(right: 8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xFF50BEA7),
                                                  width: 1.5),
                                            ),
                                            child: const Icon(
                                              Icons.check_rounded,
                                              color: Color(0xFF50BEA7),
                                              size: 16,
                                            ),
                                          )
                                        : null,
                                    onTap: () {
                                      setState(() {
                                        _toggleItemSelection(item);
                                      });
                                      if (!widget.isMultipleSelection) {
                                        widget.onItemSelected?.call(item);
                                        Navigator.pop(context);
                                      }
                                    },
                                  ),
                                  if (index != _filteredItems.length - 1)
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Divider(
                                        thickness: .2,
                                        height: .5,
                                      ),
                                    ),
                                ],
                              );
                            },
                          ),
                        ),
                        if (widget.isMultipleSelection)
                          Container(
                            padding: const EdgeInsets.only(
                                left: 24, right: 14, top: 10, bottom: 10),
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(.4),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              )
                            ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      _tempSelectedItems =
                                          List.from(_selectedItems);
                                      _updateFilteredItems();
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(
                                        fontSize: 11,
                                        decoration: TextDecoration.underline,
                                        color: Color(0xFF292A2B),
                                      ),
                                    )),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    _selectedItems =
                                        List.from(_tempSelectedItems);
                                    widget.onItemsSelected
                                        ?.call(_selectedItems);
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      backgroundColor: const Color(0xFF292A2B)),
                                  child: const Text('Save',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    ).then((_) {
      setState(() {
        if (widget.isMultipleSelection) {
          _tempSelectedItems = List.from(_selectedItems);
          for (var filterElement in _filteredItems) {
            filterElement.isSelected = _selectedItems.any((selectedElement) =>
                selectedElement.value == filterElement.value ||
                selectedElement.title == filterElement.title);
          }
        } else {
          _selectedItems = List.from(_tempSelectedItems);
        }
        _updateFilteredItems();
      });
    });
    _searchController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    if (widget.child != null) {
      return GestureDetector(
          onTap: () => _showItemListModal(context), child: widget.child!);
    }
    return GestureDetector(
      onTap: () => _showItemListModal(context),
      child: Container(
        padding:
            const EdgeInsets.only(left: 24, right: 18, top: 11, bottom: 11),
        decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _selectedItems.isEmpty
                  ? "Select"
                  : _selectedItems.length == 1
                      ? _selectedItems.first.title
                      : "${_selectedItems.length} items selected",
              style: const TextStyle(fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
            ),
          ],
        ),
      ),
    );
  }
}

class SharpDividerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..shader = const LinearGradient(
        colors: [Colors.transparent, Colors.grey, Colors.transparent],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width, size.height / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
