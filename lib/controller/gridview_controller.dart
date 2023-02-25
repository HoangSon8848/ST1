import 'package:apec/resource/app_font.dart';
import 'package:apec/resource/definition_color.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class GridViewController extends StatelessWidget {
  GridViewController({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  final String image;
  final String text;
  // final VoidCallback onPressed;
  // final String textprimary;
  // final EdgeInsetsGeometry margin;
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Container(
        // padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 5, left: 5, right: 5),
        height: sy(40),
        width: sx(40),
        decoration: BoxDecoration(
          color: colorwhiteffffff,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: colorgrey575656,
              blurRadius: 2,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(image),
              height: sy(30),
              width: sy(40),
            ),
            SizedBox(
              height: sy(10),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: AppFonts.text10black400,
            )
          ],
        ),
      );
    });
  }
}
