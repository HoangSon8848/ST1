import 'dart:async';

import 'package:apec/resource/app_font.dart';
import 'package:apec/widget/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPass2Controller extends BaseController {
  final formkey = GlobalKey<FormState>();
  final activecode = GlobalKey<FormState>();
  final keypass = GlobalKey<FormState>();
  final keypass2 = GlobalKey<FormState>();

  final phonecontroller = TextEditingController();
  final codecontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final pass2controller = TextEditingController();
  var sentdata = Get.arguments;
  RxInt countdown = 5.obs;

  RxBool isVisible = false.obs;
  void onInit() {
    super.onInit();
    phonecontroller.text = sentdata;
  }

  void test() {
    isVisible.value = true;
    Timer.periodic(new Duration(seconds: 1), (timer) {
      countdown--;
      if (countdown.value == 0) {
        timer.cancel();
        isVisible.value = false;
        countdown.value = 5;
      }
    });
  }

//   int start = 30;
// int current = 30;

// void startTimer() {
//   CountdownTimer countDownTimer = new CountdownTimer(
//     new Duration(seconds: start),
//     new Duration(seconds: 1),
//   );

//   var sub = countDownTimer.listen(null);
//   sub.onData((duration) {
//     setState(() { current = start - duration.elapsed.inSeconds; });
//   });

//   sub.onDone(() {
//     print("Done");
//     sub.cancel();
//   });
// }
  void showAlert() {
    Get.defaultDialog(
      title: '',
      content: Column(
        children: [
          Text(
            'Doi mat khau thanh cong\nVui long dang nhap lai',
            textAlign: TextAlign.center,
            style: AppFonts.text18red800,
          ),
          OutlinedButton(
              onPressed: () {
                Get.close(5);
              },
              child: Text('OK'))
        ],
      ),
    );
  }
}
