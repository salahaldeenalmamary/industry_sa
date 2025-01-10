
import 'package:flutter/material.dart';

class TDSideBarItem {
  const TDSideBarItem({
    Key? key,
    
    this.disabled = false,
    this.icon,
    this.textStyle,
    this.label = '',
    this.value = -1,
  });

  
  final bool disabled;

  
  final IconData? icon;

  
  final String label;

  
  final TextStyle? textStyle;

  
  final int value;
}
