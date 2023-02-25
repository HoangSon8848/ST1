import 'package:flutter/material.dart';

class BtnEdit extends StatelessWidget {
  final VoidCallback? onClickEdit;

  const BtnEdit({Key? key, this.onClickEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClickEdit!();
      },
      child: Container(
        margin: EdgeInsets.only(right: 16, top: 10),
        width: 32,
        height: 32,
        child: Icon(
          Icons.edit,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
