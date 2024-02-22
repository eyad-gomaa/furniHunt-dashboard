import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt_dashboard/features/add_data/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:furni_hunt_dashboard/features/add_data/presentation/view/widget/cuatom_small_button.dart';
import 'package:furni_hunt_dashboard/features/add_data/presentation/view/widget/custom_dropdown_menu.dart';
import 'package:furni_hunt_dashboard/features/add_data/presentation/view/widget/show_images_listview.dart';
import 'package:furni_hunt_dashboard/features/home/presentation/view/widget/custom_text_form_field.dart';
import 'package:gap/gap.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.descriptionController,
    required this.priceController,
    required this.discountController,
    required this.quantityController,
    required this.categoryController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final TextEditingController discountController;
  final TextEditingController quantityController;
  final TextEditingController categoryController;

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  List<String> categoryList = [
    "Home Furniture",
    "LIVING ROOM",
    "BEDROOM",
    "DINING",
    "OUTDOOR",
    "KIDS & BABY",
    "HOME OFFICE",
    "DECOR",
  ];
  List<String> quantityList = List.generate(100, (index) => "$index");
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Product Name"),
              const Gap(10),
              CustomTextFormField(
                  context: context,
                  validator: (value) =>
                      value!.isEmpty ? "Field Required" : null,
                  controller: widget.nameController)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Product Description"),
              const Gap(10),
              CustomTextFormField(
                  context: context,
                  validator: (value) =>
                      value!.isEmpty ? "Field Required" : null,
                  controller: widget.descriptionController)
            ],
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Product price"),
                  const Gap(10),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2 - 30,
                    child: CustomTextFormField(
                        textInputType: TextInputType.number,
                        context: context,
                        validator: (value) =>
                            value!.isEmpty ? "Field Required" : null,
                        controller: widget.priceController),
                  )
                ],
              ),
              const Gap(20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Product Discount"),
                  const Gap(10),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2 - 30,
                    child: CustomTextFormField(
                        textInputType: TextInputType.number,
                        context: context,
                        validator: (value) =>
                            value!.isEmpty ? "Field Required" : null,
                        controller: widget.discountController),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Product Quantity"),
                  const Gap(10),
                  // SizedBox(
                  //   width: MediaQuery.sizeOf(context).width / 2 - 30,
                  //   child: CustomTextFormField(
                  //       textInputType: TextInputType.number,
                  //       context: context,
                  //       validator: (value) =>
                  //           value!.isEmpty ? "Field Required" : null,
                  //       controller: widget.quantityController),
                  // )
                  CustomDropdownMenu(
                    itemsList: quantityList,
                    controller: widget.quantityController,
                    hint: 'Choose Quantity',
                  )
                ],
              ),
              const Gap(20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Product category"),
                  const Gap(10),
                  CustomDropdownMenu(
                    itemsList: categoryList,
                    controller: widget.categoryController,
                    hint: 'Choose Category',
                  )
                  // SizedBox(
                  //   width: MediaQuery.sizeOf(context).width / 2 - 30,
                  //   child: CustomTextFormField(
                  //       context: context,
                  //       validator: (value) =>
                  //           value!.isEmpty ? "Field Required" : null,
                  //       controller: widget.categoryController),
                  // )
                ],
              ),
            ],
          ),
          const Gap(20),
          BlocBuilder<AddProductCubit, AddProductState>(
            builder: (context, state) {
              return showImagesListView(context);
            },
          ),
          const Gap(20),
          CustomSmallButton(
            onTap: () async {
              await BlocProvider.of<AddProductCubit>(context).pickImage();
            },
            text: "Upload Images",
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
