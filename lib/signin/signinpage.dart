import 'package:app_shopping/signin/components/body.dart';
import 'package:flutter/material.dart';
class SignInPage extends StatelessWidget {
  static String routeName = "/sign_in";

  const SignInPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}


