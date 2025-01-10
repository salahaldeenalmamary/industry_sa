import 'package:appriverpod/config/translations/localization_service.dart';
import 'package:appriverpod/utils/image.dart';
import 'package:flutter/material.dart'; 
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter_svg/flutter_svg.dart';


class DotIcon extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;

  DotIcon({
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey;
  final ValueChanged<int> onTap;
  final int currentIndex;

  CustomBottomNavigationBar({
    Key? key,
    required this.bottomNavigationKey,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String homeLabel = context.l10n.bottomNavHome;
    String categoriesLabel = context.l10n.bottomNavCategories;
    String priceOffersLabel = context.l10n.bottomNavPriceOffers;
    String factoriesLabel = context.l10n.bottomNavFactories;
    String cartLabel = context.l10n.bottomNavCart;

    return CurvedNavigationBar(
      color: Theme.of(context).canvasColor,
      backgroundColor: Theme.of(context).primaryColor,
      animationDuration: Duration(milliseconds: 300),
      key: bottomNavigationKey,
      items: [
        CurvedNavigationBarItem(
          child: DotIcon(
            icon: ImageConstants.homeIcon,
            label: homeLabel,
            isSelected: currentIndex == 0,
          ),
          label: homeLabel,
        ),
        CurvedNavigationBarItem(
          child: DotIcon(
            icon: ImageConstants.catecoryIcon,
            label: categoriesLabel,
            isSelected: currentIndex == 1,
          ),
          label: categoriesLabel,
        ),
        CurvedNavigationBarItem(
          child: DotIcon(
            icon: ImageConstants.offerPriceIcon,
            label: priceOffersLabel,
            isSelected: currentIndex == 2,
          ),
          label: priceOffersLabel,
        ),
        CurvedNavigationBarItem(
          child: DotIcon(
            icon: ImageConstants.factoryIcon,
            label: factoriesLabel,
            isSelected: currentIndex == 3,
          ),
          label: factoriesLabel,
        ),
        CurvedNavigationBarItem(
          child: DotIcon(
            icon: ImageConstants.cartIcon,
            label: cartLabel,
            isSelected: currentIndex == 4,
          ),
          label: cartLabel,
        ),
      ],
      onTap: onTap,
      index: currentIndex,
    );
  }
}
