import 'package:etrip/app/modules/vehicleform/views/vehicleform_view.dart';
import 'package:etrip/app/modules/vehicleform/bindings/vehicleform_binding.dart';
import 'package:etrip/app/modules/signup/views/signup_view.dart';
import 'package:etrip/app/modules/signup/bindings/signup_binding.dart';
import 'package:etrip/app/modules/login/views/login_view.dart';
import 'package:etrip/app/modules/login/bindings/login_binding.dart';
import 'package:etrip/app/modules/home/views/home_view.dart';
import 'package:etrip/app/modules/home/bindings/home_binding.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;
  static const LOGIN = Routes.LOGIN;
  static const SIGNUP = Routes.SIGNUP;
  static const VEHICLEFORM = Routes.VEHICLEFORM;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Routes.VEHICLEFORM,
      page: () => VehicleformView(),
      binding: VehicleformBinding(),
    ),
  ];
}
