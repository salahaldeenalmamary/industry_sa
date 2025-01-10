import 'package:flutter/material.dart';

class CustomSearchAnchorBar extends StatelessWidget {
  final List<String> suggestionsList;
  final BoxConstraints? constraints;
  final BoxConstraints? viewConstraints;
  final bool isFullScreen;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
Iterable<Widget>? barTrailing;
   CustomSearchAnchorBar({
    Key? key,
    required this.suggestionsList,
    this.constraints,
    this.barTrailing,
    this.viewConstraints,
    this.isFullScreen = false,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchAnchor.bar(
      barTrailing:barTrailing,
      barPadding: WidgetStatePropertyAll(EdgeInsets.all(3)),
      barElevation: WidgetStatePropertyAll(2),

      barOverlayColor: MaterialStateProperty.all(
          Theme.of(context).canvasColor), // Overlay color when active
      barShape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(8.0), // Rounded corners for the search bar
        ),
      ),
      onChanged: onChanged ??
          (query) {
            debugPrint('Query changed: $query');
          },
      onSubmitted: onSubmitted ??
          (query) {
            debugPrint('Query submitted: $query');
          },
      viewElevation: 1,
      constraints: constraints ?? const BoxConstraints(maxHeight: 300),
      viewConstraints: viewConstraints ?? const BoxConstraints(maxHeight: 200),
      isFullScreen: isFullScreen,
      viewBackgroundColor: Theme.of(context).cardColor,

      suggestionsBuilder: (context, controller) {
        final query = controller.text;
        final suggestions = suggestionsList
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();

        return suggestions.map((suggestion) {
          return ListTile(
            title: Text(suggestion),
            onTap: () {
              controller.text = suggestion;
              Navigator.pop(context);
            },
          );
        }).toList();
      },
    );
  }
}
