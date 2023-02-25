import 'package:apec/resource/definition_color.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../controller/home_user_controller.dart';
import '../../widget/base/base_page.dart';

class HomeUser extends BasePage<HomeUserController> {
  HomeUser(inputData) : super(inputData);

  @override
  Widget buildSuccessWidget() {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Obx(() =>
            Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              Container(
                  height: sy(150),
                  child: PageView.builder(
                      controller: controller.pageController,
                      itemCount: controller.listSlide.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Image.asset(
                            controller.listSlide[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      })),
              Material(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DotsIndicator(
                      dotsCount: controller.listSlide.length,
                      position: controller.currentPage.value,
                      decorator: DotsDecorator(
                        size: Size.square(10),
                        activeSize: Size.square(15),
                        activeColor: colorred21001,
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onTap: (index) {
                        // Chuyển đến trang tương ứng với phần tử được chọn
                        controller.pageController.animateToPage(
                          index.toInt(),
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInSine, // Hieu ung chuyen trang
                        );
                      }

                      //},
                      ),
                ),
              ),
            ]));
      },
    );
  }
}










// import 'package:apec/widget/base/base_page.dart';
// import 'package:carousel_pro/carousel_pro.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:relative_scale/relative_scale.dart';

// import '../../controller/home_user_controller.dart';

// class HomeUser extends BasePage<HomeUserController> {
//   HomeUser(inputData) : super(inputData);

//   @override
//   Widget buildSuccessWidget() {
//     return RelativeBuilder(
//       builder: (context, height, width, sy, sx) {
//         return Scaffold(
//           appBar: AppBar(
//             toolbarHeight: sy(50),
//             title: Text("TEST SLIDE"),
//             centerTitle: true,
//           ),
//           body: Column(
//             children: [
//               SizedBox(
//                 height: sy(20),
//               ),
//               Stack(children: [
//                 Container(
//                   height: sy(150),
//                   width: double.infinity,
//                   child: CarouselSlider(
//                     carouselController: controller.slidecontroler,
//                     items: controller.imagelist,
//                     options: CarouselOptions(
//                       aspectRatio: 1.0,
//                       viewportFraction: 1,
//                       enableInfiniteScroll: true,
//                       autoPlay: false,
//                       autoPlayInterval: Duration(seconds: 3),
//                       autoPlayAnimationDuration: Duration(milliseconds: 800),
//                       autoPlayCurve: Curves.fastOutSlowIn,
//                       pauseAutoPlayOnTouch: true,
//                       enlargeCenterPage: true,
//                       scrollDirection: Axis.horizontal,
//                       onPageChanged: (index, _) {
//                         controller.currentindex.value = index;
//                       },
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 175),
//                   child: Center(
//                   //     child: SmoothPageIndicator(
//                   //   controller: controller.dotscontroller,
//                   //   count: controller.imagelist.length,
//                   //   effect: WormEffect(
//                   //     dotWidth: 10.0,
//                   //     dotHeight: 10.0,
//                   //     activeDotColor: Colors.blue,
//                   //     dotColor: Colors.grey,
//                   //     spacing: 8.0,
//                   //   ),
//                   //   onDotClicked: (index) {
//                   //     controller.jumpToPage(index);
//                   //     controller.currentindex.value =
//                   //         controller.currentPage.value;
//                   //   },
//                   // )
//                       child : DotsIndicator(
//                           dotsCount: controller.imagelist.length,
//                           position: controller.currentindex.value,
//                           decorator: DotsDecorator(
//                               activeColor: Colors.red,
//                               color: Colors.white,
//                               activeSize: Size.square(13)),
//                           onTap: (index) {}),
//                       ),
//                 )
//               ]),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
