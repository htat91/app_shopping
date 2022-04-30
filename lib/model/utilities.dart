import 'dart:convert';


import 'package:app_shopping/model/products.dart';
import 'package:http/http.dart' as http ;
import 'package:intl/intl.dart';
import 'package:quiver/strings.dart';

class Utilities {
  // String url = 'http://192.168.0.100:3000/api/food';

  static List<Products> data = [];
  static List<int> dataCheck = [];

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email không được để trống';
    }
    const pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))\@gmail[\.]com$';
        // r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Bạn đã nhập sai định dạng email. Vui lòng nhập lại';
    else
      return null;
  }

  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return "Số điện thoại không được để trống";
    }
    if (value.length > 10 || value.length < 9) {
      return "Số điện thoại có 10 số";
    }
    const pattern = 
        r'^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$';
    RegExp regExp = new RegExp(pattern);
    if(!regExp.hasMatch(value))
      return "Bạn đã nhập sai định dạng số điện thoại. Vui lòng nhập lại";
    else
      return null;
  }

  static String? validatePassword(String value){
    if(value.isEmpty){
      return 'Mật khẩu không được để trống';
    }
    if(value.length < 8){
      return 'Mật khẩu tối thiểu 8 ký tự';
    }
    return null;
  }

  static String? confirmPassword(String value, String value2){
    if(value.isEmpty) {
      return "Xác nhận mật khẩu không được để trống";
    }
    if(!equalsIgnoreCase(value, value2))
      return "Mật khẩu xác nhận không trùng khớp";
    return null;
  }

  // List<Products> getProductFromCate(int id) {
  //   return Products.init().where((p) => p.cateID == id).toList();
  // }

  static String getCurrency() {
    Intl.defaultLocale = 'vi_VN';
    var format = NumberFormat.simpleCurrency(locale: Intl.defaultLocale);
    return format.currencySymbol;
  }
}
