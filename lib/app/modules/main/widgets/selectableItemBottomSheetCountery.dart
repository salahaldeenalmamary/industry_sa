import 'package:appriverpod/app/core/extensions/indext.dart';
import 'package:appriverpod/app/modules/main/provider/main_provider.dart';
import 'package:appriverpod/config/translations/localization_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../utils/image.dart';
import '../../../widget/selectable_item_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

class SelectableItemBottomSheetCountry extends ConsumerWidget {
  const SelectableItemBottomSheetCountry({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainProvider);
    return SelectableItemBottomSheet(
      title: context.l10n.chooseYourLocation,
      canSearchItems: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(ImageConstants.adreesIcon, fit: BoxFit.contain,),
          const SizedBox(width: 8),
          Text(
            context.l10n.shippingTo,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ).expanded(),
          const SizedBox(width: 4),
          Text(
            state.selectedItemShipping?.title ?? '',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis, 
          ).expanded(flex: 2),
        ],
      ).container(color:LightThemeColors.primaryTextColor, height: 40),
      selectableItems: state.data?.countries
              ?.map(
                (e) => SelectableItem(title: e.name, isSelected: false),
              )
              .toList() ??
          [],
      selectedItem: state.selectedItemShipping,
      onItemSelected: (selectedItem) {
        ref.read(mainProvider.notifier).handleSelectedShipping(selectedItem);
      },
    );
  }
}
