import 'package:books_app/Features/screens/navigate_between_screens/go_router.dart';
import 'package:books_app/data/apiservice/apicall.dart';
import 'package:books_app/data/manger_view_model/all_cubits/cubit_allbooks/allbook_cubit.dart';
import 'package:books_app/data/manger_view_model/all_cubits/cubit_newest_boook/newestbooks_cubit.dart';
import 'package:books_app/data/manger_view_model/cubit_similar_books/similar_books_cubit.dart';
import 'package:books_app/data/repositories/homerepo_implement.dart';
import 'package:books_app/firebase_options.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const BooksApp());
}

class BooksApp extends StatefulWidget {
  const BooksApp({super.key});

  @override
  State<BooksApp> createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AllbooksCubit(HomerepoImplement(ApiCall(Dio())))
                ..fetchAllBooks("filter=free-ebooks&q=all"),
        ),
        BlocProvider(
          create: (context) =>
              NewestbooksCubit(HomerepoImplement(ApiCall(Dio())))
                ..fetchNewestBooks("filter=free-ebooks&Sorting=newest&q=all"),
        ),
        BlocProvider(
          create: (context) =>
              SimilarBooksCubit(HomerepoImplement(ApiCall(Dio())))
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
