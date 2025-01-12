import 'package:aic_lll/core/routes/app_routes.dart';
import 'package:aic_lll/authentication/login/login_bindings.dart';
import 'package:aic_lll/authentication/login/view/login_view.dart';
import 'package:aic_lll/authentication/signup/sign_up_bindings.dart';
import 'package:aic_lll/authentication/signup/view/sign_up_view.dart';
import 'package:aic_lll/home/products/view/create_product.dart';
import 'package:aic_lll/home/profile/views/edit_profile_view.dart';
import 'package:aic_lll/home/view/home_bindings.dart';
import 'package:aic_lll/home/view/home_view.dart';
import 'package:aic_lll/home/home_page_view.dart';
import 'package:aic_lll/splash/splash_binding.dart';
import 'package:aic_lll/splash/view/splash_page.dart';
import 'package:aic_lll/authentication/welcome/views/welcome_view.dart';
import 'package:aic_lll/authentication/welcome/welcome_binding.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashView(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoutes.welcome,
        page: () => const WelcomeView(),
        binding: WelcomeBinding()),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpView(),
      binding: SignUpBindings(),
    ),
    GetPage(
        name: AppRoutes.home,
        page: () => const HomeView(),
        binding: HomeBindings()),
    GetPage(
        name: AppRoutes.homePageView,
        page: () => HomePageView(),
        binding: HomeBindings()),
    GetPage(
      name: AppRoutes.createProduct,
      page: () => const CreateProduct(),
      binding: HomeBindings(), //essa vai ser a de criar produto, possivelmente
    ),
    GetPage(
        name: AppRoutes.editProfile,
        page: () => const EditProfileView(),
        binding: HomeBindings()),
  ];
}
