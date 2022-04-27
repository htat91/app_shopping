import 'package:app_shopping/services/api_service.dart';
import 'package:flutter/material.dart';

import '../../../services/shared_service.dart';




class AccountDetail extends StatefulWidget {
  const AccountDetail({Key? key}) : super(key: key);

  @override
  _AccountDetailState createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  final email = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  // LoginResponseModel? model;
  @override
  void initState() {
    super.initState();
    _getData();    
  }
  _getData() async {
    // model = await SharedService.loginDetails();
    // email.text = model!.name;
    var model = await APIService.getUserProfile();
    email.text = model.resultObj.email;
    name.text = model.resultObj.name;
    phone.text = model.resultObj.phoneNumber;
    address.text = model.resultObj.address;
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 5,),
            nameTextFormField(),
            const SizedBox(height: 5,),
            addressTextFormField(),
            const SizedBox(height: 5,),
            phoneTextFormField(),
            const SizedBox(height: 5,),
            emailTextFormField(),
            const SizedBox(height: 5,),
            passwordTextFormField(),
            const SizedBox(height: 5,),
            confirmTextFormField(),
            const SizedBox(height: 5,),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, email.text);
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.green,
                child: const Text("Save", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),),
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: IconButton(
                onPressed: () {
                  SharedService.logout(context);
                },
                icon: const Icon(
                Icons.logout,
                color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFormField nameTextFormField() {
    return TextFormField(
      controller: name,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your name",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.email_outlined)
      ),
    );
  }

  TextFormField addressTextFormField() {
    return TextFormField(
      controller: address,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your address ",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.email_outlined)
      ),
    );
  }

  TextFormField phoneTextFormField() {
    return TextFormField(
      controller: phone,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your phone ",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.email_outlined)
      ),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      controller: email,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your email ",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.email_outlined)
      ),
    );
  }

  TextFormField confirmTextFormField() {
    return TextFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Re-enter your password",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)
      ),
    );
  }


  TextFormField passwordTextFormField() {
    return TextFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your password",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)
      ),
    );
  }
}
