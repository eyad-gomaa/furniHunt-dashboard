import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt_dashboard/features/add_data/presentation/manager/add_product_cubit/add_product_cubit.dart';

class ImagesValidator extends StatelessWidget {
  const ImagesValidator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductCubit, AddProductState>(
                  builder: (context, state) {
                    if (state is EmptyImagesState) {
                      return const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "You must sellect at least 1 photo",
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                );
  }
}