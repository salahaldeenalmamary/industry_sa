import 'package:appriverpod/app/core/extensions/indext.dart';
import 'package:appriverpod/app/widget/custom_image_view.dart';
import 'package:flutter/material.dart';

import '../../../data/models/common/category.dart';

class ChildCategoryWidget extends StatelessWidget {
  final ChildCategory? childCategory;

  const ChildCategoryWidget({
    Key? key,
    required this.childCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
    
      dense: true,
      minTileHeight: 50,
      title: Text(
        childCategory?.title ?? '',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      children: [
        
        if (childCategory?.children != null &&
            childCategory!.children!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: GridView.builder(
              shrinkWrap:
                  true, 
              physics:
                  NeverScrollableScrollPhysics(), 
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    2, 
                crossAxisSpacing: 8.0, 
                mainAxisSpacing: 8.0,
              ),
              itemCount: childCategory!.children!.length,
              itemBuilder: (context, index) {
                final subChild = childCategory!.children![index];
                return SubChildCategoryWidget(
                  subChildCategory: subChild,
                  parentImage: childCategory
                      ?.image, // Passing parent's image to the child
                );
              },
            ),
          ),
      ],
    );
  }
}

class SubChildCategoryWidget extends StatelessWidget {
  final SubChildCategory subChildCategory;
  final String? parentImage; 

  const SubChildCategoryWidget({
    Key? key,
    required this.subChildCategory,
    required this.parentImage, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (parentImage != null)
            CustomImageView(imagePath: parentImage!, height: 50),
          SizedBox(height: 2), 
          Text(
            subChildCategory.title,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ).expanded(),
        ],
      ),
    );
  }
}
