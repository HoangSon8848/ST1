import 'package:apec/resource/app_font.dart';
import 'package:apec/widget/base/base_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginUserpassController extends BaseController {
  var sentdata = Get.arguments;
  final RxBool isShowPass = false.obs;
  final fomrkeyuser = GlobalKey<FormState>();
  final formkeypw = GlobalKey<FormState>();
  final usercontroller = TextEditingController();
  final passcontroller = TextEditingController();

  void onInit() {
    super.onInit();
    usercontroller.text = sentdata;
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   usercontroller.text = test;
  // }

  void showDialog() {
    Get.defaultDialog(
        title: '',
        content: Text(
          'VCL',
          style: AppFonts.text18red800,
          textAlign: TextAlign.center,
        ));
  }
}
