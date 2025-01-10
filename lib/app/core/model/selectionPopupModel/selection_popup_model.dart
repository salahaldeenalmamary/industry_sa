class SelectionPopupModel {
  int? id;
  String title;
  dynamic value;
  bool isSelected;

  SelectionPopupModel({
    this.id,
    required this.title,
    this.value,
    this.isSelected = false,
  });

  
  SelectionPopupModel copyWith({
    int? id,
    String? title,
    dynamic value,
    bool? isSelected,
  }) {
    return SelectionPopupModel(
      id: id ?? this.id,
      title: title ?? this.title,
      value: value ?? this.value,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
