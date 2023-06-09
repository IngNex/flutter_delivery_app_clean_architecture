import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/main_clean_architecture_getx.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/main_clean_architecture_provider.dart';
import 'package:get/get.dart';

class MainCleanArchitecture extends StatelessWidget {
  const MainCleanArchitecture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clean Architectire GetX & Provider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MainGetX()),
                );
              },
              child: Text('Clean Architecture + Get X'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MainProvider()),
                );
              },
              child: Text('Clean Architecture + Provider'),
            ),
          ],
        ),
      ),
    );
  }
}
