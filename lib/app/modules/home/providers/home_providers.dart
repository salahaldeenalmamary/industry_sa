import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers.dart';
import 'state/HomeState.dart';
import 'state/home_notifer.dart';

final homeNotifierProvider =
    StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final homeRepository = ref.read(RemoteDataSourceProvider);
  final homeNotifier = HomeNotifier(homeRepository);
  
 
  homeNotifier.fetchCategoryData();

  return homeNotifier;
});
