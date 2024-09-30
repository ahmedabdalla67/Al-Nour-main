import 'package:bloc/bloc.dart';
import 'package:mesk/core/services/service_locator.dart';
import 'package:mesk/features/surah_details/domain/entities/surah_list_entity.dart';
import 'package:mesk/features/surah_details/domain/useCase/surah_list_use_case.dart';
import 'package:meta/meta.dart';

part 'surah_info_state.dart';

class SurahInfoCubit extends Cubit<SurahInfoState> {
  SurahInfoCubit() : super(SurahInfoInitial());

  getSurahList() async{
    emit(SurahInfoLoading());
    final surahData = await getIT.call<SurahListUseCase>().call();
    surahData.fold(
      (failure)=>emit(SurahInfoFailure(errMessage: failure.errorMessage)), 
      (surahInfo)=>emit(SurahInfoSuccess(surahInfo: surahInfo)));
  }
}
