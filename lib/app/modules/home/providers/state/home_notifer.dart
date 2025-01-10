import '../../../../core/base/BaseNotifier.dart';
import '../../../../core/model/page_state.dart';
import '../../../../data/models/home/Deal.dart';
import '../../../../data/repositories/remote_data_source.dart';
import 'HomeState.dart';

class HomeNotifier extends BaseNotifier<HomeState> {
  final RemoteDataSource _repository;

  HomeNotifier(
    this._repository,
  ) : super(
          HomeState.initial(),
        );

  Future<void> fetchCategoryData({bool refresh = false}) async {
    await callApi(
      _repository.getHomeDataApi(),
  
      onComplete: () {
        state = state.copyWith(
          pageState: PageState.DEFAULT,
          selectedDeal: state.data?.deals?.firstOrNull,
        );
      },
      onSuccess: (response) {
        state = state.copyWith(
          data: response.data,
        );
      },
    );
  }

  void handleSelectedDeal(Deal? selectedDeal) {
    state = state.copyWith(selectedDeal: selectedDeal);
  }
}
