import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ImgWidget extends StatelessWidget {
  const ImgWidget({super.key, required this.imgUrl});

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: double.maxFinite,
      height: 380.h,
      decoration: BoxDecoration(
        color: Colors.amber,
        image: DecorationImage(
          image: imgUrl.isEmpty
              ? const AssetImage("assets/img/placeholder.jpeg")
              : NetworkImage(imgUrl),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
