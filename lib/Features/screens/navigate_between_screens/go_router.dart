import 'package:books_app/Features/screens/homepage_screen/homepage_screen.dart';
import 'package:books_app/Features/screens/homepage_screen/item_search_for_books/search_page.dart';
import 'package:books_app/Features/screens/login_and_signup_screens/loginscreen.dart';
import 'package:books_app/Features/screens/splash_view/splashview.dart';
import 'package:books_app/Features/screens/viewbook_screen/viewbook.dart';
import 'package:books_app/data/apiservice/apicall.dart';
import 'package:books_app/data/book_model/book_model.dart';
import 'package:books_app/data/manger_view_model/cubit_similar_books/similar_books_cubit.dart';
import 'package:books_app/data/repositories/homerepo_implement.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return BlocProvider(create: (context) => SimilarBooksCubit(HomerepoImplement(ApiCall(Dio())))..fetchSimilarBooks("${state.extra}"), child:  Viewbook(bookmodel: state.extra as BookModel),);
        },
      ),
      GoRoute(
        path: '/searchpage',
        builder: (context, state) => const SearchPage(),
      ),
    ],
  );
}
