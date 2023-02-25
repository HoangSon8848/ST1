//import 'package:apec/controller/home_controller.dart';
// import 'package:apec/resource/definition_theme.dart';
// import 'package:apec/widget/base/base_page.dart';

// ignore_for_file: unnecessary_statements
import 'dart:async';

import 'package:apec/controller/login_phone_controller.dart';
import 'package:apec/resource/image.dart';
import 'package:apec/widget/base/base_page.dart';
import 'package:apec/widget/button_appbar/btn_primary.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
//import 'package:/base/app_font.dart';
import 'package:apec/resource/app_font.dart';

//import 'package:apec/widget/base/app_font.dart';

class LoginPagePhone extends StatelessWidget {
  const LoginPagePhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginPhoneNumber({});
  }
}

class LoginPhoneNumber extends BasePage<LoginController> {
  LoginPhoneNumber(inputData) : super(inputData);

  @override
  Widget buildSuccessWidget() {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
            backgroundColor: Colors.white,
            // appBar: AppBar(
            //   toolbarHeight: sx(50),
            //   backgroundColor: Colors.white,
            // ),

            body: ListView(
              padding: EdgeInsets.only(top: sy(0)),
              children: [
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: sy(44),
                        ),
                        Image.asset(ApecImage.logo),
                        SizedBox(
                          height: sy(5),
                        ),
                        Text(
                          'Welcome to',
                          style: AppFonts.text22black100,
                        ),
                        SizedBox(
                          height: sx(1),
                        ),
                        Text(
                          'APEC INITIAL',
                          style: AppFonts.text22black400,
                        ),
                        SizedBox(height: sy(20)),
                        Padding(
                          padding: EdgeInsets.only(left: sx(31), right: sx(31)),
                          child: Form(
                            key: controller.formkey,
                            child: TextFormField(
                              controller: controller.phoneController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ' Vui long nhap so dien thoai';
                                }
                                if (value.length < 9 || value.length > 12) {
                                  return ' Nhap so dien thoai 9-12 chu so';
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                Timer(Duration(seconds: 5), () {
                                  controller.formkey.currentState!.validate();
                                });
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: 'Nhập số điện thoại của bạn',
                                  prefixText: '         +84  ',
                                  //contentPadding: EdgeInsets,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: sx(30),
                        ),
                        BtnPrimary(
                          margin: EdgeInsets.only(left: sx(31), right: sx(31)),
                          onPressed: () {
                            if (controller.formkey.currentState!.validate())
                            //controller.formkey.currentState!.validate())
                            //Get.toNamed(RoutePaths.LOGIN_PW);
                            {
                              controller.showDialog();
                            }

                            return null;
                          },
                          textprimary: 'Dang nhap',
                        ),
                      ]),
                ),
              ],
            ));
      },
    );
  }
}
