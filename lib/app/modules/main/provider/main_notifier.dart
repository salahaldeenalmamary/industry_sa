import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base/BaseNotifier.dart';
import '../../../core/model/ApiResponse.dart';
import '../../../core/model/selectionPopupModel/selection_popup_model.dart';
import '../../../data/models/common/appConfig.dart';
import '../../../data/repositories/remote_data_source.dart';
import '../../../widget/selectable_item_bottom_sheet_widget.dart';
import 'main_state.dart';

class MainNotifier extends BaseNotifier<MainState> {
  final RemoteDataSource _repository;

  MainNotifier(
    this._repository,
  ) : super(
          MainState.initial(),
        );

  Future<AsyncValue<ApiResponse<AppConfig>>> fetchAppConfigData(
      {bool refresh = false}) async {
    return await AsyncValueCallApi(
      _repository.getAppConfig(),
      onSuccess: (response) {
        final selectedCountry = response.data?.countries?.firstWhere(
          (e) => e.id == 194,
     
        );

        state = state.copyWith(
          data: response.data,
          selectedItemShipping: selectedCountry != null
              ? SelectableItem(
                  title: selectedCountry.name,
                  value: selectedCountry,
                  isSelected: true,
                )
              : null, 
        );
      },
       
    );
  }
  handleSelectedSearchDropdown(SelectionPopupModel? selectionSearchItem){
    state=state.copyWith(selectionSearchItem:selectionSearchItem );
  }
   handleSelectedShipping(SelectableItem<Object?> ?selectedItemShipping){
    state=state.copyWith(  selectedItemShipping: selectedItemShipping );
  }
}
