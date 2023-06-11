import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/api_repository.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/local_storage_repository.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/provider/home/home_screen.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/common/theme.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/common/delivery_button.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/provider/login/login_bloc.dart';
import 'package:provider/provider.dart';

const logoSize = 45.0;

class LoginScreen extends StatelessWidget {
  LoginScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginBloc(
        apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
        localRepositoryInterface: context.read<LocalRepositoryInterface>(),
      ),
      builder: (_, __) => LoginScreen._(),
    );
  }

  void login(BuildContext context) async {
    final bloc = context.read<LoginBloc>();
    final result = await bloc.login();
    if (result) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => HomeScreen.init(context),
        ),
      );
    } else {
      //Get.snackbar('Error', 'Login incorrect');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Correct'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<LoginBloc>();
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final moreSize = 50.0;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: logoSize,
                      left: -moreSize / 2,
                      right: -moreSize / 2,
                      height: width + moreSize,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: deliveryGradients,
                            stops: [
                              0.5,
                              1.0,
                            ],
                          ),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(width),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        radius: logoSize,
                        backgroundColor: Theme.of(context).canvasColor,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            'assets/icons/ingnex.png',
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            'Login',
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 50),
                          Text(
                            'Username',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .inputDecorationTheme
                                        .labelStyle
                                        ?.color),
                          ),
                          TextField(
                            controller: bloc.usernameTextController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              hintText: 'username',
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Password',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .inputDecorationTheme
                                        .labelStyle
                                        ?.color),
                          ),
                          TextField(
                            controller: bloc.passwordTextController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              hintText: 'password',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: DeliveryButton(
                  onTap: () => login(context),
                  text: 'Login',
                  padding: const EdgeInsets.all(15),
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: (bloc.loginState == LoginState.loading)
                ? Container(
                    color: Colors.black26,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
