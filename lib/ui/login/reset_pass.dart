import 'package:apec/controller/reset_pass_controller.dart';
import 'package:apec/resource/app_font.dart';
import 'package:apec/resource/definition_color.dart';
import 'package:apec/route/route_path.dart';
import 'package:apec/widget/base/base_page.dart';
import 'package:apec/widget/button_appbar/btn_primary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relative_scale/relative_scale.dart';
//import 'package:/base/app_font.dart';
//import 'package:apec/widget/base/app_font.dart';

class ResetPassWord extends StatelessWidget {
  const ResetPassWord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResetPass({});
  }
}

class ResetPass extends BasePage<ResetPassController> {
  ResetPass(inputData) : super(inputData);

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
        body: Container(
          margin: EdgeInsets.only(top: sy(50), left: sx(30), right: sx(30)),
          child: Column(
            children: [
              Text(
                'Nhap so dien thoai/email nhan ma xac thuc',
                style: AppFonts.text16grey400,
              ),
              SizedBox(
                height: sy(20),
              ),
              Form(
                key: controller.formkey,
                child: TextFormField(
                  controller: controller.phonecontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Vui long nhap so dien thoai';
                    }
                    if (value.length < 9 || value.length > 12) {
                      return 'Nhap dung so dien thoai 9-12 chu so';
                    }
                    return null;
                  },
                  onChanged: (value) =>
                      controller.formkey.currentState!.validate(),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixText: '   ',
                      hintText: ' Phone/email',
                      hintStyle: AppFonts.text16grey400,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: sy(20),
              ),
              BtnPrimary(
                  onPressed: () {
                    if (controller.formkey.currentState!.validate()) {
                      Get.toNamed(RoutePaths.RESET_PASS_2,
                          arguments: controller.phonecontroller.text);
                    }
                  },
                  textprimary: 'Tiep tuc',
                  margin: EdgeInsets.zero)
            ],
          ),
        ),
      );
    });
  }
}
