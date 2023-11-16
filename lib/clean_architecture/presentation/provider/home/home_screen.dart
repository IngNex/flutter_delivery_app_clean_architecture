import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/api_repository.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/local_storage_repository.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/provider/cart/cart_bloc.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/provider/cart/cart_screen.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/provider/home/category/category_screen.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/provider/home/products/products_screen.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/provider/home/profile/profile_screen.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/common/theme.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/provider/home/home_bloc.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen._();

  static Widget init(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeBloc(
            apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
            localRepositoryInterface: context.read<LocalRepositoryInterface>(),
          )..loadUser(),
          builder: (_, __) => HomeScreen._(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBloc>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: IndexedStack(
              index: bloc.indexSelected,
              children: [
                ProductsScreen.init(context),
                CategoryScreen.init(context),
                CartScreen(
                  onShopping: (() {
                    bloc.updateIndexSelected(0);
                  }),
                ),
                const Placeholder(),
                ProfileScreen.init(context),
              ],
            ),
          ),
          _DeliveryNavigationBar(
            index: bloc.indexSelected,
            onIndexSelected: (index) {
              bloc.updateIndexSelected(index);
            },
          ),
        ],
      ),
    );
  }
}

class _DeliveryNavigationBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;

  _DeliveryNavigationBar(
      {super.key, required this.index, required this.onIndexSelected});
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBloc>(context);
    final cartBloc = Provider.of<CartBloc>(context);
    final user = bloc.user;
    return Padding(
      padding: EdgeInsets.all(20),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).canvasColor,
            border: Border.all(color: Theme.of(context).bottomAppBarColor)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                child: IconButton(
                  onPressed: () => onIndexSelected(0),
                  icon: Icon(Icons.home),
                  color: index == 0
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                ),
              ),
              Material(
                child: IconButton(
                  onPressed: () => onIndexSelected(1),
                  icon: Icon(Icons.store),
                  color: index == 1
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                ),
              ),
              Material(
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: DeliveryColors.purple,
                      radius: 23,
                      child: IconButton(
                        onPressed: () => onIndexSelected(2),
                        icon: Icon(Icons.shopping_basket),
                        color: index == 2
                            ? DeliveryColors.green
                            : DeliveryColors.white,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: cartBloc.totalItems == 0
                          ? const SizedBox.shrink()
                          : CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.pinkAccent,
                              child: Text(cartBloc.totalItems.toString()),
                            ),
                    ),
                  ],
                ),
              ),
              Material(
                child: IconButton(
                  onPressed: () => onIndexSelected(3),
                  icon: Icon(Icons.favorite_border),
                  color: index == 3
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                ),
              ),
              Material(
                child: InkWell(
                  onTap: () => onIndexSelected(4),
                  child: user.image.isEmpty
                      ? const SizedBox.shrink()
                      : CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage(user.image),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
