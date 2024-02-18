import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt_dashboard/features/add_data/data/product_model.dart';
import 'package:furni_hunt_dashboard/features/add_data/data/repo/add_product_repo/add_product_repo.dart';
part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.repo) : super(AddProductInitial());
  final AddProductRepo repo;
  List<File> productImagesFiles = [];
  List<String> productImages = [];

  pickImage() async {
    var imageFile = await repo.pickImages();
    imageFile.fold((l) => null, (r) {
      productImagesFiles.add(r);
      emit(PickImageSuccess());
    });
  }
  checkForImages(){
    if (productImagesFiles.isEmpty){
      emit(EmptyImagesState());
    }
  }
  Future<List<String>> uploadImage() async {
    emit(AddProductLoading());
    var listOfImagesLink = await repo.uploadImages(images: productImagesFiles);
    return listOfImagesLink;
  }

  void addProduct({required ProductModel productModel}) async {
    emit(AddProductLoading());
    var response = await repo.addProduct(productModel: productModel);
    response.fold((l) => emit(AddProductSuccess(successMessage: l)),
        (r) => emit(AddProductFailure(errMessage: r.failureMessage)));
    productImagesFiles.clear();
  }
}
