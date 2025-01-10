import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers.dart';
import 'main_notifier.dart';
import 'main_state.dart';

final mainProvider = StateNotifierProvider<MainNotifier, MainState>((ref) {
  final homeRepository = ref.read(RemoteDataSourceProvider);
  return    MainNotifier(homeRepository);
});
