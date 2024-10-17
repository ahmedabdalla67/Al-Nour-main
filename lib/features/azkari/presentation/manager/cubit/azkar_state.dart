part of 'azkar_cubit.dart';

@immutable
sealed class AzkarState {}

final class AzkarInitial extends AzkarState {}
final class AzkarLoading extends AzkarState {}
final class AzkarSuccess extends AzkarState {
  final List<CategoryGroupEntity> azkarList;

  AzkarSuccess({required this.azkarList});
}
final class AzkarFailure extends AzkarState {
  final String errMessage;

  AzkarFailure({required this.errMessage});
}
