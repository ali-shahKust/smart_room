import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_room/res.dart';
import 'package:smart_room/screens/colour.dart';
import 'package:smart_room/screens/control_center.dart';
import 'package:smart_room/screens/lights.dart';
import 'package:smart_room/utils/apptheme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Home",style: TextStyle(fontSize: 20,color: Colors.black),),centerTitle: true,backgroundColor: Color(0xffF3F3F6),),

      backgroundColor: Apptheme.background,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:28.0),
                child: Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height/3,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                              width: 80,
                              height: 80,
                              child: SvgPicture.asset(Res.setting_button)),
                          Text('Settings',)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap:(){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Control_Center())) ;
                                },
                                child: Container(
                                    width: 80,
                                    height: 80,
                                    child: SvgPicture.asset(Res.controls_button)),
                              ),
                              Text('Controls',)

                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ColoursPicker())) ;
                    },
                                child: Container(
                                    width: 80,
                                    height: 80,
                                    child: Image.asset(Res.colors)),
                              ),
                              Text('Colours',)

                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2,
                child: SvgPicture.asset(Res.big_bulb),
                
              )
            ],
          ),
        ),
      ),
    );
  }
}
