import 'package:app_shopping/homepage/homepage.dart';
import 'package:app_shopping/model/login_response_model.dart';
import 'package:app_shopping/model/user.dart';
import 'package:app_shopping/services/shared_service.dart';
import 'package:app_shopping/signup/signuppage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../../config.dart';
import '../../model/login_request_model.dart';
import '../../services/api_service.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? username;
  String? password;
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#283B71"),
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _loginUI(context),
          ),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(), 
        ), 
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                ]
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100)
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/ShoppingAppLogo.png",
                    width: 250,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              bottom: 30,
              top: 50
            ),
            child: Text(
              "Login", 
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 25, 
                color: Colors.white
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              "username", 
              "UserName",               
              (onValidateVal) {
                if(onValidateVal.isEmpty) {
                  return "Username can\'t be empty.";
                }
                return null;
              }, 
              (onSavedVal) {
                username = onSavedVal; 
              },
              prefixIcon: Icon(Icons.person),
              prefixIconPaddingLeft: 10,
              borderFocusColor: Colors.white,         
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              showPrefixIcon: true,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
              textInputAction: TextInputAction.next),             
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: FormHelper.inputFieldWidget(
                context,
                "password", 
                "PassWord", 
                (onValidateVal) {
                  if(onValidateVal.isEmpty) {
                    return "Password can\'t be empty.";
                  }
                  return null;
                }, 
                (onSavedVal) {
                  password = onSavedVal; 
                },
                prefixIcon: Icon(Icons.lock),
                prefixIconPaddingLeft: 10,
                borderFocusColor: Colors.white,         
                prefixIconColor: Colors.white,
                borderColor: Colors.white,
                showPrefixIcon: true,
                textColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.7),
                borderRadius: 10,
                obscureText: hidePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  color: Colors.white.withOpacity(0.7),
                  icon: Icon(
                    hidePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                textInputAction: TextInputAction.done,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 25, top: 10),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Forget Password ?',
                        style: const TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          print("Forget Password");
                        }
                      )
                    ]
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: FormHelper.submitButton("Login", () {
                if(validateAndSave()) {                 
                  setState(() {
                    isAPIcallProcess = true;
                  });
                  LoginRequestModel model = LoginRequestModel(
                    username: username!, 
                    password: password!);                  
                  APIService.login(model).then((response) async {                   
                    setState(() {
                      isAPIcallProcess = false;
                    });                   

                    if (response.resultObj != null) {                      
                      Navigator.pushNamedAndRemoveUntil(
                        context, 
                        HomePage.routeName, 
                        (route) => false);
                    }
                    else {
                      FormHelper.showSimpleAlertDialog(
                        context, 
                        Config.appName, 
                        response.message!, 
                        "OK", 
                        () {
                          Navigator.pop(context);
                        });
                    }
                  });
                }
              },
              btnColor: HexColor("#283B71"),
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 10),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "OR",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 25, top: 10),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: "Don\'t have an account? "),
                      TextSpan(
                        text: 'Sign up',
                        style: const TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Navigator.pushNamed(context, SignUpPage.routeName);
                        }
                      )
                    ]
                  ),
                ),
              ),
            ),
        ],
      )
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    else {
      return false;
    }
  }
}