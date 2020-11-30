import 'package:etrip/app/data/Constants/constants.dart';
import 'package:etrip/app/data/Services/EtripServices.dart';
import 'package:etrip/app/data/Translation/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await initServices().whenComplete(
    () => runApp(
      MyApp(),
    ),
  );
}

Future initServices() async {
  await Get.putAsync(() => EtripServices().init());
  print('All services started...');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Get.find<EtripServices>().box.hasData('language')
          ? Locale(
              Get.find<EtripServices>().box.read('language'),
            )
          : Locale('en'),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.SPLASH,
      enableLog: true,
      getPages: AppPages.routes,
      defaultTransition: Transition.zoom,
      translations: Messages(),
      theme: ThemeData(
        fontFamily: GoogleFonts.hind().fontFamily,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.lightBlue[700],
        accentColor: CustomColors.buttonColor,
        textTheme: TextTheme().apply(fontFamily: GoogleFonts.hind().fontFamily),
      ),
    );
  }
}
