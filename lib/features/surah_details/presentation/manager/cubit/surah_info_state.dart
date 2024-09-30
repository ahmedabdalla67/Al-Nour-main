part of 'surah_info_cubit.dart';

@immutable
sealed class SurahInfoState {}

final class SurahInfoInitial extends SurahInfoState {}
final class SurahInfoLoading extends SurahInfoState {}
final class SurahInfoSuccess extends SurahInfoState {
  final List<SurahListEntity> surahInfo;

  SurahInfoSuccess({required this.surahInfo});
}
final class SurahInfoFailure extends SurahInfoState {
  final String errMessage;

  SurahInfoFailure({required this.errMessage});
}

