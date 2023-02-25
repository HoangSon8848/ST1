import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../resource/app_font.dart';
import '../../resource/definition_color.dart';

class AppBarPrimary extends StatelessWidget with PreferredSizeWidget {
  AppBarPrimary({
    Key? key,
    required this.onPressed,
    required this.titletext,
  }) : super();
  final VoidCallback onPressed;
  final String titletext;
  @override
  RelativeBuilder build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: colorwhiteffffff,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        leading: IconButton(
            onPressed: onPressed,
            //Get.to(LoginPhoneNumber(''));

            icon: Icon(
              Icons.arrow_back,
              color: colorred21001,
            )),
        title: Text(
          titletext,
          style: AppFonts.text18red800,
        ),
      );
    });
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
