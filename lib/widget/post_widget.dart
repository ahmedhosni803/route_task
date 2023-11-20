// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:route_task/model/post_response.dart';
import 'package:route_task/screens/details_post_screen/details_post_screen.dart';

class PostWidget extends StatelessWidget {
  PostModel post;

  PostWidget({required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Lottie.asset("assets/lottie/person3.json", width: 16.w),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(post: post),
                ));
          },
          child: Card(
            child: Container(
              width: 77.w,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.userName ?? "anonymous",
                      style: TextStyle(
                          color: Color(0xff5D9CEC),
                          fontWeight: FontWeight.bold,
                          fontSize: 15.dp)),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(post.title ?? "",
                      style: TextStyle(color: Colors.white, fontSize: 15.dp)),
                  SizedBox(
                    height: 1.h,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
