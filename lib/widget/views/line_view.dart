import 'package:flutter/material.dart';

class LineView extends StatelessWidget {
  final double? heightLine;
  final Color? colorLine;
  const LineView(
      {Key? key, @required this.heightLine, @required this.colorLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: heightLine,
      color: colorLine,
    );
  }
}
