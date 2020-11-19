import 'package:etrip/app/data/Translation/translations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: box.hasData('language') ? Locale(box.read('language')) : Locale('en'),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.SPLASH,
      getPages: AppPages.routes,
      defaultTransition: Transition.fadeIn,
      translations: Messages(),
      theme: ThemeData(
        fontFamily: GoogleFonts.hind().fontFamily,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.lightBlue[700],
        textTheme: TextTheme().apply(fontFamily: GoogleFonts.hind().fontFamily),
      ),
    );
  }
}
