import 'package:flutter/material.dart';

class BtnMore extends StatelessWidget {
  final VoidCallback? onClickMore;
  final String? title;
  const BtnMore({Key? key, @required this.title, this.onClickMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClickMore!();
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
        child: Row(
          children: [
            customImgTitle(),
            Text(
              title!,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Expanded(child: Container()),
            Container(
                width: 32,
                height: 32,
                child: Image(image: AssetImage('images/ic_more.png')))
          ],
        ),
      ),
    );
  }

  Widget customImgTitle() {
    return Container(
      margin: EdgeInsets.only(right: 3),
      width: 5,
      height: 20,
      decoration: BoxDecoration(
        color: Color(0xffCC5C29),
        borderRadius: const BorderRadius.all(Radius.circular(3)),
      ),
    );
  }
}
