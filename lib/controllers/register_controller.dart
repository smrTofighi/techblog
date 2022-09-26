import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog_app/constant/api_constant.dart';
import 'package:tech_blog_app/constant/storage.dart';
import 'package:tech_blog_app/services/dio_service.dart';
import 'package:tech_blog_app/views/main_view/main_view.dart';
import 'package:tech_blog_app/views/register/register_into_view.dart';

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
        box.write(token, response.data['token']);
        box.write(userid, response.data['user_id']);

        debugPrint('test: ' + box.read(token).toString());
        debugPrint('test: ' + box.read(userid).toString());
        Get.offAll(MainView());
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
    if (GetStorage().read(token) == null) {
      Get.to(RegisterIntoView());
    } else {
      debugPrint('PostView');
    }
  }
}
