import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furni_hunt_dashboard/core/resources/color_manager.dart';
import 'package:furni_hunt_dashboard/core/utils/app_router.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        shrinkWrap: true,
        children: [
          HomeItemContainer(
            text: "Add Product",
            icon: FontAwesomeIcons.upload,
            onTap: () {
              print("object");
              GoRouter.of(context).push(RouterPath.addDataView);
            },
          ),
          HomeItemContainer(
            text: "Delete Product",
            icon: FontAwesomeIcons.xmark,
            onTap: () {},
          ),
          HomeItemContainer(
            text: "View Orders",
            icon: FontAwesomeIcons.truck,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class HomeItemContainer extends StatelessWidget {
  const HomeItemContainer({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });
  final String text;
  final IconData icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorManager.primary,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(icon), Gap(10), Text(text)],
          ),
        ),
      ),
    );
  }
}
