part of 'azkar_cubit.dart';

@immutable
sealed class AzkarState {}

final class AzkarInitial extends AzkarState {}
final class AzkarLoading extends AzkarState {}
final class AzkarSuccess extends AzkarState {
  final List<CategoryGroupEntity> azkarList;
  final bool isSearchOpen;

  AzkarSuccess( {required this.azkarList, this.isSearchOpen = false,});
}
final class AzkarFailure extends AzkarState {
  final String errMessage;

  AzkarFailure({required this.errMessage});
}


final class OpenSearchField extends AzkarState {
  final List<CategoryGroupEntity> query;

  OpenSearchField({required this.query});
}


