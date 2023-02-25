import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apec/widget/base/base_controller.dart';
import 'package:apec/widget/universal/feature_universal.dart';
import 'package:apec/widget/views/error_view.dart';

abstract class BasePage<T extends BaseController> extends GetView<T> {
  final dynamic inputData;

  BasePage(this.inputData, {Key? key}) : super(key: key) {
    controller.loadData(inputData);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Obx(
        () => Stack(
          children: [
            controller.errorMessage.isNotEmpty
                ? ErrorView(
                    description: controller.errorMessage.tr,
                    isNoData: false,
                    onClickRetry: () {
                      controller.loadData(inputData);
                    },
                  )
                : buildSuccessWidget(),
            FeatureUniversal.showLoading(isLoading: controller.isLoading())
          ],
        ),
      ),
    );
  }

  Widget buildSuccessWidget();
}
