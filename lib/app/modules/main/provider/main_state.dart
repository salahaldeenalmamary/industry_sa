import 'package:appriverpod/generated/l10n.dart';
import 'package:equatable/equatable.dart';
import '../../../core/base/BaseState.dart';
import '../../../core/model/page_state.dart';
import '../../../core/model/selectionPopupModel/selection_popup_model.dart';
import '../../../data/models/common/appConfig.dart';
import '../../../widget/selectable_item_bottom_sheet_widget.dart';

class MainState extends BaseState<AppConfig> with EquatableMixin {
  SelectionPopupModel? selectionSearchItem;
  List<SelectionPopupModel> searchItems = [
    SelectionPopupModel(id: 1, title: S.current.all, isSelected: true),
    SelectionPopupModel(id: 2, title: S.current.factories),
    SelectionPopupModel(id: 3, title: S.current.products),
  ];
  SelectableItem<Object?>? selectedItemShipping;

  MainState({
    required AppConfig? data,
    this.selectionSearchItem,
    bool actionLoading = false,
    PageState pageState = PageState.DEFAULT,
    String message = '',
    String errorMessage = '',
    String successMessage = '',
    bool refreshPage = false,
    this.selectedItemShipping,
  }) : super(
          data: data,
          actionLoading: actionLoading,
          pageState: pageState,
          message: message,
          errorMessage: errorMessage,
          successMessage: successMessage,
          refreshPage: refreshPage,
        );

  static MainState initial() {
    return MainState(
      data: AppConfig(),
      actionLoading: false,
      pageState: PageState.LOADING,
      message: '',
      errorMessage: '',
      successMessage: '',
      selectionSearchItem: SelectionPopupModel(id: 1, title:  S.current.all),
      refreshPage: false,
    );
  }

  MainState copyWith({
    AppConfig? data,
    SelectionPopupModel? selectionSearchItem,
    bool? actionLoading,
    PageState? pageState,
    String? message,
    String? errorMessage,
    String? successMessage,
    bool? refreshPage,
    SelectableItem<Object?>? selectedItemShipping,
  }) {
    return MainState(
      data: data ?? this.data,
      selectionSearchItem: selectionSearchItem ?? this.selectionSearchItem,
      actionLoading: actionLoading ?? this.actionLoading,
      pageState: pageState ?? this.pageState,
      message: message ?? this.message,
      selectedItemShipping: selectedItemShipping ?? this.selectedItemShipping,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
      refreshPage: refreshPage ?? this.refreshPage,
    );
  }

  @override
  List<Object?> get props => [
        data,
        actionLoading,
        pageState,
        message,
        errorMessage,
        successMessage,
        selectedItemShipping,
        refreshPage,
        selectionSearchItem,
        ...super.props,
      ];
}
