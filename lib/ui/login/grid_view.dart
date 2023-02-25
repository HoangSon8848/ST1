import 'package:apec/resource/app_font.dart';
import 'package:apec/resource/definition_color.dart';
import 'package:apec/widget/base/base_controller.dart';
import 'package:apec/widget/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class TestGridView extends StatelessWidget {
  const TestGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TestGV('');
  }

  static count({required int crossAxisCount}) {}
}

class TestGV extends BasePage<BaseController> {
  TestGV(inputData) : super(inputData);

  @override
  Widget buildSuccessWidget() {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: colorwhiteffffff,
            shadowColor: colorgrey575656,
            leading: Icon(
              Icons.arrow_back,
              color: colorblack353535,
            ),
            centerTitle: true,
            title: Text('Dich vu', style: AppFonts.text18red800),
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10))),
          ),
          body: GridView(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 4 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          ));
    });
  }
}
