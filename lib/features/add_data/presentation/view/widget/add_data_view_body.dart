import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt_dashboard/features/add_data/data/product_model.dart';
import 'package:furni_hunt_dashboard/features/add_data/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:furni_hunt_dashboard/features/add_data/presentation/view/widget/add_product_form.dart';
import 'package:furni_hunt_dashboard/features/add_data/presentation/view/widget/custom_button.dart';
import 'package:furni_hunt_dashboard/features/add_data/presentation/view/widget/images_validator.dart';
import 'package:furni_hunt_dashboard/features/add_data/presentation/view/widget/over_app_loading_indicator.dart';
class AddDataViewBody extends StatefulWidget {
  const AddDataViewBody({super.key});

  @override
  State<AddDataViewBody> createState() => _AddDataViewBodyState();
}

class _AddDataViewBodyState extends State<AddDataViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  void clearFields() {
    _nameController.clear();
    _descriptionController.clear();
    _priceController.clear();
    _discountController.clear();
    _quantityController.clear();
    _categoryController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: AddProductForm(
                formKey: formKey,
                nameController: _nameController,
                descriptionController: _descriptionController,
                priceController: _priceController,
                discountController: _discountController,
                quantityController: _quantityController,
                categoryController: _categoryController,
              )),
              const SliverToBoxAdapter(
                child: ImagesValidator()
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    onTap: () async {
                      BlocProvider.of<AddProductCubit>(context)
                          .checkForImages();
                      if (formKey.currentState!.validate() &&
                          BlocProvider.of<AddProductCubit>(context)
                              .productImagesFiles
                              .isNotEmpty) {
                        List<String> productImage =
                            await BlocProvider.of<AddProductCubit>(context)
                                .uploadImage();
                        ProductModel product = ProductModel(
                            productName: _nameController.text,
                            productId: DateTime.now()
                                .millisecondsSinceEpoch
                                .toString(),
                            productPrice: _priceController.text,
                            productCategory: "furniture",
                            productDescription: _descriptionController.text,
                            productImage: productImage,
                            productQuantity: "3",
                            createdAt: Timestamp.now());
                        BlocProvider.of<AddProductCubit>(context)
                            .addProduct(productModel: product);
                        clearFields();
                      }
                    },
                    text: "Upload product",
                  ),
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<AddProductCubit, AddProductState>(
          builder: (context, state) {
            if (state is AddProductLoading) {
              return const OverAppLoadingIndicator();
            } else {
              return const SizedBox.shrink();
            }
          },
        )
      ],
    );
  }
}
