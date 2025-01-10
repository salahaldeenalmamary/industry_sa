import 'package:flutter/material.dart';

import '../core/model/selectionPopupModel/selection_popup_model.dart';




enum SelectionMode { radio, checkbox }

class CustomModalSelectionWidget extends StatefulWidget {
  final String title;
  final String  Select;
  final List<SelectionPopupModel> options;
  final Function(List<SelectionPopupModel>) onOptionsSelected;
  final SelectionMode selectionMode;

  const CustomModalSelectionWidget({
    Key? key,
    required this.title,
    this.Select="Select",
    required this.options,
    required this.onOptionsSelected,
    this.selectionMode = SelectionMode.checkbox,
  }) : super(key: key);

  @override
  _CustomModalSelectionWidgetState createState() =>
      _CustomModalSelectionWidgetState();
}

class _CustomModalSelectionWidgetState extends State<CustomModalSelectionWidget> {
  void _showModalSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final option = widget.options[index];
                        return ListTile(
                          title: Text(option.title),
                          trailing: widget.selectionMode == SelectionMode.checkbox
                              ? Checkbox(
                                  value: option.isSelected,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      option.isSelected = value ?? false;
                                    });
                                  },
                                )
                              : Radio<SelectionPopupModel>(
                                  value: option,
                                  groupValue: widget.options.firstWhere(
                                    (option) => option.isSelected,
                                    orElse: () => SelectionPopupModel(
                                      title: '',
                                      isSelected: false,
                                    ),
                                  ),
                                  onChanged: (SelectionPopupModel? value) {
                                    setState(() {
                                      for (var option in widget.options) {
                                        option.isSelected = false;
                                      }
                                      value?.isSelected = true;
                                    });
                                  },
                                ),
                          onTap: () {
                            setState(() {
                              if (widget.selectionMode == SelectionMode.checkbox) {
                                option.isSelected = !option.isSelected;
                              } else {
                                for (var option in widget.options) {
                                  option.isSelected = false;
                                }
                                option.isSelected = true;
                              }
                            });
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ElevatedButton(
                      onPressed: () {
                        final selectedOptions = widget.options
                            .where((option) => option.isSelected)
                            .toList();
                        Navigator.pop(context);
                        widget.onOptionsSelected(selectedOptions);
                      },
                      child:  Text(widget.Select),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _showModalSheet,
      child: Text(widget.title),
    );
  }
}