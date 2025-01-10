import 'package:appriverpod/config/translations/localization_service.dart';
import 'package:flutter/material.dart';
import '../model/page_state.dart';
import '../widget/loading.dart';

 class PageStateWidget extends StatelessWidget {
  final PageState state;
  final VoidCallback onRetry;
  final Widget? defaultBuilder;
  final Widget? emptyBuilder;

  Widget? loadingBuilder;

  PageStateWidget({
    required this.state,
    required this.onRetry,
    this.defaultBuilder,
    this.emptyBuilder,
    this.loadingBuilder,
  });

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case PageState.LOADING:
        return _buildLoadingState(context);
      case PageState.SUCCESS:
        return _buildSuccessState();
      case PageState.FAILED:
        return _buildFailedState(context);
      case PageState.NO_INTERNET:
        return _buildNoInternetState(context);
      case PageState.UNAUTHORIZED:
        return _buildUnauthorizedState(context);
      case PageState.Empty:
        return _buildEmptyState(context);
      default:
        return _buildDefaultState(context);
    }
  }

  Widget _buildDefaultState(BuildContext context) {
    if (defaultBuilder != null) {
      return defaultBuilder!;
    }
    return SizedBox();
  }

  Widget _buildLoadingState(BuildContext context) {
    return loadingBuilder ?? const Loading();
  }

 
  Widget _buildSuccessState() {
    return Center(
      child: Icon(Icons.check_circle, color: Colors.green, size: 100),
    );
  }

  Widget _buildFailedState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.red, size: 100),
          SizedBox(height: 16),
          Text(
            context.l10n .someThingWentWrong,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRetry,
            child: Text(     context.l10n .retry),
          ),
        ],
      ),
    );
  }

  Widget _buildNoInternetState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off, color: Colors.grey, size: 100),
          Text(
                 context.l10n .noInternetConnection,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          ElevatedButton(
            onPressed: onRetry,
            child: Text(     context.l10n .retry),
          ),
        ],
      ),
    );
  }

  Widget _buildUnauthorizedState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.lock, color: Colors.grey, size: 100),
          Text(
                 context.l10n .unauthorized,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          ElevatedButton(
            onPressed: onRetry,
            child: Text(     context.l10n .login),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    if (emptyBuilder != null) {
      return emptyBuilder!;
    }
    return Center(
      child: Text(
             context.l10n .noDataAvailable,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
