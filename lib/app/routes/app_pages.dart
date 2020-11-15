import 'package:etrip/app/modules/driver_details/views/driver_details_view.dart';
import 'package:etrip/app/modules/driver_details/bindings/driver_details_binding.dart';
import 'package:etrip/app/modules/trip_history/views/trip_history_view.dart';
import 'package:etrip/app/modules/trip_history/bindings/trip_history_binding.dart';
import 'package:etrip/app/modules/signup/views/usertype.dart';
import 'package:etrip/app/modules/signup_driver/views/signup_driver_view.dart';
import 'package:etrip/app/modules/signup_driver/bindings/signup_driver_binding.dart';
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
  static const SIGNUP_DRIVER = Routes.SIGNUP_DRIVER;
  static const SIGNUP_SELECTION = Routes.SIGNUP_SELECTION;
  static const TRIP_HISTORY = Routes.TRIP_HISTORY;
  static const DRIVER_DETAILS = Routes.DRIVER_DETAILS;

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
    GetPage(
      name: Routes.SIGNUP_DRIVER,
      page: () => SignupDriverView(),
      binding: SignupDriverBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP_SELECTION,
      page: () => UserType(),
    ),
    GetPage(
      name: Routes.TRIP_HISTORY, 
      page:()=> TripHistoryView(), 
      binding: TripHistoryBinding(),
    ),
    GetPage(
      name: Routes.DRIVER_DETAILS, 
      page:()=> DriverDetailsView(), 
      binding: DriverDetailsBinding(),
    ),
  ];
}