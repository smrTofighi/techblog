import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog_app/core/values/api_constant.dart';
import 'package:tech_blog_app/routes/pages.dart';
import 'package:tech_blog_app/services/dio_service.dart';
import 'package:tech_blog_app/views/pages/main/main_page.dart';
import 'package:tech_blog_app/views/pages/register/register_into_page.dart';
import '../../core/values/storage.dart';
import '../../core/values/strings.dart';
import '../../gen/assets.gen.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController acticeCodeTextEditingController =
      TextEditingController();
  var email = '';
  var userId = '';
  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register'
    };

    var response = await DioService().postMethod(map, ApiConstant.postRegister);
    email = emailTextEditingController.text;
    userId = response.data['user_id'];
    debugPrint(response);
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': acticeCodeTextEditingController.text,
      'command': 'verify'
    };
    debugPrint(map.toString());
    var response = await DioService().postMethod(map, ApiConstant.postRegister);
    debugPrint(response.toString());
    var status = response.data['response'];

    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write(StorageKey.token, response.data['token']);
        box.write(StorageKey.userid, response.data['user_id']);

        debugPrint('test: ' + box.read(StorageKey.token).toString());
        debugPrint('test: ' + box.read(StorageKey.userid).toString());
        Get.offAll(MainPage());
        break;
      case 'incorrect_code':
        Get.snackbar('خطا', 'کد فعال سازی اشتباه است!');
        break;
      case 'expired':
        Get.snackbar('خطا', 'کد فعال سازی منقضی شده است!');
        break;
    }
  }

  checkLogin() {
    if (GetStorage().read(StorageKey.token) == null) {
      Get.to(RegisterIntoPage());
    } else {
      routeToWriteBottomSheet();
    }
  }

  routeToWriteBottomSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16.0),
        height: Get.height / 3,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  Assets.images.techBot.path,
                  height: 40,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text('دونسته هات رو با بقیه به اشتراک بزار...')
              ],
            ),
            const Text(
              '''
فکر کن !!  اینجا بودنت به این معناست که یک گیک تکنولوژی هستی
دونسته هات رو با  جامعه‌ی گیک های فارسی زبان به اشتراک بذار..
''',
              style: TextStyle(
                  color: Color.fromARGB(255, 107, 107, 107), fontSize: 13),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                    Get.toNamed(NameRoutes.routeManageArticlePage);
                  },
                  child: SizedBox(
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.images.articleLogo.path,
                          height: 35,
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        const Text(
                          ValueStrings.manageArticlesText,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.images.padcastLogo.path,
                          height: 35,
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        const Text(
                          ValueStrings.managePadcastsText,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
