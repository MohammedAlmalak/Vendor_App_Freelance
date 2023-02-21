import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/screens/myProduct/widget/fullScreenImgs.dart';

import '../../../common/backButton.dart';

class imgSlider extends StatelessWidget {
  List<Image> images;
  imgSlider({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int _current = 0;
    final CarouselController _controller = CarouselController();
    return Stack(children: [
      Container(
        width: double.infinity,
        height: .3.sh,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFBDBDBD),
              blurRadius: 2.0,
              spreadRadius: 0.0,

              offset: Offset(1, 2), // shadow direction: bottom right
            )
          ],
          border: Border.all(width: .5, color: const Color(0xFFBDBDBD)),
          // borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                  //autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  // enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  // height: 300,
                  // onPageChanged: (index, reason) {
                  //   setState(() {
                  //     _current = index;
                  //   });
                  // }
                ),
                items: images
                //productImgSlider,
                ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     widget.pro.productImg,
            //     widget.pro.productImg,
            //   ].asMap().entries.map<Widget>((entry) {
            //     return GestureDetector(
            //       onTap: () => _controller.animateToPage(entry.key),
            //       child: Container(
            //         width: 12.0,
            //         height: 12.0,
            //         margin: const EdgeInsets.symmetric(
            //             vertical: 8.0, horizontal: 4.0),
            //         decoration: BoxDecoration(
            //             shape: BoxShape.circle,
            //             color: (Theme.of(context).brightness ==
            //                         Brightness.dark
            //                     ? Colors.black
            //                     : const Color(0xFFF26511))
            //                 .withOpacity(
            //                     _current == entry.key ? 0.9 : 0.4)),
            //       ),
            //     );
            //   }).toList(),
            // )
          ],
        ),
      ),
      Positioned(
          top: 90,
          left: 10,
          child: IconButton(
            onPressed: () => _controller.nextPage(),
            icon: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,

                      offset: Offset(1, 2), // shadow direction: bottom right
                    )
                  ],
                  border: Border.all(width: .5, color: const Color(0xFFBDBDBD)),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                    child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 18,
                  ),
                ))),
          )),
      Positioned(
          top: 90,
          right: 10,
          child: IconButton(
              onPressed: () => _controller.previousPage(),
              icon: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,

                      offset: Offset(1, 2), // shadow direction: bottom right
                    )
                  ],
                  border: Border.all(width: .5, color: const Color(0xFFBDBDBD)),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                    child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    size: 18,
                  ),
                )),
              ))),
      Positioned(
          bottom: 15,
          right: 10,
          child: IconButton(
              onPressed: () {
                Get.to(fullScreenImgs(productImgs: images));
              },
              icon: const Icon(
                Icons.zoom_out_map_outlined,
                color: Color(0xFFF26511),
                size: 30,
              ))),
      Positioned.directional(
          top: 10,
          end: 10,
          textDirection: Directionality.of(context),
          child: backButton()),
    ]);
  }
}
