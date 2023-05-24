import 'package:flutter_delivery_app_clean_architecture/domain/model/user_modal.dart';
import 'package:flutter_delivery_app_clean_architecture/domain/repository/api_repository.dart';
import 'package:flutter_delivery_app_clean_architecture/domain/repository/local_storage_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController({
    required this.apiRepositoryInterface,
    required this.localRepositoryInterface,
  });
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  Rx<User> user = User.empty().obs;
  RxInt indexSelected = 0.obs;

  @override
  void onReady() {
    loadUser();
    super.onReady();
  }

  void loadUser() {
    localRepositoryInterface.getUser().then(
          (value) => {
            user(value),
          },
        );
  }

  void updateIndexSelected(int index) {
    indexSelected(index);
  }
}
