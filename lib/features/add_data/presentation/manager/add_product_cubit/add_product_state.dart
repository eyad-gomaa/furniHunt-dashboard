part of 'add_product_cubit.dart';
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}

final class AddProductLoading extends AddProductState {}
final class PickImageSuccess extends AddProductState {}
final class EmptyImagesState extends AddProductState {}

final class AddProductSuccess extends AddProductState {
  final String successMessage;
  AddProductSuccess({required this.successMessage});
}

final class AddProductFailure extends AddProductState {
  final String errMessage;
  AddProductFailure({required this.errMessage});
}
