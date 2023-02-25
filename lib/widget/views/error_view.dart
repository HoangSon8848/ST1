import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apec/resource/definition_color.dart';

class ErrorView extends StatelessWidget {
  final String? description;
  final bool? isNoData;
  final VoidCallback? onClickRetry;

  const ErrorView(
      {Key? key, this.description, this.onClickRetry, this.isNoData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackGround,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              description!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            isNoData!
                ? Container()
                : GestureDetector(
                    onTap: () {
                      onClickRetry!();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xffCC5C29),
                      ),
                      width: 180,
                      height: 50,
                      child: Text(
                        'Retry'.tr,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
