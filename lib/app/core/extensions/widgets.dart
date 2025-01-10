import 'package:flutter/material.dart';

import '../../routes/app_pages.dart';


extension Widgetextension on Widget {




  Widget expanded({int flex = 1}) {
    return Expanded(
      child: this,
      flex: flex,
    );
  }

  Widget constrained({
    Key? key,
    double? width,
    double? height,
    double minWidth = 0.0,
    double maxWidth = double.infinity,
    double minHeight = 0.0,
    double maxHeight = double.infinity,
  }) {
    BoxConstraints constraints = BoxConstraints(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    );
    constraints = (width != null || height != null)
        ? constraints.tighten(width: width, height: height)
        : constraints;
    return ConstrainedBox(
      key: key,
      constraints: constraints,
      child: this,
    );
  }

  Widget container({Color? color,double? height}) {
    return Container(
      child: this,
      height: height,
     color: color);
  }

  

  Widget elevation(
    double elevation, {
    Key? key,
    MaterialType type = MaterialType.canvas,
    BorderRadiusGeometry borderRadius = BorderRadius.zero,
    Color shadowColor = const Color(0xFF000000),
  }) =>
      Material(
        key: key,
        type:type,
        elevation: elevation,
        borderRadius: borderRadius,
        shadowColor: shadowColor,
        child: this,
      );

  Widget decorated({
    Key? key,
    Color? color,
    DecorationImage? image,
    BoxBorder? border,
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    BoxShape shape = BoxShape.rectangle,
    DecorationPosition position = DecorationPosition.background,
  }) {
    BoxDecoration decoration = BoxDecoration(
      color: color,
      image: image,
      border: border,
      borderRadius: borderRadius,
      boxShadow: boxShadow,
      gradient: gradient,
      backgroundBlendMode: backgroundBlendMode,
      shape: shape,
    );
    return DecoratedBox(
      key: key,
      decoration: decoration,
      position: position,
      child: this,
    );
  }

  Widget border({
    Key? key,
    double? all,
    double? left,
    double? right,
    double? top,
    double? bottom,
    double? radius,
    Color? backgroundColor,
    Color color = const Color(0xFF000000),
    BorderStyle style = BorderStyle.solid,
  }) {
    Border border = Border(
      left: (left ?? all) == null
          ? BorderSide.none
          : BorderSide(color: color, width: left ?? all ?? 0, style: style),
      right: (right ?? all) == null
          ? BorderSide.none
          : BorderSide(color: color, width: right ?? all ?? 0, style: style),
      top: (top ?? all) == null
          ? BorderSide.none
          : BorderSide(color: color, width: top ?? all ?? 0, style: style),
      bottom: (bottom ?? all) == null
          ? BorderSide.none
          : BorderSide(color: color, width: bottom ?? all ?? 0, style: style),
    );
    BorderRadius borderRadius = BorderRadius.all(Radius.circular(radius ?? 0));
    return decorated(
      color: backgroundColor,
      key: key,
      border: border,
      borderRadius: borderRadius,
    );
  }

  Widget clipRRect({
    Key? key,
    double? all,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
    CustomClipper<RRect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) =>
      ClipRRect(
        key: key,
        clipper: clipper,
        clipBehavior: clipBehavior,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft ?? all ?? 0.0),
          topRight: Radius.circular(topRight ?? all ?? 0.0),
          bottomLeft: Radius.circular(bottomLeft ?? all ?? 0.0),
          bottomRight: Radius.circular(bottomRight ?? all ?? 0.0),
        ),
        child: this,
      );
  Widget visibility({
    Key? key,
    required bool visible,
    bool maintainSize = false,
    bool maintainState = false,
    bool maintainAnimation = false,
  }) =>
      Visibility(
        key: key,
        visible: visible,
        maintainSize: maintainSize,
        maintainState: maintainState,
        maintainAnimation: maintainAnimation,
        child: this,
      );
  Widget inkWell({
    Key? key,
    Color? color,
    double? borderRadius,
    Function()? onTap,
    Function()? onLongPress,
  }) =>
      Material(
        color: color ?? Colors.transparent,
        child: Ink(
          child: InkWell(
            borderRadius: borderRadius != null
                ? BorderRadius.all(
                    Radius.circular(borderRadius),
                  )
                : null,
            onTap: onTap ?? () {},
            onLongPress: onLongPress ?? () {},
            child: this,
          ),
        ),
      );
  Widget onTap(
    GestureTapCallback? onTap, {
    Key? key,
    bool excludeFromSemantics = false,
  }) =>
      InkWell(
        key: key,
        onTap: onTap,
        excludeFromSemantics: excludeFromSemantics,
        child: this,
      );

       Widget boxShadow({
    Key? key,
    Color color = Colors.black,
    Offset offset = Offset.zero,
    double blurRadius = 0.0,
    double spreadRadius = 0.0,
    BlurStyle blurStyle = BlurStyle.normal,
  }) {
    List<BoxShadow> boxShadow = [
      BoxShadow(
        color: color,
        offset: offset,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
        blurStyle: blurStyle,
      ),
    ];
    return decorated(
      key: key,
      boxShadow: boxShadow,
    );
  }

}

extension WidgetPaddingX on Widget {
  Widget paddingAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Padding(
          padding:
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          child: this);

  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
          padding: EdgeInsets.only(
              top: top, left: left, right: right, bottom: bottom),
          child: this);

  Widget get paddingZero => Padding(padding: EdgeInsets.zero, child: this);
}

/// Add margin property to widget
extension WidgetMarginX on Widget {
  Widget marginAll(double margin) =>
      Container(margin: EdgeInsets.all(margin), child: this);

  Widget marginSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Container(
          margin:
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          child: this);

  Widget marginOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Container(
          margin: EdgeInsets.only(
              top: top, left: left, right: right, bottom: bottom),
          child: this);

  Widget get marginZero => Container(margin: EdgeInsets.zero, child: this);
}


extension WidgetSliverBoxX on Widget {
  Widget get sliverBox => SliverToBoxAdapter(child: this);
}
