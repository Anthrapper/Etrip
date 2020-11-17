import 'package:etrip/app/modules/Driver/driver_details/bindings/driver_details_binding.dart';
import 'package:etrip/app/modules/Driver/driver_details/views/driver_details_view.dart';
import 'package:etrip/app/modules/Driver/new_works_driver/bindings/new_works_driver_binding.dart';
import 'package:etrip/app/modules/Driver/new_works_driver/views/new_works_driver_view.dart';
import 'package:etrip/app/modules/Driver/signup_driver/bindings/signup_driver_binding.dart';
import 'package:etrip/app/modules/Driver/signup_driver/views/signup_driver_view.dart';
import 'package:etrip/app/modules/User/my_trip/bindings/my_trip_binding.dart';
import 'package:etrip/app/modules/User/my_trip/views/my_trip_view.dart';
import 'package:etrip/app/modules/User/signup/bindings/signup_binding.dart';
import 'package:etrip/app/modules/User/signup/views/signup_view.dart';
import 'package:etrip/app/modules/User/signup/views/usertype.dart';
import 'package:etrip/app/modules/User/trip_history/bindings/trip_history_binding.dart';
import 'package:etrip/app/modules/User/trip_history/views/trip_history_view.dart';
import 'package:etrip/app/modules/User/vehicleform/bindings/vehicleform_binding.dart';
import 'package:etrip/app/modules/User/vehicleform/views/vehicleform_view.dart';
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
  static const MY_TRIP = Routes.MY_TRIP;

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
      page: () => TripHistoryView(),
      binding: TripHistoryBinding(),
    ),
    GetPage(
      name: Routes.DRIVER_DETAILS,
      page: () => DriverDetailsView(),
      binding: DriverDetailsBinding(),
    ),
    GetPage(
      name: Routes.MY_TRIP,
      page: () => MyTripView(),
      binding: MyTripBinding(),
    ),
    GetPage(
      name: Routes.NEW_WORKS_DRIVER,
      page: () => NewWorksDriverView(),
      binding: NewWorksDriverBinding(),
    ),
  ];
}
