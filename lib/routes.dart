import 'package:app_shopping/homepage/homepage.dart';
import 'package:app_shopping/signin/signinpage.dart';
import 'package:flutter/widgets.dart';






final Map<String, WidgetBuilder> routes = {
  // SplashPage.routeName : (context) => const SplashPage(),
  SignInPage.routeName : (context) => const SignInPage(),
  // SignUpPage.routeName : (context) => SignUpPage(),
  HomePage.routeName : (context) => HomePage(),
  // CategoryPage.routeName:(context)=>CategoryPage(),
  // ProductPage.routeName : (context) => ProductPage(),
  // CartPage.routeName: (context) => CartPage(),
};
