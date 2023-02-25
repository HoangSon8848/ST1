import 'package:apec/controller/home_user_controller.dart';
import 'package:apec/controller/login_phone_controller.dart';
import 'package:apec/controller/login_forget_pass_controller.dart';
import 'package:apec/controller/login_user_pass_controller.dart';
import 'package:apec/controller/reset_pass_controller.dart';
import 'package:apec/core/service/api_request_sender.dart';
import 'package:apec/widget/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:apec/controller/home_controller.dart';
import 'package:apec/controller/gridview_controller.dart';

import '../controller/2reset_pass.dart';

class SampleBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiRequestSender>(() => ApiRequestSender());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<BaseController>(() => BaseController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<LoginUserpassController>(() => LoginUserpassController());
    Get.lazyPut<LoginForgetPassController>(() => LoginForgetPassController());
    Get.lazyPut<GridViewController>(
        () => GridViewController(image: '', text: ''));
    Get.lazyPut<ResetPassController>(() => ResetPassController());
    Get.lazyPut<ResetPass2Controller>(() => ResetPass2Controller());
    Get.lazyPut<HomeUserController>(() => HomeUserController());
  }
}
