import 'package:bloc/bloc.dart';
import 'package:mesk/core/services/service_locator.dart';
import 'package:mesk/features/azkari/domain/Entities/sub_entities/category_group_entity.dart';
import 'package:mesk/features/azkari/domain/useCase/azkar_use_case.dart';
import 'package:meta/meta.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit() : super(AzkarInitial());

  bool isSearchIcon = false;
  List<CategoryGroupEntity> _azkarList = [];

  getAzkarDataList() async{
    emit(AzkarLoading());
    final azkarList = await getIT.call<AzkarUseCase>().call();

    azkarList.fold(
      (failure)=> emit(AzkarFailure(errMessage: failure.errorMessage)), 
      (azkar){
        _azkarList = azkar;
        emit(AzkarSuccess(azkarList: azkar));
      } 
    );
  }

  toggleSearchIcon(){
    isSearchIcon = !isSearchIcon;
    if(isSearchIcon){
      emit(OpenSearchField(query: _azkarList));
    } else {
      emit(AzkarSuccess(azkarList: _azkarList, isSearchOpen: true));
    }
  }

  getSearchResult(String query){
    if(query.isNotEmpty){
      final filteredAzkar = _azkarList.where((azkar)=> azkar.azkarContent.any((zekr)=>zekr.category.toLowerCase().contains(query.toLowerCase()))).toList();
      emit(OpenSearchField(query: filteredAzkar));
    } else{
      //it was AzkarSuccess but give an error when run when write anything in textField and delete it will return to title automatic 
      //so i changed to OpenSearchField
      emit(OpenSearchField(query: _azkarList));
    }
  }
}
