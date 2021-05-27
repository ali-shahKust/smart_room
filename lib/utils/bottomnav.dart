import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:smart_room/res.dart';
import 'package:smart_room/screens/chat.dart';
import 'package:smart_room/screens/daily_dairy.dart';
import 'package:smart_room/screens/dashboard.dart';
import 'package:smart_room/screens/home.dart';
import 'package:smart_room/screens/viewPage.dart';

import 'apptheme.dart';


class Bottom_Nav_Page extends StatefulWidget {
  @override
  _Bottom_Nav_PageState createState() => _Bottom_Nav_PageState();
}

class _Bottom_Nav_PageState extends State<Bottom_Nav_Page> {
  List<Object> _tabs;
  String mIcon = Res.mic;
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    _tabs = [
      Dashboard(),ViewPage(),HomePage(),DailyDairy()
    ];

    super.initState();
  }

  Future<bool> _willPopCallback() async {
    // await showDialog or Show add banners or whatever
    // then
    return false; // return true if the route to be popped
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _willPopCallback();
      },
      child: Scaffold(
        bottomNavigationBar:BottomAppBar(
          elevation: 0,
          color: Apptheme.background,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

                 GestureDetector(
                   onTap: (){
                     setState(() {
                       _page = 0;

                     });
                   },
                   child: Container(
                width: 60,
                height: 60,
                child: _page == 0?SvgPicture.asset(Res.dash_active):SvgPicture.asset(Res.dash_inactive),
              ),
                 ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    _page = 1;

                  });
                },
                child: Container(
                  width: 60,
                  height: 60,
                  child: _page == 1?SvgPicture.asset(Res.viewpage_active):SvgPicture.asset(Res.viewpage_inactive),
                ),
              ),
              GestureDetector(

                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatTwoPage()));
                },
                onTapDown: (val){
                  setState(() {
                    mIcon = Res.mic_pressed;

                  });
                },
                onTapUp: (val){
                  setState(() {
                    mIcon = Res.mic;
                  });
                },
                child: Container(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset(mIcon),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    _page = 2;

                  });
                },
                child: Container(
                  width: 60,
                  height: 60,
                  child: _page == 2?SvgPicture.asset(Res.home_active):SvgPicture.asset(Res.home_inactive),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    _page = 3;

                  });
                },
                child: Container(
                  width: 60,
                  height: 60,
                  child: _page == 3?SvgPicture.asset(Res.setting_inactive):SvgPicture.asset(Res.setting_inactive),
                ),
              ),


            ],
          ),
        ),
        body: _tabs[_page],
      ),
    );
  }
}
