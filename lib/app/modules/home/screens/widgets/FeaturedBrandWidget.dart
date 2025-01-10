import 'package:flutter/material.dart';

import '../../../../data/models/home/Featured.dart';
import '../../../../widget/custom_image_view.dart';

class FeaturedBrandWidget extends StatelessWidget {
  final FeaturedBrandModel brand;

  FeaturedBrandWidget({required this.brand});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: CustomImageView(
          imagePath: brand!.image,
        ),
      ),
    );
  }
}
