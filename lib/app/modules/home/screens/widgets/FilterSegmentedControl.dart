import 'package:appriverpod/app/core/extensions/indext.dart';
import 'package:flutter/material.dart';
import 'package:appriverpod/app/data/models/home/Deal.dart';

import '../../../../../config/theme/light_theme_colors.dart';

class FilterChoiceTaps extends StatelessWidget {
  final List<Deal> categories;
  final Deal? selectedCategory;
  final Function(Deal) onCategorySelected;

  const FilterChoiceTaps({
    Key? key,
    required this.categories,
    this.selectedCategory,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
       decoration: BoxDecoration(
                  color:   Colors.grey.shade100 ,
                  borderRadius: BorderRadius.circular(3),
                  
                ),
      child: SingleChildScrollView(
      scrollDirection: Axis.horizontal, 
      child: Row(
        children: categories.map((category) {
          final bool isSelected = selectedCategory?.id == category.id;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () => onCategorySelected(category),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white :null ,
                   borderRadius: BorderRadius.circular(10),
                  
                ),
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  category.categoryName,
                  style:
                  
                   TextStyle(
                    color: LightThemeColors.primaryTextColor ,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    ),);
  }
}
