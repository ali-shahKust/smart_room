import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_room/res.dart';
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

  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    _tabs = [
      Dashboard(),ViewPage(),Dashboard(),HomePage(),Dashboard()
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
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Color(0xffF3F3F6),
          //   selectedItemColor: CustomTheme.buttonclr,
          unselectedItemColor: Colors.grey,
          key: _bottomNavigationKey,

          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: _page == 0
                    ? Container(
                        width: 60,
                        height: 60,
                        child: SvgPicture.asset(Res.dash_active),
                      )
                    : Container(
                  width: 60,
                  height: 60,
                        child: SvgPicture.asset(Res.dash_inactive),
                      ),
                title: Text(
                  '',
                  style: TextStyle(color: Colors.white),
                )),
            BottomNavigationBarItem(
                icon: _page == 1
                    ? Container(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset(Res.viewpage_active),
                )
                    : Container(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset(Res.viewpage_inactive),
                ),
                title: Text(
                  '',
                  style: TextStyle(color: Colors.white,fontSize: 12),
                )),
            BottomNavigationBarItem(
                icon: _page == 2
                    ? Container(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset(Res.mic_pressed),
                )
                    : Container(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset(Res.mic),
                ),
                title: Text(
                  '',
                  style: TextStyle(color: Colors.white),
                )),
            BottomNavigationBarItem(
                icon: _page == 3
                    ? Container(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset(Res.home_active),
                )
                    : Container(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset(Res.home_inactive),
                ),
                title: Text(
                  '',
                  style: TextStyle(color: Colors.white),
                )),
            BottomNavigationBarItem(
                icon: _page == 4
                    ? Container(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset(Res.setting_inactive),
                )
                    : Container(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset(Res.setting_inactive),
                ),
                title: Text(
                  '',
                  style: TextStyle(color: Colors.white),
                ))
          ],
          type: BottomNavigationBarType.fixed,

          currentIndex: _page,
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: _tabs[_page],
      ),
    );
  }
}
