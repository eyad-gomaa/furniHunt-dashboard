import 'package:flutter/material.dart';
import 'package:furni_hunt_dashboard/features/add_data/presentation/view/add_data_view.dart';
import 'package:furni_hunt_dashboard/features/home/presentation/view/home_view.dart';

import 'package:go_router/go_router.dart';

class RouterPath {
  static const String addDataView = '/addDataView';
  static const String homeView = '/';
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RouterPath.homeView,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
    ),
    GoRoute(
      path: RouterPath.addDataView,
      builder: (BuildContext context, GoRouterState state) {
        return const AddDataView();
      },
    ),
    
    // GoRoute(
    //   path: RouterPath.signUpView,
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const SignUpView();
    //   },
    // ),
    // GoRoute(
    //   path: RouterPath.homeView,
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const HomeView();
    //   },
    // ),

  ],
);
