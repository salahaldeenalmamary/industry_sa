import 'package:equatable/equatable.dart';
import '/app/core/model/page_state.dart';

class BaseState<T> extends Equatable {
  final bool actionLoading;
  final PageState pageState;
  final String message;
  final String errorMessage;
  final String successMessage;
  final bool refreshPage;
  final T? data; 

  BaseState({
    this.actionLoading = false,
    this.pageState = PageState.DEFAULT,
    this.message = '',
    this.errorMessage = '',
    this.successMessage = '',
    this.refreshPage = false,
    this.data, 
  });

 static BaseState<T> initial<T>() {
    return BaseState<T>(
      actionLoading: false,
      pageState: PageState.DEFAULT,
      message: '',
      errorMessage: '',
      successMessage: '',
      refreshPage: false,
      data: null, 
    );
  }

  BaseState<T> copyWith({
    bool? actionLoading,
    PageState? pageState,
    String? message,
    String? errorMessage,
    String? successMessage,
    bool? refreshPage,
    T? data, 
  }) {
    return BaseState<T>(
      actionLoading: actionLoading ?? this.actionLoading,
      pageState: pageState ?? this.pageState,
      message: message ?? this.message,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
      refreshPage: refreshPage ?? this.refreshPage,
      data: data ?? this.data, 
    );
  }

  @override
  List<Object?> get props => [
        actionLoading,
        pageState,
        message,
        errorMessage,
        successMessage,
        refreshPage,
        data, 
      ];
}
