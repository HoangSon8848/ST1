import 'dart:async';

import 'package:apec/resource/app_font.dart';
import 'package:apec/resource/definition_color.dart';
import 'package:apec/widget/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForgetPassController extends BaseController {
  final T = TextEditingController();
  final formkeyactive = GlobalKey<FormState>();
  final formkeypw1 = GlobalKey<FormState>();
  final formkeypw2 = GlobalKey<FormState>();
  final activecontroller = TextEditingController();
  final setpw1controller = TextEditingController();
  final setpw2controller = TextEditingController();
  final RxBool isShowPw1 = false.obs;
  final RxBool isshowPw2 = false.obs;
  var sentdata2 = Get.arguments;
  var countdown = 5.obs;
  RxBool isVisible = false.obs;
  void onInit() {
    super.onInit();
    T.text = sentdata2;
  }

  void cd() {
    isVisible.value = true;

    Timer.periodic(Duration(seconds: 1), (timer) {
      countdown--;
      if (countdown.value == 0) {
        timer.cancel();
        isVisible.value = false;
        countdown = 5.obs;
      }
    });
  }

  void showDialog() {
    Get.defaultDialog(
        title: '',
        content: Container(
          margin: EdgeInsets.only(left: 31, right: 31),
          height: 50,
          width: double.infinity,
          child: Text(
            'Lay lai mat khau thanh cong\n     Moi ban dang nhap lai',
            style: AppFonts.text18red800,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              //Get.to(LoginPhoneNumber(''));
              Get.close(4);
              //Get.to(LoginPhoneNumber(''));
            },
            child: Container(
              height: 30,
              width: 50,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: colorred21001),
                  bottom: BorderSide(color: colorred21001),
                  left: BorderSide(color: colorred21001),
                  right: BorderSide(color: colorred21001),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  'Ok',
                  style: AppFonts.text16grey400,
                ),
              ),
            ),
          )
        ]);
  }
}
