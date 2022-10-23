import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tech_blog_app/views/widgets/component.dart';
import 'package:tech_blog_app/controllers/register/register_controller.dart';
import 'package:tech_blog_app/gen/assets.gen.dart';
import 'package:tech_blog_app/views/pages/main/profile_page.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/strings.dart';
import 'home_page.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;

  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    //? return ------------------
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.whiteScaffoldBG,
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Image.asset(
                    Assets.images.techblog.path,
                    scale: 3,
                  ),
                ),
                ListTile(
                  title: Text(
                    'پروفایل کاربری',
                    style: textTheme.headline4,
                  ),
                ),
                const Divider(
                  color: SolidColors.divider,
                ),
                ListTile(
                  title: Text(
                    'درباره تک بلاگ',
                    style: textTheme.headline4,
                  ),
                ),
                const Divider(
                  color: SolidColors.divider,
                ),
                ListTile(
                  title: Text(
                    'اشتراک گذاری تک بلاگ',
                    style: textTheme.headline4,
                  ),
                  onTap: (() async {
                    await Share.share(ValueStrings.shareText);
                  }),
                ),
                const Divider(
                  color: SolidColors.divider,
                ),
                ListTile(
                  title: Text(
                    'تک بلاگ در گیت هاب',
                    style: textTheme.headline4,
                  ),
                  onTap: () {
                    myLaunchUrl(ValueStrings.techBlogGithubUrl);
                  },
                ),
                const Divider(
                  color: SolidColors.divider,
                ),
              ],
            ),
          ),
        ),
        //! ---------------------
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: SolidColors.whiteScaffoldBG,
          // elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: (() {
                  _key.currentState!.openDrawer();
                }),
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              Image(
                image: AssetImage(Assets.images.techblog.path),
                height: size.height / 13.6,
              ),
              const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ],
          ),
        ),
        //! ---------------------
        body: Stack(
          children: [
            Positioned.fill(
              child: Obx(
                () => IndexedStack(
                  index: selectedPageIndex.value,
                  children: [
                    HomePage(bodyMargin: bodyMargin, textTheme: textTheme),
                    ProfliePage(
                        size: size,
                        bodyMargin: bodyMargin,
                        textTheme: textTheme),
                  ],
                ),
              ),
            ),
            bottomNavigation(
              (int index) {
                selectedPageIndex.value = index;
              },
            ),
          ],
        ),
        //! ---------------------
      ),
    );
  }

  Widget bottomNavigation(Function(int) changeScreen) {
    double bodyMargin = Get.width / 10;
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: Get.height / 10,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: GradiantColors.bottomNavBack,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              right: bodyMargin, left: bodyMargin, bottom: 8, top: 8),
          child: Container(
            height: Get.height / 8,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
              gradient: LinearGradient(
                colors: GradiantColors.bottomNav,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => changeScreen(0),
                  icon: ImageIcon(
                    AssetImage(Assets.icons.icon.path),
                    color: Colors.white,
                  ),
                  splashColor: Colors.white,
                ),
                IconButton(
                  onPressed: () {
                    Get.find<RegisterController>().checkLogin();
                  },
                  icon: ImageIcon(
                    AssetImage(Assets.icons.w.path),
                    color: Colors.white,
                  ),
                  splashColor: Colors.white,
                ),
                IconButton(
                  onPressed: () => changeScreen(1),
                  icon: ImageIcon(
                    AssetImage(Assets.icons.user.path),
                    color: Colors.white,
                  ),
                  splashColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
