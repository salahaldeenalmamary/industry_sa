import 'package:flutter/material.dart';


import 'td_sidebar.dart';

class TDWrapSideBarItem extends StatelessWidget {
  const TDWrapSideBarItem({
    Key? key,

    required this.disabled,
    this.icon,
    this.label = '',
    this.contentPadding,
    this.textStyle = const TextStyle(
      fontSize: 16,
      height: 1.5,
    ),
    this.selectedTextStyle,
    this.value = -1,
    this.selected = false,
    this.selectedColor,
    this.topAdjacent = false,
    this.bottomAdjacent = false,
    this.onTap,
    required this.style,
  }) : super(key: key);

 
  final bool disabled;
  final IconData? icon;
  final String label;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? textStyle;
  final TextStyle? selectedTextStyle;
  final int value;
  final bool selected;
  final Color? selectedColor;
  final bool topAdjacent;
  final bool bottomAdjacent;
  final VoidCallback? onTap;
  final TDSideBarStyle style;

  static const preLineWidth = 3.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: style == TDSideBarStyle.normal ? renderNormalItem(context) : renderOutlineItem(context),
    );
  }
Color getBackgroundColor(BuildContext context, bool selected) {
  final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final Color cardColor = Theme.of(context).cardColor;

  if (!isDarkMode) {
    return selected ? Colors.white : const Color.fromRGBO(243, 243, 243, 1);
  }
  return selected ? cardColor : Theme.of(context).primaryColor;
}


  Widget renderNormalItem(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:Theme.of(context).brightness == Brightness.dark? Theme.of(context).cardColor: Colors.white,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 56),
        child: Container(
          decoration: BoxDecoration(
              color:getBackgroundColor(context,selected),
              borderRadius: bottomAdjacent || topAdjacent
                  ? bottomAdjacent
                      ? const BorderRadius.only(bottomRight: Radius.circular(9))
                      : const BorderRadius.only(topRight: Radius.circular(9))
                  : null),
          child: Row(
            children: [
              renderPreLine(context),
              Expanded(
                  child: Padding(
                padding: contentPadding ?? const EdgeInsets.all(16),
                child: renderMainContent(context),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget renderOutlineItem(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 56),
        child: Container(
          height: 56,
          decoration: const BoxDecoration(color: Color.fromRGBO(246, 246, 246, 1)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                  color: selected && !disabled ? Colors.white : null, borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: renderMainContent(context),
              ),
            ),
          ),
        ));
  }

  Widget renderMainContent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        renderIcon(context),
        Expanded(
          child: renderLabel(context),
        ),
        // renderBadge(context)
        // SizedBox(
        //   width: !disabled && selected ? 0 : preLineWidth,
        // )
      ],
    );
  }

  Widget renderPreLine(BuildContext context) {
    return  Visibility(
          visible: !disabled && selected,
          replacement: const SizedBox(width:preLineWidth ,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: preLineWidth,
                height: 14,
                decoration: BoxDecoration(
                    color: selectedTextStyle != null
                        ? selectedTextStyle?.color
                        : (selectedColor ?? Theme.of(context).badgeTheme.backgroundColor),
                    borderRadius: BorderRadius.circular(4)),
              )
            ],
          ),
    );
  }

  Widget renderIcon(BuildContext context) {
    return Visibility(
        visible: icon != null,
        child: Padding(
          padding: const EdgeInsets.only(right: 2),
          child: Icon(
            icon,
            size: 20,
            color: disabled
                ? Theme.of(context).hintColor
                : selected
                    ? selectedTextStyle != null
                        ? selectedTextStyle?.color
                        : (selectedColor ?? Theme.of(context).bannerTheme.backgroundColor)
                    : Colors.black,
          ),
        ));
  }

  Widget renderLabel(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
              child: Text(
            label,
            
            style: selected ? (selectedTextStyle ?? TextStyle(color: selectedColor)) : textStyle,
            
          )),
          WidgetSpan(
              child: SizedBox(
            width: 1,
            height: 16,
            child: Stack(
              clipBehavior: Clip.none,
              children: [Container()],
            ),
          ))
        ],
      ),
      softWrap: true,
    );
  }

  Widget renderBadge(BuildContext context) {
    return SizedBox(
      width: 1,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            child:   Container(),
            left: 0,
            top: 0,
          ),
        ],
      ),
    );
  }
}
