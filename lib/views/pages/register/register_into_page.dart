import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tech_blog_app/controllers/register/register_controller.dart';
import 'package:tech_blog_app/gen/assets.gen.dart';
import 'package:validators/validators.dart';

import '../../../core/values/strings.dart';

// ignore: must_be_immutable
class RegisterIntoPage extends StatelessWidget {
  RegisterIntoPage({Key? key}) : super(key: key);

  var registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.techBot.path,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: ValueStrings.wellCom,
                    style: textTheme.headline4,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
        bottomNavigationBar: elevatedButton(context, size, textTheme),
      ),
    );
  }

  Widget elevatedButton(BuildContext context, Size size, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: ElevatedButton(
        onPressed: () {
          _showEmailBottomSheet(context, size, textTheme);
        },
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(
            Size(Get.width / 4, 56),
          ),
        ),
        child: const Text(
          ValueStrings.letsGoToWriteArticle,
        ),
      ),
    );
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    //RegExp isEmail = RegExp('[^a-z-0-9]+@');
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // the bottomsheet haves a color
      context: context,
      builder: ((context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ValueStrings.insertYourEmail,
                    style: textTheme.headline4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      controller: registerController.emailTextEditingController,
                      onChanged: (value) {
                        isEmail(value);
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: "techblog@email.com",
                          hintStyle: textTheme.headline5),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      registerController.register();
                      Get.back();
                      _activateCodeBottomSheet(context, size, textTheme);
                    },
                    child: const Text("ادامه"),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Future<dynamic> _activateCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    //RegExp isEmail = RegExp('[^a-z-0-9]+@');
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // the bottomsheet hass a color
      context: context,
      builder: ((context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ValueStrings.insertActivateCode,
                    style: textTheme.headline4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      controller:
                          registerController.acticeCodeTextEditingController,
                      onChanged: (value) {
                        isEmail(value);
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: "******", hintStyle: textTheme.headline5),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      registerController.verify();
                    },
                    child: const Text("ادامه"),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
