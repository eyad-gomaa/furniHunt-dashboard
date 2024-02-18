import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt_dashboard/features/add_data/data/repo/add_product_repo/add_product_repo_impl.dart';
import 'package:furni_hunt_dashboard/features/add_data/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:furni_hunt_dashboard/features/add_data/presentation/view/widget/add_data_view_body.dart';
import 'package:furni_hunt_dashboard/features/add_data/presentation/view/widget/custom_appbar.dart';
class AddDataView extends StatelessWidget {
  const AddDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(AddProductRepoImpl()),
      child: Scaffold(
        appBar: customAppBar(context),
        body: const AddDataViewBody(),
      ),
    );
  }


}
