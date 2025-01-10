import 'package:appriverpod/app/core/extensions/indext.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/home/Featured.dart';
import '../../../../widget/custom_image_view.dart';

class FeaturedCategoryWidget extends StatelessWidget {
  final FeaturedCategoryModel category;
  final double imageHeight;
  final double borderRadius;
  final EdgeInsetsGeometry margin;
  final double elevation;
  final TextStyle? titleStyle;

  const FeaturedCategoryWidget({
    Key? key,
    required this.category,
    this.imageHeight = 80.0,
    this.borderRadius = 50,
    this.margin = const EdgeInsets.all(8.0),
    this.elevation = 4.0,
    this.titleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Card.outlined(child:  CustomImageView(
              imagePath: category.image,
            
              width: double.infinity,
              height: imageHeight,
              fit: BoxFit.contain,
            ),),
          Padding(
            padding: const EdgeInsets.only(bottom:  3.0, top: 3),
            child: Text(
              category.title,
              style: titleStyle ?? Theme.of(context).textTheme.bodySmall,
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      )
    ;
  }
}
