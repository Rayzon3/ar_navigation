import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter_application_1/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_application_1/screens/login_success/login_success_screen.dart';
import 'package:flutter_application_1/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_application_1/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_application_1/screens/splash/splash_screen.dart';


final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
};
