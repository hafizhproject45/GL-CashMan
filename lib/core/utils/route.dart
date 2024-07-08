import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as get_trans;
import 'package:gl_app/presentation/widgets/navbar.dart';

import '../../presentation/pages/auth/login_page.dart';
import '../../presentation/pages/auth/register_page.dart';
import '../../presentation/pages/landing_page.dart';
import '../../presentation/pages/profile/biodata_page.dart';
import '../../presentation/pages/profile/contact_page.dart';
import '../../presentation/pages/profile/history_payment_page.dart';
import '../../presentation/pages/profile/question_page.dart';
import '../../presentation/pages/profile/release_page.dart';

class AppRoute {
  static List<GetPage> get pageRoute => [
        GetPage<LandingPage>(
          name: '/',
          page: () => const LandingPage(),
          transition: get_trans.Transition.leftToRightWithFade,
        ),
        GetPage<LoginPage>(
          name: '/login',
          page: () => const LoginPage(),
          transition: get_trans.Transition.leftToRightWithFade,
        ),
        GetPage<RegisterPage>(
          name: '/register',
          page: () => const RegisterPage(),
          transition: get_trans.Transition.leftToRightWithFade,
        ),
        GetPage<MyNavigationBar>(
          name: '/navbar',
          page: () => const MyNavigationBar(),
          transition: get_trans.Transition.leftToRightWithFade,
        ),
        GetPage<BiodataPage>(
          name: '/profile/biodata',
          page: () => const BiodataPage(),
          transition: get_trans.Transition.leftToRightWithFade,
        ),
        GetPage<HistoryPaymentPage>(
          name: '/profile/history',
          page: () => const HistoryPaymentPage(),
          transition: get_trans.Transition.leftToRightWithFade,
        ),
        GetPage<ContactPage>(
          name: '/profile/contact',
          page: () => const ContactPage(),
          transition: get_trans.Transition.leftToRightWithFade,
        ),
        GetPage<QuestionPage>(
          name: '/profile/question',
          page: () => const QuestionPage(),
          transition: get_trans.Transition.leftToRightWithFade,
        ),
        GetPage<ReleasePage>(
          name: '/profile/release',
          page: () => const ReleasePage(),
          transition: get_trans.Transition.leftToRightWithFade,
        ),
      ];
}
