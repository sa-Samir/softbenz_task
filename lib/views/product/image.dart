import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class ViewImageScreen extends StatelessWidget {
  final String imageTitle;
  final String imageURL;
  const ViewImageScreen({
    Key? key,
    required this.imageTitle,
    required this.imageURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: FittedBox(
              child: Text(imageTitle),
            ),
          ),
          body: Center(
            child: SizedBox(
              height: 500,
              width: Get.width,
              child: PhotoView(
                backgroundDecoration: const BoxDecoration(
                  color: Colors.white,
                ),
                imageProvider: NetworkImage(imageURL),
              ),
            ),
          )),
    );
  }
}
