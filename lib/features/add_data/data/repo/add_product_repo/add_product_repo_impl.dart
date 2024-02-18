import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:furni_hunt_dashboard/core/utils/failure/firebase_failure.dart';
import 'package:furni_hunt_dashboard/features/add_data/data/product_model.dart';
import 'package:furni_hunt_dashboard/features/add_data/data/repo/add_product_repo/add_product_repo.dart';
import 'package:image_picker/image_picker.dart';

class AddProductRepoImpl implements AddProductRepo {
  List<String> imagesLinks = [];
  @override
  Future<Either<String, File>> pickImages() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: ImageSource
            .gallery);
    XFile? xfilePick = pickedFile;
    if (xfilePick != null) {
      return right(File(xfilePick.path));
    } else {
      return left('Nothing is selected');
    }
  }

  @override
  Future<List<String>> uploadImages({required List<File> images}) async {
    List<String> uploadedImages = [];
    FirebaseStorage storage = FirebaseStorage.instance;
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    String? link;
      for (var image in images) {
        Reference ref = storage.ref().child('images').child(fileName);
        await ref.putFile(image);
        link = await ref.getDownloadURL();
        uploadedImages.add(link);
      }
      return uploadedImages;
  }

  @override
  Future<Either<String, Failure>> addProduct(
      {required ProductModel productModel}) async {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    try {
      await products.add(productModel.toJson());
      return left("product added Successfuly");
    } on FirebaseException catch (e) {
      return right(
          FirebaseFailure.fromFirebaseException(failureMessage: e.code));
    }
  }


}
