part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeGetSuccess extends HomeState {
  final HomeEntity surah;
  final String randomVerseText;
  final String verseNumber;

  HomeGetSuccess({required this.randomVerseText, required this.verseNumber, required this.surah});
}

final class HomeLoading extends HomeState {}


final class HomeGetFailure extends HomeState {
  final String errMessage;

  HomeGetFailure({required this.errMessage});
}
