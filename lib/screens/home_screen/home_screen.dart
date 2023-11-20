// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:route_task/providers/home_provider.dart';
import 'package:route_task/widget/error_widget.dart';
import 'package:route_task/widget/post_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff060E1E),
        appBar: AppBar(
          title: Lottie.asset("assets/lottie/social-2.json",
              width: 50.w, fit: BoxFit.cover),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Consumer<HomeViewModel>(
          builder: (context, value, child) {
            return value.isLoading
                ? Center(
                    child:
                        Lottie.asset("assets/lottie/loading.json", height: 150),
                  )
                : value.isError
                    ? const CustomErrorWidget()
                    : ListView.separated(
                        controller: value.scrollController,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return index + 1 == value.posts.length
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 50),
                                  child: Center(
                                      child: Lottie.asset(
                                          "assets/lottie/loadingPag.json",
                                          width: 10.w,
                                          height: 1.h,
                                          fit: BoxFit.cover)),
                                )
                              : PostWidget(
                                  post: value.posts[index],
                                );
                        },
                        separatorBuilder: (context, index) => Divider(
                              color: Colors.white,
                              height: 5.h,
                              endIndent: 20,
                              indent: 20,
                              thickness: 0.1,
                            ),
                        itemCount: value.posts.length);
          },
        ));
  }
}
