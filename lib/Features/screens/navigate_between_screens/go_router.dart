import 'package:books_app/Features/screens/homepage_screen/homepage_screen.dart';
import 'package:books_app/Features/screens/homepage_screen/item_search_for_books/search_page.dart';
import 'package:books_app/Features/screens/login_and_signup_screens/loginscreen.dart';
import 'package:books_app/Features/screens/splash_view/splashview.dart';
import 'package:books_app/Features/screens/viewbook_screen/viewbook.dart';
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
      GoRoute(
        path: '/viewbook',
        builder: (BuildContext context, GoRouterState state) {
          return const Viewbook();
        },
      ),
      GoRoute(path: '/searchpage', builder: (context, state) => const SearchPage()),
    ],
  );
}
