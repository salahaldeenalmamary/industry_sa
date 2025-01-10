import 'package:appriverpod/app/core/extensions/indext.dart'; // Assuming the .elevation extension is defined here
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  // Optional custom styling parameters
  final TextStyle? titleStyle;
  final Color? arrowColor;
  final double? arrowSize;
  final EdgeInsetsGeometry? padding;
  final double elevation;

  const SectionTitle({
    Key? key,
    required this.title,
    this.onTap,
    this.titleStyle,
    this.arrowColor,
    this.arrowSize,
    this.padding,
    this.elevation = 4.0, // Default elevation value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 8.0), // Use custom padding or default
        child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: titleStyle ??
                      Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          
                          ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: arrowSize ?? 16.0,
                  color: arrowColor ?? Theme.of(context).primaryColor, 
                ),
              ],
            ),
          ),
    )
      
    ;
  }
}
