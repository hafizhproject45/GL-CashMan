import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/widgets/navbar.dart';
import '/screens/home/home_screen.dart';
import '/screens/landing_screen.dart';
import '/screens/login_screen.dart';
import '/screens/payment/payment_screen.dart';
import '/screens/profile/contact_screen.dart';
import '/screens/profile/profile_screen.dart';

class AppRoute {
  AppRoute._();

  //? PRIVATE NAVIGATORS KEYS
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _rootNavigatorPayment =
      GlobalKey<NavigatorState>(debugLabel: 'shellPayment');
  static final _rootNavigatorProfile =
      GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

  //! ROUTER CONFIG
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      //! ROOT ROUTE
      GoRoute(
        path: '/',
        builder: (context, state) => LandingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginScreen(),
      ),

      //! NAVBAR ROUTE
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              MyNavigationBar(navigationShell: navigationShell),
          branches: <StatefulShellBranch>[
            //! BRANCH HOME
            StatefulShellBranch(navigatorKey: _rootNavigatorHome, routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => HomeScreen(
                  key: state.pageKey,
                ),
              ),
            ]),
            //! BRANCH PAYMENT
            StatefulShellBranch(navigatorKey: _rootNavigatorPayment, routes: [
              GoRoute(
                path: '/payment',
                builder: (context, state) => PaymentScreen(
                  key: state.pageKey,
                ),
              ),
            ]),
            //! BRANCH PROFILE
            StatefulShellBranch(navigatorKey: _rootNavigatorProfile, routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => ProfileScreen(
                  key: state.pageKey,
                ),
              ),
              GoRoute(
                path: '/profile/contact',
                builder: (context, state) => ContactScreen(
                  key: state.pageKey,
                ),
              ),
            ]),
          ]),
    ],
  );
}
