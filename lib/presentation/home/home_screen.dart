import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/presentation/home/products/products_screen.dart';
import 'package:flutter_delivery_app_clean_architecture/presentation/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: IndexedStack(
            index: currentIndex,
            children: [
              ProductsScreen(),
              Text('currentIndex 2 - $currentIndex'),
              Text('currentIndex 3 - $currentIndex'),
              Text('currentIndex 4 - $currentIndex'),
              Text('currentIndex 5 - $currentIndex')
            ],
          )),
          _DeliveryNavigationBar(
            index: currentIndex,
            onIndexSelected: (index) {
              setState(
                () {
                  currentIndex = index;
                },
              );
            },
          )
        ],
      ),
    );
  }
}

class _DeliveryNavigationBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;
  const _DeliveryNavigationBar(
      {super.key, required this.index, required this.onIndexSelected});
  @override
  Widget build(BuildContext context) {
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
                child: CircleAvatar(
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
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: index == 4
                        ? DeliveryColors.green
                        : DeliveryColors.lightGrey,
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
