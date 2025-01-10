import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../routes/app_pages.dart';
import '../../../utils/BuildConfig.dart';

abstract class BaseWidgetMixin extends ConsumerWidget {

  final Logger logger = BuildConfig.instance.logger;
 

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: body(context,ref),
    );
  }

  Widget body(BuildContext context, WidgetRef ref);
}
