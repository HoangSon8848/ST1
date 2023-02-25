import 'package:apec/controller/login_forget_pass_controller.dart';
import 'package:apec/resource/app_font.dart';
import 'package:apec/resource/definition_color.dart';
import 'package:apec/widget/base/base_page.dart';
import 'package:apec/widget/button_appbar/btn_primary.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
// ignore: unused_import
import 'package:get/get.dart';

class LoginForgetPass extends StatelessWidget {
  const LoginForgetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginFP('');
  }
}

class LoginFP extends BasePage<LoginForgetPassController> {
  LoginFP(inputData) : super(inputData);

  @override
  Widget buildSuccessWidget() {
    // TODO: implement buildSuccessWidget
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
            'Nhap ma xac thuc',
            style: AppFonts.text16red500,
          ),
          // roouderRectangleborder : Bo tron AppBar
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(left: sx(31), right: sx(31)),
          child: ListView(children: [
            SizedBox(
              height: sy(50),
            ),
            Center(
                child: Text(
              'Ma xac thuc OTP da duoc gui toi',
              style: AppFonts.text15black400,
            )),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text('${controller.sentdata2}'),
            ),
            SizedBox(
              height: sy(30),
            ),
            Form(
              key: controller.formkeyactive,
              child: TextFormField(
                controller: controller.activecontroller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Vui long nhap ma xac thuc';
                  }
                  if (value.length != 6) {
                    return ' Ban da nhap sai ma xac thuc';
                  }
                  return null;
                },
                // onChanged: (value) {
                //   controller.formkeyactive.currentState!.validate();
                //},
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: ' Ma kick hoat',
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        EdgeInsets.only(left: 20, top: 20, bottom: 20),
                    hintStyle: AppFonts.text16grey400,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(height: sy(7)),
            Obx(
              () => Form(
                key: controller.formkeypw1,
                child: TextFormField(
                  controller: controller.setpw1controller,
                  obscureText: !controller.isShowPw1.value,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Vui long nhap mat khau';
                    }
                    if (value.length < 6) {
                      return 'Vui long nhap mat khau lon hon 6 ky tu';
                    }
                    return null;
                  },
                  // onChanged: (value) {
                  //   controller.formkeypw1.currentState!.validate();
                  //},
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: ' Mat khau',
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          EdgeInsets.only(left: 20, top: 20, bottom: 20),
                      hintStyle: AppFonts.text16grey400,
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.isShowPw1.value =
                                !controller.isShowPw1.value;
                          },
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: colorblack353535,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ),
            SizedBox(height: sy(7)),
            Form(
              key: controller.formkeypw2,
              child: TextFormField(
                controller: controller.setpw2controller,
                obscureText: true,
                validator: (value) {
                  if (controller.setpw1controller.text !=
                      controller.setpw2controller.text) {
                    return 'Nhap lai mat khau khong dung';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: ' Nhap lai mat khau',
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        EdgeInsets.only(left: 20, top: 20, bottom: 20),
                    hintStyle: AppFonts.text16grey400,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(
              height: sy(25),
            ),
            BtnPrimary(
                onPressed: () {
                  if (controller.formkeyactive.currentState!.validate() &&
                      controller.formkeypw1.currentState!.validate() &&
                      controller.formkeypw2.currentState!.validate()) {
                    return controller.showDialog();
                  }
                },
                textprimary: 'Tiep tuc',
                margin: EdgeInsets.zero),
            SizedBox(
              height: sy(20),
            ),
            Text(
              'Ban chua nhan duoc ma kick hoat?',
              style: AppFonts.text16grey400,
              textAlign: TextAlign.center,
            ),
            Obx(
              () => Visibility(
                visible: !controller.isVisible.value,
                child: TextButton(
                  onPressed: () {
                    controller.cd();
                  },
                  child: Text(
                    'Gui lai ma kick hoat',
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
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ]),
        ),
      );
    });
  }
}
