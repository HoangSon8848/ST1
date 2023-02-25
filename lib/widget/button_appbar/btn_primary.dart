import 'package:apec/resource/app_font.dart';
import 'package:apec/resource/definition_color.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class BtnPrimary extends StatelessWidget {
  const BtnPrimary({
    Key? key,
    required this.onPressed,
    required this.textprimary,
    required this.margin,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String textprimary;
  final EdgeInsetsGeometry margin;
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Container(
        margin: margin,
        height: sy(40),
        decoration: BoxDecoration(
            //color: colorred21001,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(blurRadius: 1, offset: Offset(0, 5), color: Colors.grey)
            ]),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color?>(colorred21001)),
          child: Center(
            child: Text(
              textprimary,
              style: AppFonts.text18white500,
            ),
          ),
        ),
      );

      // return GestureDetector(

      //     child: Container(
      //       //margin: EdgeInsets.only(left: sx(31), right: sx(31)),
      //       height: sy(40),
      //       width: sx(double.infinity),
      //       decoration: BoxDecoration(
      //           color: colorred21001,
      //           borderRadius: BorderRadius.circular(10),
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.grey,
      //               blurRadius: 2,
      //               offset: Offset(0, 5),
      //             )
      //           ]),
      //       child: Center(
      //         child: Text(
      //           'Tiếp theo',
      //           style: AppFonts.textlogin,
      //         ),
      //       ),
      //     ));
      // // GestureDetector(
      // //   onTap: () {},
      // //   child: Container(
      // //     margin: EdgeInsets.only(left: sx(31), right: sx(31)),
      // //     height: sy(40),
      // //     width: double.infinity,
      // //     decoration: BoxDecoration(
      // //         color: colorred21001,
      // //         borderRadius: BorderRadius.circular(10),
      // //         boxShadow: [
      // //           BoxShadow(
      // //             color: colorgrey575656,
      // //             blurRadius: 2,
      // //             offset: Offset(0, 5),
      // //           )
      // //         ]),
      // //     child: Center(
      // //       child: Text('Dang nhap', style: AppFonts.textlogin),
      // //     ),
      // //   ),
      // // );
    });
  }
}
