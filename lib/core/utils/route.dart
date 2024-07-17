import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as get_trans;

import '../../presentation/pages/auth/login_page.dart';
import '../../presentation/pages/auth/register_page.dart';
import '../../presentation/pages/landing_page.dart';
import '../../presentation/pages/profile/about_page.dart';
import '../../presentation/pages/profile/contact_page.dart';
import '../../presentation/pages/profile/question_page.dart';
import '../../presentation/pages/profile/update_profile_page.dart';
import '../../presentation/widgets/global/navbar.dart';

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
        GetPage<UpdateUserPage>(
          name: '/profile/edit-profile',
          page: () => const UpdateUserPage(),
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
        GetPage<AboutPage>(
          name: '/profile/about',
          page: () => const AboutPage(),
          transition: get_trans.Transition.leftToRightWithFade,
        ),
      ];
}
