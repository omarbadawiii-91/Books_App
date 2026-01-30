import 'package:books_app/Features/screens/viewbook_screen/viewbook.dart';
import 'package:books_app/data/book_model/book_model.dart';
import 'package:books_app/data/manger_view_model/all_cubits/cubit_searched_books/searched_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Showsearch extends SearchDelegate {
  BookModel? bookmodel;
  Showsearch({this.bookmodel});
  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);

    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xff0B2A27),
        foregroundColor: const Color(0xff095A55),
        elevation: 0,
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(207, 11, 42, 39),
      textTheme: theme.textTheme.copyWith(
        titleMedium: const TextStyle(color: Colors.white),
        titleLarge: const TextStyle(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(color: Colors.white70, fontSize: 16),
        labelStyle: const TextStyle(color: Colors.white),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white,
        selectionColor: Color.fromARGB(100, 255, 255, 255),
        selectionHandleColor: Colors.white,
      ),
      hintColor: Colors.white70,
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<SearchedBookCubit, SearchedBookState>(
      builder: (context, state) {
        if (state is SearchedBookLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchedBookFailure) {
          return Center(
            child: Text(
              "Error: ${state.errormessage}",
              style: TextStyle(color: Colors.white),
            ),
          );
        } else if (state is SearchedBookSuccess) {
          final books =state.bookmodel;
          return ListView.builder(
            itemCount: books.items?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  books.items?[index].volumeInfo!.title ?? '',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  books.items?[index].volumeInfo!.authors!.join(', ') ?? '',
                  style: TextStyle(color: Colors.white70),
                ),
              );
            },
          );
        }
        return Center();
             },
    );
  }

  @override
Widget buildSuggestions(BuildContext context) {
  if (query.trim().isEmpty) {
    return Center(
      child: Text(
        'Search for a book...',
        style: TextStyle(color: Colors.white70, fontSize: 18.sp),
      ),
    );
  }
  context.read<SearchedBookCubit>().fetchSearchedBooks(query);

  return BlocBuilder<SearchedBookCubit, SearchedBookState>(
    builder: (context, state) {
      if (state is SearchedBookLoading) {
        return const Center(child: CircularProgressIndicator(color: Colors.white));
      }

      if (state is SearchedBookFailure) {
        return Center(
          child: Text(
            "Error: ${state.errormessage}",
            style: const TextStyle(color: Colors.redAccent, fontSize: 16),
          ),
        );
      }

      if (state is SearchedBookSuccess) {
        final books = state.bookmodel;
        final items = books.items ?? [];

        if (items.isEmpty) {
          return const Center(
            child: Text(
              "no books found",
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final book = items[index];
            final volume = book.volumeInfo;
            final title = volume?.title ?? 'Unknown Title';
            final authors = volume?.authors?.join(', ') ?? 'Unknown Author';
            String imageUrl = volume?.imageLinks?.smallThumbnail ??
                volume?.imageLinks?.thumbnail ??
                '';

            if (imageUrl.startsWith('http://')) {
              imageUrl = imageUrl.replaceFirst('http://', 'https://');
            }

            return ListTile(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Viewbook(bookmodel: books,index: index,
                category: volume?.categories?[0],)));
                query = title;
                showResults(context);
              },
              leading: imageUrl.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.network(
                        imageUrl,
                        width: 50.w,
                        height: 70.h,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 50.w,
                            height: 70.h,
                            color: Colors.grey[800],
                            child: const Icon(Icons.book, color: Colors.white54),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            width: 50.w,
                            height: 70.h,
                            color: Colors.grey[900],
                            child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                          );
                        },
                      ),
                    )
                  : Container(
                      width: 50.w,
                      height: 70.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: const Icon(Icons.book, color: Colors.white54, size: 30),
                    ),
              title: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                authors,
                style: TextStyle(color: Colors.white70, fontSize: 13.sp),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 4.h),
            );
          },
        );
      }
      return const Center(child: Text("Please search for a book", style: TextStyle(color: Colors.white60)));
    },
  );
}
}
