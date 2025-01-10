import 'package:flutter/material.dart';
import '../../../../core/model/selectionPopupModel/selection_popup_model.dart';

class FilterPopup extends StatefulWidget {
  final List<SelectionPopupModel> optionsSelected;
  final double priceFrom;
  final double priceTo;
  final void Function(List<SelectionPopupModel>, double, double) onApply;

  FilterPopup({
    required this.optionsSelected,
    required this.priceFrom,
    required this.priceTo,
    required this.onApply,
  });

  @override
  _FilterPopupState createState() => _FilterPopupState();
}

class _FilterPopupState extends State<FilterPopup> {
  late List<SelectionPopupModel> _optionsSelected;
  late double _priceFrom;
  late double _priceTo;

  @override
  void initState() {
    super.initState();
    _optionsSelected = [];
    _priceFrom = widget.priceFrom;
    _priceTo = widget.priceTo;
  }

  void _applyFilters() {
    widget.onApply(_optionsSelected, _priceFrom, _priceTo);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             Text(
              'Price ',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            RangeSlider(
              min: 0,
              max: 10000,
              values: RangeValues(_priceFrom, _priceTo),
              divisions: 100,
              labels: RangeLabels(
                _priceFrom.toStringAsFixed(0),
                _priceTo.toStringAsFixed(0),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _priceFrom = values.start;
                  _priceTo = values.end;
                });
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Filter Options',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            ...widget.optionsSelected.map((option) => CheckboxListTile(
                  title: Text(option.title),
                  value: option.isSelected,
                  onChanged: (value) {
                    setState(() {
                      option.isSelected = value ?? false;
                    });
                    if (option.isSelected) {
                      _optionsSelected.add(option);
                    } else if (!option.isSelected &&
                        _optionsSelected.contains(option)) {
                      _optionsSelected.remove(option);
                    }
                  },
                )),
            const SizedBox(height: 16),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: _applyFilters,
                  child: Text('Apply'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
