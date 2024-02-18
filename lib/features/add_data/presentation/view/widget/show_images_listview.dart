import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt_dashboard/features/add_data/presentation/manager/add_product_cubit/add_product_cubit.dart';

Widget showImagesListView(context) {
  var productImagesFiles =
      BlocProvider.of<AddProductCubit>(context).productImagesFiles;
  if (productImagesFiles.isEmpty) {
    return const Text(
      "No image selected",
      style: TextStyle(color: Colors.black),
    );
  } else {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: productImagesFiles.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var imageFiles =
              BlocProvider.of<AddProductCubit>(context).productImagesFiles;
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(imageFiles[index])),
          );
        },
      ),
    );
  }
}
