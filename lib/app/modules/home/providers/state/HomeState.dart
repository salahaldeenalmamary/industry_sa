import '../../../../core/base/BaseState.dart';
import '../../../../core/model/page_state.dart';
import '../../../../data/models/home/Deal.dart';
import '../../../../data/models/homeApiResponse.dart';
import 'package:equatable/equatable.dart';

class HomeState extends BaseState<HomeApiResponse> with EquatableMixin {
  final Deal? selectedDeal; 
  HomeState({
    required HomeApiResponse? data,
    bool actionLoading = false,
    PageState pageState = PageState.DEFAULT,
    String message = '',
    String errorMessage = '',
    String successMessage = '',
    bool refreshPage = false,
    this.selectedDeal, 
  }) : super(
          data: data,
          actionLoading: actionLoading,
          pageState: pageState,
          message: message,
          errorMessage: errorMessage,
          successMessage: successMessage,
          refreshPage: refreshPage,
        );

  static HomeState initial() {
    return HomeState(
      data: HomeApiResponse(), 
      actionLoading: false,
      pageState: PageState.LOADING,
      message: '',
      errorMessage: '',
      successMessage: '',
      refreshPage: false,
      selectedDeal: null, 
    );
  }

  HomeState copyWith({
    HomeApiResponse? data,
    bool? actionLoading,
    PageState? pageState,
    String? message,
    String? errorMessage,
    String? successMessage,
    bool? refreshPage,
    Deal? selectedDeal,
  }) {
    return HomeState(
      data: data ?? this.data,
      actionLoading: actionLoading ?? this.actionLoading,
      pageState: pageState ?? this.pageState,
      message: message ?? this.message,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
      refreshPage: refreshPage ?? this.refreshPage,
      selectedDeal: selectedDeal ?? this.selectedDeal, 
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
        refreshPage,
        selectedDeal,
        ...super.props, 
      ];
}
