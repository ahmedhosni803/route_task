// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:route_task/model/post_response.dart';
import 'package:route_task/providers/details_provider.dart';

import '../../widget/post_details_widget.dart';

class DetailsScreen extends StatelessWidget {
  PostModel post;
  DetailsScreen({required this.post});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailsViewModel()..getComments(post.id.toString()),
      builder: (context, child) => Scaffold(
        appBar: AppBar(),
        body: Consumer<DetailsViewModel>(
          builder: (context, value, child) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      PostDetailsWidget(
                          post: post, commentCount: value.comments.length),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      value.isLoading
                          ? Lottie.asset("assets/lottie/loadingPag.json",
                              width: 65)
                          : Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Expanded(
                                      child: Divider(
                                        color: Colors.white,
                                        thickness: 0.5,
                                        indent: 10,
                                        endIndent: 10,
                                      ),
                                    ),
                                    Text(
                                      value.comments.isEmpty
                                          ? "No Comments"
                                          : "Comments",
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                    const Expanded(
                                      child: Divider(
                                        color: Colors.white,
                                        thickness: 0.5,
                                        indent: 10,
                                        endIndent: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                value.comments.isEmpty
                                    ? Lottie.network(
                                        "https://lottie.host/e0dec14b-8844-4f6d-b8ab-4763b9d10695/TzQsHgCbVi.json",
                                        height: 25.h)
                                    : ListView.separated(
                                        primary: false,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            textDirection: TextDirection.rtl,
                                            children: [
                                              Lottie.asset(
                                                  "assets/lottie/person3.json",
                                                  width: 15.w),
                                              Card(
                                                  child: Container(
                                                constraints: BoxConstraints(
                                                    maxWidth: 77.w),
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      value.comments[index]
                                                              .name ??
                                                          '',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(
                                                              0xff5D9CEC)),
                                                    ),
                                                    SizedBox(
                                                      height: 1.h,
                                                    ),
                                                    Text(
                                                        value.comments[index]
                                                                .body ??
                                                            '',
                                                        style: TextStyle(
                                                            fontSize: 1.5.h,
                                                            color:
                                                                Colors.white)),
                                                  ],
                                                ),
                                              )),
                                            ],
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            const Divider(
                                              color: Colors.white,
                                              thickness: 0.2,
                                              indent: 80,
                                              endIndent: 80,
                                            ),
                                        itemCount: value.comments.length)
                              ],
                            ),
                    ]),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
