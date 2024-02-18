import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:furni_hunt_dashboard/core/utils/failure/firebase_failure.dart';
import 'package:furni_hunt_dashboard/features/add_data/data/product_model.dart';


abstract class AddProductRepo{
  Future<Either<String,File>>pickImages();
  Future<List<String>>uploadImages({required List<File> images});
  // pickAndUploadImages(imagesLinks);
  Future<Either<String,Failure>> addProduct({required ProductModel productModel});
}