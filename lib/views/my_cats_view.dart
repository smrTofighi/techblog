import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tech_blog_app/constant/component.dart';
import 'package:tech_blog_app/constant/strings.dart';
import 'package:tech_blog_app/controllers/home_view_controller.dart';
import 'package:tech_blog_app/gen/assets.gen.dart';
import 'package:tech_blog_app/models/fake_data.dart';

import '../constant/colors.dart';

class MyCatsView extends StatefulWidget {
  const MyCatsView({Key? key}) : super(key: key);

  @override
  State<MyCatsView> createState() => _MyCatsViewState();
}

class _MyCatsViewState extends State<MyCatsView> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  SvgPicture.asset(
                    Assets.images.techBot.path,
                    height: 100,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    ValueStrings.successfulRegistration,
                    style: textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: 'نام و نام خانوادگی',
                        hintStyle: textTheme.headline4),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    ValueStrings.chooseCats,
                    style: textTheme.headline4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 85,
                      child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: tagList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                crossAxisCount: 2,
                                childAspectRatio: 0.3),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (!catList.contains(tagList[index])) {
                                  catList.add(tagList[index]);
                                }
                              });
                            },
                            child: MainTags(
                              textTheme: textTheme,
                              index: index,
                              listItem: Get.find<HomeViewController>().tagsList,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Image.asset(
                    Assets.images.downCatArrow.path,
                    scale: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 85,
                      child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: catList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                crossAxisCount: 2,
                                childAspectRatio: 0.25),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 60,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(24),
                                ),
                                color: SolidColors.surface),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    catList[index].title.toString(),
                                    style: textTheme.headline4,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          catList.removeAt(index);
                                        });
                                      },
                                      child: const Icon(
                                        CupertinoIcons.delete,
                                        color: Colors.grey,
                                        size: 20,
                                      )),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
