import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import '../../routes/app_pages.dart';
import '../model/page_state.dart';
import '/app/core/widget/loading.dart';
import '../../../utils/BuildConfig.dart';
import 'PageStateWidget.dart';

abstract class BaseView extends ConsumerStatefulWidget {
  BaseView({Key? key}) : super(key: key);


  final Logger logger = BuildConfig.instance.logger;

  Widget body(BuildContext context, WidgetRef ref);

  PreferredSizeWidget? appBar(BuildContext context, WidgetRef ref);

  void onRetry(WidgetRef ref) {}

  void onRefreshIndicator(WidgetRef ref) {}

  Widget? bottomNavigationBar(BuildContext context, WidgetRef ref) {}

  Widget? floatingActionButton(BuildContext context, WidgetRef ref) {}

  Widget? drawer(BuildContext context, WidgetRef ref) {}

  Widget? loadingBuilder(WidgetRef ref) => null;

  Widget? emptyBuilder(WidgetRef ref) => null;

  void initState(WidgetRef ref) {}

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  void dispose(WidgetRef ref) {}
  Widget PageStateRender(
      PageState state,  WidgetRef ref,{ Widget? child}) {
    return SafeArea(
      child: PageStateWidget(
        onRetry: () {
          onRetry(ref);
        },
        state: state,
        defaultBuilder: child,
        emptyBuilder: emptyBuilder(ref),
        loadingBuilder: loadingBuilder(ref),
      ),
    );
  }

  @override
  ConsumerState<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends ConsumerState<BaseView> {
  @override
  void initState() {
    super.initState();
    widget.initState.call(ref);
  }

  @override
  void dispose() {
    widget.dispose.call(ref);
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _statusBarStyle(context),
      child: Material(
        color: Colors.transparent,
        child: _buildScaffold(context),
      ),
    );
  }

  SystemUiOverlayStyle _statusBarStyle(BuildContext context) {
    return SystemUiOverlayStyle(
      statusBarColor: _statusBarColor(context),
      statusBarIconBrightness: Brightness.dark,
    );
  }

  Scaffold _buildScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackgroundColor(context),
    
      appBar: widget.appBar(context, ref),
      floatingActionButton: widget.floatingActionButton(context, ref),
      body: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverRefreshControl(
            onRefresh: () async {
              widget.onRefreshIndicator(ref);
            },
          ),
          SliverFillRemaining(
            child: _buildBodyContent(context),
          ),
        ],
      ),
      bottomNavigationBar: widget.bottomNavigationBar(context, ref),
      drawer: widget.drawer(context, ref),
    );
  }

  Widget _buildBodyContent(BuildContext context) {
    return SafeArea(
      child: widget.body(context, ref),
    );
  }

  Color _pageBackgroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.background;
  }

  Color _statusBarColor(BuildContext context) {
    return Theme.of(context).primaryColor;
  }

  Widget _showLoading() {
    return const Loading();
  }
}
