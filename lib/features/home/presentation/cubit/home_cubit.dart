import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mesk/core/params/home_params.dart';
import 'package:mesk/core/services/service_locator.dart';

import 'package:mesk/features/home/domain/entities/home_entity.dart';
import 'package:mesk/features/home/domain/useCases/home_data_use_case.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int index  = Random().nextInt(114);

  getRandomHomeSurah() async {
    emit(HomeLoading());
    //index = Random().nextInt(114);
    final randomSurah = await getIT<HomeDataUseCase>().call(
      params: RandomVerseParams(
        index: index,
      ),
    );

    randomSurah.fold(
      (surah) => emit(HomeGetSuccess(surah: surah)),
      (failure) => emit(HomeGetFailure(errMessage: failure.errorMessage)),
    );
  }

   

}
