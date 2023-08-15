import 'package:akarosmi/app/controller/app_controller.dart';
import 'package:akarosmi/app/core/theme/theme_enums.dart';
import 'package:akarosmi/app/utils/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/theme/color.dart';
import 'app/data/network/api_controller.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  DependencyInjection.init();
  ApiController.init();
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: AppColors.transparent,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      designSize: const Size(360, 800),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          home: child,
          onInit: () {
            Get.put(AppController());
          },
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child!),
              ),
            );
          },
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.scaffoldColor,
            colorScheme: ColorScheme.fromSwatch(),
            fontFamily: FontFamily.karla.name,
            scrollbarTheme: ScrollbarThemeData(
                thickness: MaterialStateProperty.all(5),
                thumbColor: MaterialStateProperty.all(AppColors.scrollColor),
                radius: const Radius.circular(20),
                minThumbLength: 100,
                crossAxisMargin: 1.0),
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
