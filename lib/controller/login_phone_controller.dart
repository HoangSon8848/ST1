import 'package:apec/widget/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resource/app_font.dart';
import '../resource/definition_color.dart';
import '../route/route_path.dart';

class LoginController extends BaseController {
  // String getUserNameFromServer() => 'Nguyen Doan Ba';
  // void onPressBtn() {
  //   print("Login thanh cong");
  // }
  final formkey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

  void showDialog() {
    Get.defaultDialog(
        onCustom: () {},
        title: '',
        content: Container(
          margin: EdgeInsets.only(left: 31),
          height: 30,
          width: 1000,
          child: Text(
            'Chuyen den trang dang nhap',
            textAlign: TextAlign.center,
            style: AppFonts.text12black400,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed(RoutePaths.LOGIN_PW, arguments: phoneController.text);
            },
            child: Container(
              height: 30,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border(
                    top: BorderSide(color: colorred21001),
                    bottom: BorderSide(color: colorred21001),
                    left: BorderSide(color: colorred21001),
                    right: BorderSide(color: colorred21001),
                  )),
              child: Center(
                child: Text(
                  'OK',
                  style: AppFonts.text12black400,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Container(
                height: 30,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border(
                      top: BorderSide(color: colorred21001),
                      bottom: BorderSide(color: colorred21001),
                      left: BorderSide(color: colorred21001),
                      right: BorderSide(color: colorred21001),
                    )),
                child: Center(
                    child: Text(
                  'Cancel',
                  style: AppFonts.text12black400,
                ))),
          ),
        ]);
  }
}
