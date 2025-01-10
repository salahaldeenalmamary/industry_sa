import 'package:appriverpod/app/core/extensions/indext.dart';
import 'package:appriverpod/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;
  final bool autofocus;
  final Widget? suffix;

  const SearchField({
    Key? key,
    this.hintText = 'Search...',
    this.prefixIcon = Icons.search,
    this.onChanged,
    this.onSubmitted,
    this.suffix,
    this.controller,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        elevation: 1,
        color: Theme.of(context).primaryColor,
        child: Row(
          children: [
            TextField(
              controller: controller,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              autofocus: autofocus,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: hintText,
                  isDense: true,
                  hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.7)), // Hint text color
                  prefixIcon: SvgPicture.asset(
                    ImageConstants.searchIcon,
                  ),
                  prefixIconConstraints:
                      BoxConstraints(minHeight: 25, minWidth: 40),
                  border: InputBorder.none,
                  fillColor: Theme.of(context).primaryColor,
                  filled: true,
                  contentPadding: EdgeInsets.only(top: 10, bottom: 10)),
            ).expanded(),
            Container(
              color: Colors.grey,
              height: 30,
              width: 2,
            ),
            suffix!,
          ],
        ));
  }
}
