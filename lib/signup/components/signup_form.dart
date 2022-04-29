import 'package:app_shopping/homepage/homepage.dart';
import 'package:app_shopping/model/register_request_model.dart';
import 'package:app_shopping/model/user.dart';
import 'package:app_shopping/model/utilities.dart';
import 'package:app_shopping/signin/signinpage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../../config.dart';
import '../../model/login_request_model.dart';
import '../../services/api_service.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

extension Utility on BuildContext {
  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (FocusScope.of(this).focusedChild?.context?.widget is! EditableText);
  }
}

class _SignUpFormState extends State<SignUpForm> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  GlobalKey<FormFieldState> _passKey = GlobalKey<FormFieldState>();
  String? name;
  String? email;
  String? address;
  String? phone;
  String? username;
  String? password;
  String? confirmPassword;
  String? check;
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#283B71"),
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _registerUI(context),
          ),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(), 
        ), 
      ),
    );
  }

  Widget _registerUI(BuildContext context) {
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
              bottom: 20,
              top: 20
            ),
            child: Text(
              "Đăng ký", 
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
              "name", 
              "Tên của bạn", 
              (onValidateVal) {
                if(onValidateVal.isEmpty) {
                  return "Tên không được để trống.";
                }
                return null;
              }, 
              (onSavedVal) {
                name = onSavedVal; 
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
              textInputAction: TextInputAction.next)
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              "email", 
              "Email", 
              (onValidateVal) {
                return Utilities.validateEmail(onValidateVal);
              }, 
              (onSavedVal) {
                email = onSavedVal; 
              },
              prefixIcon: Icon(Icons.email),
              prefixIconPaddingLeft: 10,
              borderFocusColor: Colors.white,         
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              showPrefixIcon: true,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
              textInputAction: TextInputAction.next)
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              "address", 
              "Địa chỉ", 
              (onValidateVal) {
                if(onValidateVal.isEmpty) {
                  return "Địa chỉ không được để trống.";
                }
                return null;
              }, 
              (onSavedVal) {
                address = onSavedVal; 
              },
              prefixIcon: Icon(Icons.house),
              prefixIconPaddingLeft: 10,
              borderFocusColor: Colors.white,         
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              showPrefixIcon: true,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
              textInputAction: TextInputAction.next)
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              "phone", 
              "Số điện thoại", 
              (onValidateVal) {
                return Utilities.validatePhoneNumber(onValidateVal);
              }, 
              (onSavedVal) {
                phone = onSavedVal; 
              },
              prefixIcon: Icon(Icons.phone),
              prefixIconPaddingLeft: 10,
              borderFocusColor: Colors.white,         
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              showPrefixIcon: true,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
              textInputAction: TextInputAction.next)
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              "username", 
              "Tên tài khoản", 
              (onValidateVal) {
                if(onValidateVal.isEmpty) {
                  return "Tên tài khoản không được để trống";
                }
                return null;
              }, 
              (onSavedVal) {
                username = onSavedVal; 
              },
              prefixIcon: Icon(Icons.people),
              prefixIconPaddingLeft: 10,
              borderFocusColor: Colors.white,         
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              showPrefixIcon: true,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
              textInputAction: TextInputAction.next)
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: FormHelper.inputFieldWidget(
                context,
                "password", 
                "Mật khẩu", 
                (onValidateVal) {
                  check = onValidateVal;
                  return Utilities.validatePassword(onValidateVal);
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
                textInputAction: TextInputAction.next,
                onEditingComplete: () => _confirmPasswordFocusNode.requestFocus()
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: FormHelper.inputFieldWidget(
                context,
                "confirmPassword", 
                "Xác nhận mật khẩu", 
                (onValidateVal) {
                  return Utilities.confirmPassword(onValidateVal, check!);
                }, 
                (onSavedVal) {
                  confirmPassword = onSavedVal; 
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
                obscureText: hideConfirmPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hideConfirmPassword = !hideConfirmPassword;
                    });
                  },
                  color: Colors.white.withOpacity(0.7),
                  icon: Icon(
                    hideConfirmPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                focusNode: _confirmPasswordFocusNode,
                textInputAction: TextInputAction.done,
                onEditingComplete: () => _confirmPasswordFocusNode.unfocus()              
              ),
            ),           
            const SizedBox(
              height: 20,
            ),
            Center(
              child: FormHelper.submitButton("Đăng ký", () {
                if(validateAndSave()) {                 
                  setState(() {
                    isAPIcallProcess = true;
                  });
                  RegisterRequestModel model = RegisterRequestModel(
                    name: name!,
                    email: email!,
                    address: address!,
                    phoneNumber: phone!,
                    userName: username!, 
                    password: password!,
                    confirmPassword: confirmPassword!
                  );                  
                  APIService.register(model).then((response) async {                   
                    setState(() {
                      isAPIcallProcess = false;
                    });

                    if (response.resultObj != null) {
                      FormHelper.showSimpleAlertDialog(
                        context, 
                        Config.appName, 
                        "Đăng ký thành công. Hãy đăng nhập tài khoản để sử dụng.", 
                        "OK", 
                        () {
                          Navigator.pushNamedAndRemoveUntil(
                            context, 
                            SignInPage.routeName, 
                            (route) => false
                          );
                        }
                      );                                          
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