import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../network/exceptions/network_exception.dart';

extension AsyncValueUI<T> on AsyncValue<T> {
  Widget buildWithHandlers({
    required BuildContext context,
    required Widget Function(T value) dataBuilder,
    Future<void> Function()? refreshHandler,
    bool skipLoadingOnReload = false,
    bool skipLoadingOnRefresh = true,
    bool skipError = false,
    Widget Function(BuildContext context)? loadingBuilder,
    Widget Function(BuildContext context)? noInternetBuilder,
    Widget Function(BuildContext context)? emptyBuilder,
    Widget Function(BuildContext context, Object? error)? errorBuilder,
  }) {
    return when(
      skipError: skipError,
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      skipLoadingOnReload: skipLoadingOnReload,
      data: (data) {
        if (data is List && data.isEmpty && emptyBuilder != null) {
          return _buildSliverContent(
            context: context,
            child: emptyBuilder(context),
            refreshHandler: refreshHandler,
          );
        }

        return _buildSliverContent(
          context: context,
          child: dataBuilder(data),
          refreshHandler: refreshHandler,
        );
      },
      loading: () {
        if (loadingBuilder != null) {
          return _buildSliverContent(
            context: context,
            child: loadingBuilder(context),
            refreshHandler: refreshHandler,
          );
        }
        return _buildSliverContent(
          context: context,
          child: const Center(child: CupertinoActivityIndicator()),
          refreshHandler: refreshHandler,
        );
      },
      error: (error, stackTrace) {
        if (error is NetworkException && noInternetBuilder != null) {
          return _buildSliverContent(
            context: context,
            child: noInternetBuilder(context),
            refreshHandler: refreshHandler,
          );
        }
        if (errorBuilder != null) {
          return _buildSliverContent(
            context: context,
            child: errorBuilder(context, error),
            refreshHandler: refreshHandler,
          );
        }
        return _buildSliverContent(
          context: context,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(error.toString()),
                SizedBox(height: 16),
                if (refreshHandler != null)
                  CupertinoButton(
                    child: Text('Retry'),
                    onPressed: refreshHandler,
                  ),
              ],
            ),
          ),
          refreshHandler: refreshHandler,
        );
      },
    );
  }

  Widget _buildSliverContent({
    required BuildContext context,
    required Widget child,
    Future<void> Function()? refreshHandler,
  }) {
    if (refreshHandler == null) {
      return CustomScrollView(
        slivers: [
          SliverFillRemaining(child: child),
        ],
      );
    } else {
      return CustomScrollView(
        slivers: [
          CupertinoSliverRefreshControl(
            onRefresh: refreshHandler,
          ),
          SliverFillRemaining(child: child),
        ],
      );
    }
  }
}
