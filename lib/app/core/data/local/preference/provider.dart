import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'preference_manager.dart';
import 'preference_manager_impl.dart';

final preferenceManagerProvider = Provider<PreferenceManager>((ref) {
  return PreferenceManagerImpl();
});
