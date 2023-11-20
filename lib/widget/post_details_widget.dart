// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:lottie/lottie.dart';
import '../model/post_response.dart';

class PostDetailsWidget extends StatelessWidget {
  PostDetailsWidget({
    super.key,
    required this.post,
    this.commentCount = 0,
  });

  final PostModel post;
  int commentCount = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Lottie.asset("assets/lottie/person3.json", width: 16.w),
        Card(
          child: Container(
            width: 77.w,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.userName ?? "anonymous",
                    style: const TextStyle(color: Color(0xff5D9CEC),fontSize: 15,fontWeight: FontWeight.bold)),
                 SizedBox(
                  height: 1.h,
                ),
                Text(post.title ?? "",
                    style:  TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.dp)),
                 SizedBox(
                  height: 1.h,
                  width: double.infinity,
                ),
                Text(post.body ?? "",
                    style:  TextStyle(color: Colors.white,fontSize: 14.dp)),
                 SizedBox(
                  height: 1.h,
                  width: double.infinity,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                        commentCount == 0 ? "0 Comment" : "$commentCount Comment",
                        style: const TextStyle(color: Color(0xff5D9CEC)))),
              ],
            ),
          ),
        )
      ],
    );
  }
}
