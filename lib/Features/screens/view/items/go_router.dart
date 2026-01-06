import 'package:books_app/Features/screens/homepage_screen.dart';
import 'package:books_app/Features/screens/loginscreen.dart';
import 'package:books_app/Features/screens/view/splashview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const Splashview();
        },
      ),
      GoRoute(
        path: '/homepage',
        builder: (BuildContext context, GoRouterState state) {
          return const HomepageScreen();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const Loginscreen();
        },
      ),
    ],
  );
}
