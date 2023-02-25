// ignore_for_file: non_constant_identifier_names

import 'package:apec/resource/app_font.dart';
import 'package:apec/resource/definition_color.dart';
import 'package:apec/widget/base/base_page.dart';
import 'package:apec/widget/button_appbar/btn_primary.dart';
import 'package:apec/widget/button_appbar/form_primary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../controller/2reset_pass.dart';
//import 'package:/base/app_font.dart';
//import 'package:apec/widget/base/app_font.dart';

class ResetPassWord2 extends StatelessWidget {
  const ResetPassWord2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResetPass2({});
  }
}

class ResetPass2 extends BasePage<ResetPass2Controller> {
  ResetPass2(inputData) : super(inputData);

  @override
  Widget buildSuccessWidget() {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: sy(50),
          backgroundColor: colorwhiteffffff,
          shadowColor: colorgrey575656,
          leading: IconButton(
            onPressed: () {
              Get.close(1);
            },
            icon: Icon(
              Icons.arrow_back,
              color: colorblack353535,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Reset your password?',
            style: AppFonts.text18red800,
          ),
          // roouderRectangleborder : Bo tron AppBar
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: sy(30), left: sx(30), right: sx(30)),
            child: Column(
              children: [
                Text(
                  'Chung toi da gui ma kich hoat den email cua ban,\nhay kiem tra email va nhap ma xac thuc vao day',
                  style: AppFonts.text16grey400,
                ),
                SizedBox(
                  height: sy(15),
                ),
                FormPrimary(
                  keys: controller.formkey,
                  controller: controller.phonecontroller,
                  prefixText: '  ',
                  hintText: '',
                ),
                SizedBox(
                  height: sy(5),
                ),
                FormPrimary(
                  validator: (Value) {
                    if (Value!.isEmpty) {
                      return 'Vui long nhap ma kick hoat';
                    }

                    if (Value != '123456') {
                      return ' Ma kick hoat sai';
                    }
                    return null;
                  },
                  // onChanged: (Value) =>
                  //     {controller.activecode.currentState!.validate()},
                  keys: controller.activecode,
                  controller: controller.codecontroller,
                  prefixText: '  ',
                  hintText: 'Ma kick hoat',
                ),
                SizedBox(
                  height: sy(5),
                ),
                FormPrimary(
                  validator: (Value) {
                    if (Value!.isEmpty) {
                      return 'Vui long nhap mat khau';
                    }
                    if (Value.length < 6) {
                      return 'Vui long nhap mat khau lon hon 6 ky tu';
                    }
                    return null;
                  },
                  // onChanged: (Value) =>
                  //     {controller.keypass.currentState!.validate()},
                  keys: controller.keypass,
                  controller: controller.passcontroller,
                  prefixText: '  ',
                  hintText: 'Nhap mat khau moi',
                ),
                SizedBox(
                  height: sy(5),
                ),
                FormPrimary(
                  validator: (Value) {
                    if (controller.passcontroller.text !=
                        controller.pass2controller.text) {
                      return 'Nhap lai mat khau khong dung';
                    }
                    return null;
                  },
                  keys: controller.keypass2,
                  controller: controller.pass2controller,
                  prefixText: '  ',
                  hintText: 'Nhap lai mat khau moi',
                ),
                SizedBox(
                  height: sy(20),
                ),
                BtnPrimary(
                    onPressed: () {
                      if (controller.activecode.currentState!.validate() &&
                          controller.keypass.currentState!.validate() &&
                          controller.keypass2.currentState!.validate()) {
                        controller.showAlert();
                      }
                    },
                    textprimary: 'Tiep tuc',
                    margin: EdgeInsets.zero),
                SizedBox(
                  height: sy(20),
                ),
                Text(
                  'Ban chua nhan duoc ma kich hoat?',
                  style: AppFonts.text16grey400,
                ),
                Obx(
                  () => Visibility(
                    visible: !controller.isVisible.value,
                    child: TextButton(
                      onPressed: () {
                        controller.test();
                      },
                      child: Text(
                        'Gui lai ma kich hoat',
                        style: AppFonts.text16red500,
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                      visible: controller.isVisible.value,
                      child: Text(
                        'Ma kich hoat se gui sau: ${controller.countdown}',
                        style: AppFonts.text16red500,
                      )),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
