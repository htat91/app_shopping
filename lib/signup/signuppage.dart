import 'package:app_shopping/signup/components/body.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  static String routeName = "/sign_up";

  const SignUpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}