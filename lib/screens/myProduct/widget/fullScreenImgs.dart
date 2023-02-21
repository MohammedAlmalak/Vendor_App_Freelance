import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../controller/fullScreenImgsCon.dart';

class fullScreenImgs extends StatelessWidget {
  final PageController pageController;
  List<Image> productImgs;
  final int index;
  fullScreenImgs({Key? key, required this.productImgs, this.index = 0})
      : pageController = PageController(initialPage: index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<fullScreenImgsCon>(
            init: fullScreenImgsCon(),
            builder: ((controller) =>
                Stack(alignment: Alignment.bottomLeft, children: [
                  PhotoViewGallery.builder(
                      itemCount: productImgs.length,
                      backgroundDecoration:
                          BoxDecoration(color: controller.backGroundCol),
                      pageController: pageController,
                      builder: (context, index) {
                        return PhotoViewGalleryPageOptions(
                          imageProvider: productImgs[index].image,
                          minScale: PhotoViewComputedScale.contained * .5,
                          maxScale: PhotoViewComputedScale.contained * 3,
                        );
                      },
                      onPageChanged: (index) => controller.nextImg(index)),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Image ${controller.index + 1}/${productImgs.length}",
                      style: TextStyle(
                          color: controller.isWhite == true
                              ? Colors.black
                              : Colors.white,
                          fontSize: 16),
                    ),
                  ),
                  Positioned(
                      top: 25,
                      left: 5,
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: controller.isWhite == true
                              ? Colors.black
                              : Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      )),
                  Positioned(
                      top: 35,
                      right: 20,
                      child: PopupMenuButton(
                          onSelected: ((value) {
                            if (value == 0) {
                              controller.changeBackgroundColor(
                                  false, Colors.black);
                            } else {
                              controller.changeBackgroundColor(
                                  true, Colors.white);
                            }
                          }),
                          child: Text(
                            "Background Color",
                            style: TextStyle(
                                color: controller.isWhite == true
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 16),
                          ),
                          itemBuilder: (context) => [
                                PopupMenuItem(
                                    value: 0,
                                    child: Row(
                                      children: const [
                                        CircleAvatar(
                                          radius: 5,
                                          backgroundColor: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Black",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ],
                                    )),
                                PopupMenuItem(
                                    value: 1,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 5,
                                          backgroundColor: Colors.white,
                                          child: Container(
                                              decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black, width: .5),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          )),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          "White",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ],
                                    )),
                              ]))
                ]))));
  }
}
