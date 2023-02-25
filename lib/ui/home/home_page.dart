import 'package:apec/controller/home_controller.dart';
import 'package:apec/resource/definition_theme.dart';
import 'package:apec/widget/base/base_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageHome({}),
      ),
    );
  }
}

class PageHome extends BasePage<HomeController> {
  PageHome(inputData) : super(inputData);

  @override
  Widget buildSuccessWidget() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          ElevatedButton(
              onPressed: () {
                controller.onPressBtn();
              },
              // ignore: deprecated_member_use
              child: Text(
                "Login",
                style: olamozDarkTextTheme.subtitle1,
              ))
        ],
      ),
    );
  }
}
