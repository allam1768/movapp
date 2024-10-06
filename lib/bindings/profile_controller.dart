import 'package:get/get.dart';
import '../controllers/profile_controller.dart'; // Sesuaikan path dengan project kamu

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    // Mengikat ProfileController ke dalam dependensi
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
