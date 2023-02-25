import 'package:apec/ui/login/2reset_pass.dart';
import 'package:apec/ui/login/grid_view.dart';
import 'package:apec/ui/login/login_forget_password.dart';
import 'package:apec/ui/login/login_user_pass.dart';
import 'package:apec/ui/login/login_phone_number.dart';
import 'package:apec/ui/login/reset_pass.dart';
import 'package:get/get.dart';
import 'package:apec/binding/samplebinding.dart';
import 'package:apec/route/route_path.dart';
import 'package:apec/ui/home/home_page.dart';

import '../ui/login/home_user.dart';

class CinetopRouter {
  static final List<GetPage> pages = [
    GetPage(
      name: RoutePaths.HOME,
      page: () => HomePage(),
      binding: SampleBind(),
    ),
    GetPage(
      name: RoutePaths.LOGIN_PHONE_NUMBER,
      page: () => LoginPagePhone(),
      binding: SampleBind(),
    ),
    GetPage(
      name: RoutePaths.LOGIN_PW,
      page: () => LoginPagePW(),
      binding: SampleBind(),
    ),
    GetPage(
      name: RoutePaths.LOGIN_FPW,
      page: () => LoginForgetPass(),
      binding: SampleBind(),
    ),
    GetPage(
      name: RoutePaths.TEST_GRID_VIEW,
      page: () => TestGridView(),
      binding: SampleBind(),
    ),
    GetPage(
      name: RoutePaths.RESET_PASS,
      page: () => ResetPassWord(),
      binding: SampleBind(),
    ),
    GetPage(
      name: RoutePaths.RESET_PASS_2,
      page: () => ResetPassWord2(),
      binding: SampleBind(),
    ),
    GetPage(
      name: RoutePaths.HOME_USER,
      page: () => HomeUser(''),
      binding: SampleBind(),
    ),

    // GetPage(
    //   name: RoutePaths.LOGIN1,
    //   page: () => Login1(),
    //   binding: SampleBind(),
    // ),
  ];
}
