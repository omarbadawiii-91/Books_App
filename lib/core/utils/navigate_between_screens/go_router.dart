import 'package:books_app/Features/homepage_screen/presentation/views/homepage_screen.dart';
import 'package:books_app/Features/homepage_screen/presentation/views/widgets/item_search_for_books/search_page.dart';
import 'package:books_app/Features/login_and_signup_screens/loginscreen.dart';
import 'package:books_app/Features/splash_view/splashview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

 class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
         builder: (BuildContext context, GoRouterState state) {
          return  HomepageScreen();
        },
      ),
      GoRoute(
        path: '/homepage',
        builder: (BuildContext context, GoRouterState state) {
          return  HomepageScreen();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const Loginscreen();
        },
      ),
      
      GoRoute(
        path: '/searchpage',
        builder: (context, state) => const SearchPage(
        ),
      ),
    ],
  );
}
