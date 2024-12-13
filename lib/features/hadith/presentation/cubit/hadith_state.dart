part of 'hadith_cubit.dart';

@immutable
sealed class HadithCubitState {}

final class HadithCubitInitial extends HadithCubitState {}

final class HadithCubitLoading extends HadithCubitState {}

final class HadithCubitSuccess extends HadithCubitState {
  final List<HadithEntity> hadiths;
  final Map<String, bool> downloadStatus;

  HadithCubitSuccess({required this.hadiths, required this.downloadStatus});
}

final class HadithCubitFailure extends HadithCubitState {
  final String errMessage;

  HadithCubitFailure({required this.errMessage});
}
