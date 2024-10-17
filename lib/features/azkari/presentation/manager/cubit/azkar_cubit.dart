import 'package:bloc/bloc.dart';
import 'package:mesk/core/services/service_locator.dart';
import 'package:mesk/features/azkari/domain/Entities/sub_entities/category_group_entity.dart';
import 'package:mesk/features/azkari/domain/useCase/azkar_use_case.dart';
import 'package:meta/meta.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit() : super(AzkarInitial());

  getAzkarDataList() async{
    emit(AzkarLoading());
    final azkarList = await getIT.call<AzkarUseCase>().call();

    azkarList.fold(
      (failure)=> emit(AzkarFailure(errMessage: failure.errorMessage)), 
      (azkar)=> emit(AzkarSuccess(azkarList: azkar)));
  }
}
