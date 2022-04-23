import 'package:app_shopping/homepage/components/fragments/account_detail.dart';
import 'package:app_shopping/homepage/components/fragments/favorite_fragment.dart';
import 'package:app_shopping/homepage/components/fragments/home_fragment.dart';
import 'package:app_shopping/homepage/components/fragments/notification_fragment.dart';
import 'package:app_shopping/homepage/components/homeheader.dart';
import 'package:app_shopping/model/utilities.dart';
import 'package:flutter/material.dart';

// import 'package:hoangtrananthien_18dh110447/homepage/components/notification_fragment.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var selectIndex = 0;
  var flag = true;

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      HomeDetail(),
      FavoriteDetail(Utilities.data),
      NotificationDetail(),
      AccountDetail()
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  HomeHeader() 
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectIndex,
        onTap: (index){
          setState(() {
            selectIndex = index;
            if(selectIndex != 3){
              flag = true;
            }else{
              flag = false;
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10,),
            screen[selectIndex]
          ],
        ),
      ),
    );
  }
}
