import 'package:flutter/material.dart';

class BtnBack extends StatelessWidget {
  final VoidCallback? onClickBack;

  const BtnBack({Key? key, this.onClickBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClickBack!();
      },
      child: Container(
        margin: EdgeInsets.only(left: 16, top: 10),
        width: 32,
        height: 32,
        child: Image(image: AssetImage('images/ic_back.png')),
      ),
    );
  }
}
