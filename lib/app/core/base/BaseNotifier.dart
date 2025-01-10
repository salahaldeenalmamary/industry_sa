import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/local/preference/preference_manager.dart';
import '../network/exceptions/timeout_exception.dart';
import '../../routes/app_pages.dart';
import '../utils/ShowMessage.dart';
import '/app/core/model/page_state.dart';
import '../network/exceptions/api_exception.dart';
import '../network/exceptions/app_exception.dart';
import '../network/exceptions/json_format_exception.dart';
import '../network/exceptions/network_exception.dart';
import '../network/exceptions/not_found_exception.dart';
import '../network/exceptions/service_unavailable_exception.dart';
import '../network/exceptions/unauthorize_exception.dart';
import 'BaseState.dart';

import 'package:flutter/material.dart';

class BaseNotifier<S extends BaseState> extends StateNotifier<S> {


  BaseNotifier( S initialState) : super(initialState);


  void setActionLoading(bool value) {
    state = state.copyWith(actionLoading: value) as S;
  }

  void updatePageState(PageState state) {
    this.state = this.state.copyWith(pageState: state) as S;
  }

  void resetPageState() {
    updatePageState(PageState.DEFAULT);
  }

  void showLoading() {
    updatePageState(PageState.LOADING);
  }

  void hideLoading() {
    resetPageState();
  }

  void showMessage(String msg) {
    state = state.copyWith(message: msg) as S;
  }

  void showErrorMessage(String msg) {
    state = state.copyWith(errorMessage: msg) as S;
  }

  void showSuccessMessage(String msg) {
    state = state.copyWith(successMessage: msg) as S;
  }

  void showErrorMessageCustom(String msg) {
    ShowMessage.errorNotification(
        msg, AppRoutes.navigatorKey.currentContext!);
  }

  void showSuccessMessageCustom(String msg) {
    ShowMessage.successNotification(
        msg, AppRoutes.navigatorKey.currentContext!);
  }

  void refreshPage(bool refresh) {
    state = state.copyWith(refreshPage: refresh) as S;
  }

  dynamic callApi<T>(
    Future<T> future, {
    Function(Exception exception)? onError,
    Function(T response)? onSuccess,
    Function? onStart,
    Function? onComplete,
  }) async {
    Exception? _exception;

    onStart == null ? showLoading() : onStart();

    try {
      final T response = await future;

      if (onSuccess != null) onSuccess(response);

      onComplete == null ? hideLoading() : onComplete();

      return response;
    } on ServiceUnavailableException catch (exception) {
      _exception = exception;
      showErrorMessageCustom(exception.message);
    } on UnauthorizedException catch (exception) {
      showErrorMessageCustom(exception.message);
    } on TimeoutException catch (exception) {
      _exception = exception;
      showErrorMessageCustom(exception.message ?? 'Timeout exception');
    } on NetworkException catch (exception) {
      _exception = exception;
      showErrorMessageCustom(exception.message);
    } on JsonFormatException catch (exception) {
      _exception = exception;
      showErrorMessageCustom(exception.message);
    } on NotFoundException catch (exception) {
      _exception = exception;
      showErrorMessageCustom(exception.message);
    } on ApiException catch (exception) {
      _exception = exception;
    } on AppException catch (exception) {
      _exception = exception;
      showErrorMessageCustom(exception.message);
    } catch (error) {
      _exception = AppException(message: "$error");
    }

    if (onError != null && _exception != null) {
      onError(_exception);
    } else {
      if (_exception is UnauthorizedException) {
        updatePageState(PageState.UNAUTHORIZED);
        return;
      } else if (_exception is NetworkException) {
        updatePageState(PageState.NO_INTERNET);
        return;
      }
      else if (_exception is ServiceUnavailableException) {
        updatePageState(PageState.NO_INTERNET);
        return;
      }

      else if (_exception is AppException) {
        updatePageState(PageState.FAILED);
        return;
      }
      
    }

    onComplete == null ? hideLoading() : onComplete();
  }


  Future<AsyncValue<T>> AsyncValueCallApi<T>(
    Future<T> future, {
    Function? onStart,
       Function(T response)? onSuccess,
  }) async {
    Exception? _exception;
    StackTrace? _stackTrace;

    if (onStart != null) onStart();

    try {
      final T response = await future;
            if (onSuccess != null) onSuccess(response);
      return AsyncValue.data(response);
    } on ServiceUnavailableException catch (exception, stackTrace) {
      _exception = exception;
      _stackTrace = stackTrace;
      showErrorMessageCustom(exception.message);
    } on UnauthorizedException catch (exception, stackTrace) {
      _exception = exception;
      _stackTrace = stackTrace;
      showErrorMessageCustom(exception.message);
    } on TimeoutException catch (exception, stackTrace) {
      _exception = exception;
      _stackTrace = stackTrace;
      showErrorMessageCustom(exception.message);
    } on NetworkException catch (exception, stackTrace) {
      _exception = exception;
      _stackTrace = stackTrace;
      showErrorMessageCustom(exception.message);
    } on JsonFormatException catch (exception, stackTrace) {
      _exception = exception;
      _stackTrace = stackTrace;
      showErrorMessageCustom(exception.message);
    } on NotFoundException catch (exception, stackTrace) {
      _exception = exception;
      _stackTrace = stackTrace;
      showErrorMessageCustom(exception.message);
    } on ApiException catch (exception, stackTrace) {
      _exception = exception;
      _stackTrace = stackTrace;
    } on AppException catch (exception, stackTrace) {
      _exception = exception;
      _stackTrace = stackTrace;
      showErrorMessageCustom(exception.message);
    } catch (error, stackTrace) {
      _exception = AppException(message: "$error");
      _stackTrace = stackTrace;
    }
    if (_exception != null && _stackTrace != null) {
      return AsyncValue.error(_exception, _stackTrace);
    }
    return AsyncValue.error(Exception('Unknown error'), StackTrace.current);
  }
}
