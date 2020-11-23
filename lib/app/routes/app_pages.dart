import 'package:etrip/app/modules/Driver/Driver_MyTrip/bindings/driver_my_trip_binding.dart';
import 'package:etrip/app/modules/Driver/Driver_MyTrip/views/driver_my_trip_view.dart';
import 'package:etrip/app/modules/Driver/Driver_TripHistory/bindings/driver_trip_history_binding.dart';
import 'package:etrip/app/modules/Driver/Driver_TripHistory/views/driver_trip_history_view.dart';
import 'package:etrip/app/modules/Driver/driver_home/bindings/driver_home_binding.dart';
import 'package:etrip/app/modules/Driver/driver_home/views/driver_home_view.dart';
import 'package:etrip/app/modules/Driver/new_works/views/new_works_view.dart';
import 'package:etrip/app/modules/Driver/new_works/bindings/new_works_binding.dart';
import 'package:etrip/app/modules/User/home/bindings/home_binding.dart';
import 'package:etrip/app/modules/User/home/views/home_view.dart';
import 'package:etrip/app/modules/User/home/views/notifications.dart';
import 'package:etrip/app/modules/User/selected_bid/views/selected_bid_view.dart';
import 'package:etrip/app/modules/User/selected_bid/bindings/selected_bid_binding.dart';
import 'package:etrip/app/modules/User/bids/views/bids_view.dart';
import 'package:etrip/app/modules/User/bids/bindings/bids_binding.dart';
import 'package:etrip/app/modules/Driver/VehicleDetails/bindings/vehicle_details_binding.dart';
import 'package:etrip/app/modules/Driver/VehicleDetails/views/vehicle_details_view.dart';
import 'package:etrip/app/modules/splash/views/splash_view.dart';
import 'package:etrip/app/modules/splash/bindings/splash_binding.dart';
import 'package:etrip/app/modules/Driver/driver_details/bindings/driver_details_binding.dart';
import 'package:etrip/app/modules/Driver/driver_details/views/driver_details_view.dart';
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
  static const SPLASH = Routes.SPLASH;
  static const NOTIFICATION = Routes.NOTIFICATION;
  static const VEHICLE_DETAILS = Routes.VEHICLE_DETAILS;
  static const BIDS = Routes.BIDS;
  static const SELECTED_BID = Routes.SELECTED_BID;
  static const DRIVER_HOME = Routes.DRIVER_HOME;
  static const NEW_WORKS = Routes.NEW_WORKS;

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
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => NotificationsPage(),
    ),
    GetPage(
      name: Routes.VEHICLE_DETAILS,
      page: () => VehicleDetailsView(),
      binding: VehicleDetailsBinding(),
    ),
    GetPage(
      name: Routes.BIDS,
      page: () => BidsView(),
      binding: BidsBinding(),
    ),
    GetPage(
      name: Routes.SELECTED_BID,
      page: () => SelectedBidView(),
      binding: SelectedBidBinding(),
    ),
    GetPage(
      name: Routes.DRIVER_HOME,
      page: () => DriverHomeView(),
      binding: DriverHomeBinding(),
    ),
    GetPage(
      name: Routes.NEW_WORKS,
      page: () => NewWorksView(),
      binding: NewWorksBinding(),
    ),
    GetPage(
      name: Routes.DRIVER_MY_TRIP,
      page: () => DriverMyTripView(),
      binding: DriverMyTripBinding(),
    ),
    GetPage(
      name: Routes.DRIVER_TRIP_HISTORY,
      page: () => DriverTripHistoryView(),
      binding: DriverTripHistoryBinding(),
    ),
  ];
}
