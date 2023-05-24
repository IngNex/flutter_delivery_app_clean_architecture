//import 'package:flutter_delivery_app_clean_architecture/domain/repository/api_repository.dart';
import 'package:flutter_delivery_app_clean_architecture/domain/repository/local_storage_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  //final ApiRepositoryInterface apiRepositoryInterface;

  ProfileController({
    required this.localRepositoryInterface,
    //required this.apiRepositoryInterface,
  });

  @override
  void onReady() {
    loadUser();
    super.onReady();
  }

  void loadUser() {}
}
