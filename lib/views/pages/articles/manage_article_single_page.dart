import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tech_blog_app/controllers/file_controller.dart';
import 'package:tech_blog_app/core/styles/text_style.dart';
import 'package:tech_blog_app/controllers/articles/manage_article_controller.dart';
import 'package:tech_blog_app/core/utils/file_picker.dart';
import 'package:tech_blog_app/core/values/dimens.dart';
import 'package:tech_blog_app/gen/assets.gen.dart';
import 'package:tech_blog_app/views/widgets/title_with_icon_blue.dart';
import '../../../core/values/colors.dart';

// ignore: must_be_immutable
class ManageArticleSinglePage extends StatelessWidget {
  var manageArticleController = Get.find<ManageArticleController>();
  FileController fileController = Get.put(FileController());

  ManageArticleSinglePage({Key? key}) : super(key: key);
  getTile() {
    Get.defaultDialog(
      title: 'عنوان مقاله',
      content: TextField(
        controller: manageArticleController.titleEditingController,
        decoration: const InputDecoration(hintText: 'اینجا بنویس'),
        keyboardType: TextInputType.text,
        style: const TextStyle(
          color: SolidColors.blueTitle,
        ),
      ),
      backgroundColor: SolidColors.primery,
      titleStyle: const TextStyle(color: Colors.white),
      confirm: ElevatedButton(
        onPressed: () {
          manageArticleController.updateTitle();
          Get.back();
        },
        child: const Text('ثبت'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: Dimens.width,
                      height: Dimens.height / 3,
                      child: fileController.file.value.name == 'nothing'
                          ? CachedNetworkImage(
                              imageUrl: manageArticleController
                                  .articleInfoModel.value.image!,
                              imageBuilder: (context, imageProvider) =>
                                  Image(image: imageProvider),
                              placeholder: (context, url) => const Center(
                                child: SpinKitDoubleBounce(
                                  color: SolidColors.primery,
                                  size: 32,
                                ),
                              ),
                              errorWidget: (context, url, error) => Image.asset(
                                Assets.images.posterTest.path,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Image.file(
                              File(
                                fileController.file.value.path!,
                              ),
                              fit: BoxFit.cover,
                            ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      child: Container(
                        height: 60,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: GradiantColors.singleAppBarGradiant,
                              end: Alignment.bottomCenter,
                              begin: Alignment.topCenter),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              filePicker();
                            },
                            child: Container(
                              height: 30,
                              width: Get.width / 3,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                color: SolidColors.primery,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'انتخاب تصویر',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TitleWithIconBlue(
                    title: 'ویرایش عنوان مقاله',
                    onPressed: () {
                      getTile();
                    }),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: Dimens.bodyMargin / 2),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      manageArticleController.articleInfoModel.value.title!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20),
                      maxLines: 2,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TitleWithIconBlue(
                    title: 'ویرایش متن اصلی مقاله', onPressed: () {}),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: Dimens.bodyMargin / 2),
                  child: HtmlWidget(
                    manageArticleController.articleInfoModel.value.content!,
                    enableCaching: true,
                    onLoadingBuilder: (context, element, loadingProgress) =>
                        const Center(
                      child: SpinKitDoubleBounce(
                        color: SolidColors.primery,
                        size: 32,
                      ),
                    ),
                    textStyle: MyTextStyle.contentArticleSingePage,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TitleWithIconBlue(
                    title: 'ویرایش دسته بندی ها', onPressed: () {}),
                // tagsList(textTheme),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tagsList(TextTheme textTheme) {
    return SizedBox(
      height: 55,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () async {},
            child: Container(
              height: 25,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                  color: Color.fromARGB(255, 242, 242, 242)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    manageArticleController.tags[index].title!,
                    style: textTheme.headline4,
                  ),
                ),
              ),
            ),
          ),
        ),
        itemCount: manageArticleController.tags.length,
      ),
    );
  }
}
