import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/api_repository.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/local_storage_repository.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/provider/home/category/category_bloc.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CategoryBloc(
        apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
        localRepositoryInterface: context.read<LocalRepositoryInterface>(),
      )..loadProducts(),
      builder: (_, __) => CategoryScreen._(),
    );
  }


  @override
  Widget build(BuildContext context) {

    final categoryBloc = context.watch<CategoryBloc>();
    return categoryBloc.categoryList.isNotEmpty
          ? GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: categoryBloc.categoryList.length,
              itemBuilder: (context, index) {
                final product = categoryBloc.categoryList[index];
                return Text(product.name.toString());
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            );
  }
}