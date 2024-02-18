  import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar customAppBar(BuildContext context) {
    return AppBar(
        toolbarHeight: 30,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      );
  }