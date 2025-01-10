import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repositories/remote_data_source.dart';
import '../data/repositories/remote_data_sourceImpl.dart';
import 'main/provider/main_provider.dart';


final RemoteDataSourceProvider = Provider<RemoteDataSource>((ref) {
  return RemoteDataSourceImpl();
});

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);


final appConfigFutureProvider = FutureProvider<void>((ref) {
  
  return  ref.read(mainProvider.notifier).fetchAppConfigData();
});