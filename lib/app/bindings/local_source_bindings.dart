import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../core/data/local/preference/preference_manager.dart';
import '../core/data/local/preference/preference_manager_impl.dart';




final githubRepositoryProvider = Provider<PreferenceManager>((ref) { 
  return PreferenceManagerImpl();
});
