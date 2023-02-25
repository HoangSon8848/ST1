import 'package:apec/controller/login_user_pass_controller.dart';
import 'package:apec/resource/app_font.dart';
import 'package:apec/route/route_path.dart';
import 'package:apec/ui/login/reset_pass.dart';
import 'package:apec/widget/base/base_page.dart';
import 'package:apec/widget/button_appbar/btn_primary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../resource/definition_color.dart';
//import 'package:/base/app_font.dart';
//import 'package:apec/widget/base/app_font.dart';

class LoginPagePW extends StatelessWidget {
  const LoginPagePW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginPw({});
  }
}

class LoginPw extends BasePage<LoginUserpassController> {
  LoginPw(inputData) : super(inputData);

  @override
  Widget buildSuccessWidget() {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBarPrimary(
        //   onPressed: () {
        //     Get.back();
        //   },
        //   titletext: 'Nhap mat khau',
        // ),
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: colorwhiteffffff,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          leading: IconButton(
              onPressed: () {
                Get.close(2);
              },
              icon: Icon(
                Icons.arrow_back,
                color: colorred21001,
              )),
          title: Text(
            'Nhap mat khau',
            style: AppFonts.text18red800,
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(left: sx(31), right: sx(31)),
          child: ListView(
            children: [
              SizedBox(
                height: sx(117),
              ),
              Form(
                key: controller.fomrkeyuser,
                child: TextFormField(
                  controller: controller.usercontroller,
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ' Vui long nhap so dien thoai';
                    }
                    if (value.length < 9 || value.length > 12) {
                      return ' Nhap dung so dien thoai 9-12 chu so';
                    } else
                      return null;
                  },
                  onChanged: (value) {
                    controller.fomrkeyuser.currentState!.validate();
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixText: ' +84 ',
                      hintText: 'So dien thoai',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7))),
                ),
              ),
              SizedBox(
                height: sx(15),
              ),
              Obx(
                () => Form(
                  key: controller.formkeypw,
                  child: TextFormField(
                    controller: controller.passcontroller,
                    obscureText: !controller.isShowPass.value,
                    //obscureText: !controller.isShowPass.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ' Vui long nhap mat khau';
                      }
                      if (value.length < 6) {
                        return 'Mat khau phai tren 6 ky tu';
                      } else
                        return null;
                    },
                    // onChanged: (value) {
                    //   controller.formkeypw.currentState!.validate(); //////////
                    //},
                    decoration: InputDecoration(
                        prefixText: '  ',
                        hintText: '      Mat khau',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.isShowPass.value =
                                !controller.isShowPass.value;
                          },
                          child: Icon(Icons.remove_red_eye),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7))),
                  ),
                ),
              ),
              SizedBox(
                height: sy(30),
              ),
              BtnPrimary(
                margin: EdgeInsets.zero,
                onPressed: () {
                  if (controller.fomrkeyuser.currentState!.validate() &&
                      controller.formkeypw.currentState!.validate()) {
                    return controller.showDialog();
                  }
                },
                textprimary: 'Tiep theo',
              ),
              SizedBox(
                height: sy(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.to(ResetPass(''));
                      },
                      child: Text(
                        'Doi mat khau',
                        style: AppFonts.text16grey400,
                      )),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(RoutePaths.LOGIN_FPW,
                            arguments: controller.usercontroller.text);
                      },
                      child: Text(
                        'Quen mat khau?',
                        style: AppFonts.text16red500,
                      )),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
