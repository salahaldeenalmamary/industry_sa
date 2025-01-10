import 'package:appriverpod/app/core/extensions/indext.dart';
import 'package:appriverpod/app/widget/custom_image_view.dart';
import 'package:appriverpod/config/translations/localization_service.dart';
import 'package:flutter/material.dart';
import '../../../../../config/theme/light_theme_colors.dart';
import '../../../../data/models/Product.dart';

class ProductWidget extends StatelessWidget {
  final Product? product;

  const ProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Card.outlined(
          margin: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                child: Container(
                    color: Colors.grey.shade100,
                    height: 200,
                    child: CustomImageView(
                        imagePath: product?.image,
                        width: double.infinity,
                        fit: BoxFit.fitWidth)),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product?.title ?? '',
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                              color: LightThemeColors.primaryTextColor,
                            fontSize: 14,
                          ),
                    ),
                    if (product?.productPrices?.isNotEmpty == true)
                      for (var pro in product?.productPrices ?? [])
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(),
                                Expanded(
                                  flex: 2,
                                  child: RichText(
                                    text: TextSpan(
                                      text:
                                          '${pro.unitPrice}', // First part: unit price
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontSize: 16,
                                          ),
                                      children: [
                                        TextSpan(
                                          text:
                                              '${context.l10n.currency}', // Second part: currency
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                fontSize: 16,
                                                color: LightThemeColors.primaryTextColor, // Currency color
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '/ ${product?.productUnitName}', // Third part: unit name
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                fontSize: 16,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (pro.discountPercent != null &&
                                    pro.discountPercent != 0)
                                  Text(
                                    ' ${pro.discountPercent}%',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontSize: 16,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                  ).expanded(),
                              ],
                            ),
                          ],
                        ),
                    const SizedBox(height: 3),
                    if (product?.minQuantity != null)
                      Text(
                        '${context.l10n.minAllowedQuantityOrder}:${product?.minQuantity}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                      ),
                    Text(
                      '${context.l10n.numberOfCarton}:${product?.numberOfCarton}',
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: InkWell(
            onTap: () {},
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.favorite_border,
                color: Theme.of(context).colorScheme.primary,
                size: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
