import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class FeatureUniversal {
  static Widget showLoading({@required bool? isLoading}) {
    return isLoading!
        ? Container(
            color: Colors.transparent,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container();
  }

  static Widget progressReloadData({@required Widget? content}) {
    return ModalProgressHUD(
        inAsyncCall: false,
        progressIndicator: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(188),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(22),
          child: const CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
        ),
        child: content!);
  }
}
