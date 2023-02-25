import 'package:apec/resource/image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/base/base_controller.dart';

class HomeUserController extends BaseController {
  PageController pageController = PageController();
  var currentPage = 0.0.obs;

  RxList<String> listSlide = <String>[
    ApecImage.imageSlider1,
    ApecImage.imageSlider2,
    ApecImage.imageSlider3,
    ApecImage.imageSlider4,
  ].obs;

  void onInit() {
    super.onInit();

    pageController.addListener(() {
      /// Hàm callback, mỗi khi pageview thay đổi, hàm này đc gọi để truyền index
      currentPage.value = pageController.page!;
    });
  }
}












// import 'package:apec/widget/base/base_controller.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomeUserController extends BaseController {
//   final List<Widget> imagelist = [
//     Image(image: AssetImage('image/home.png')),
//     Image(image: AssetImage('image/home.png')),
//     Image(image: AssetImage('image/home.png')),
//     Image(image: AssetImage('image/home.png')),
//   ];
//   final CarouselController slidecontroler = CarouselController();
//   late RxInt currentindex = 0.obs;
//   final PageController dotscontroller = PageController();
//   late final RxInt currentPage = 0.obs;
//   void jumpToPage(index) {}

//   @override
//   void onInit() {
//     super.onInit();
//     slidecontroler.page;
//   }
// }
