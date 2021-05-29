import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smart_room/res.dart';
import 'package:smart_room/utils/apptheme.dart';
class Lights extends StatefulWidget {
  @override
  _LightsState createState() => _LightsState();
}

class _LightsState extends State<Lights> {
  bool lighroomBool = true;
  bool bedroomBool = true;
  bool kitchenroomBool = true;

  var sliderValue=0.0;
  var bedsliderValue=0.0;
  var kitchensliderValue=0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Apptheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            mCustomWidget("Living Room light",    Container(
              width: 50,
              height: 35,
              child: NeumorphicSwitch(

                style: NeumorphicSwitchStyle(

                  activeThumbColor: Apptheme.primary,
                  inactiveThumbColor: Apptheme.background,
                  activeTrackColor: Apptheme.background,
                  inactiveTrackColor: Apptheme.background,
                ),

                  value: lighroomBool, onChanged: (val){
                lighroomBool = val;
                setState(() {

                });
              }),
            ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Apptheme.primary,
                    inactiveTrackColor: Colors.white,
                    trackShape: RoundedRectSliderTrackShape(),
                    trackHeight: 8.0,
                    thumbColor: Apptheme.primary,

                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 4.0),
                    overlayColor: Apptheme.primary,
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 12.0),
                  ),
                  child: Slider(
                    value: sliderValue,
                    onChanged: (v){
                      setState(() {
                        sliderValue = v;
                      });
                    },
                  ),
                ), "off"),
            mCustomWidget("Bedroom light",        Container(  width: 50,
              height: 35,
              child: NeumorphicSwitch(

                  style: NeumorphicSwitchStyle(

                    activeThumbColor: Apptheme.primary,
                    inactiveThumbColor: Apptheme.background,
                    activeTrackColor: Apptheme.background,
                    inactiveTrackColor: Apptheme.background,
                  ),

                  value: bedroomBool, onChanged: (val){
                bedroomBool = val;
                setState(() {

                });
              }),
            ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Apptheme.primary,
                    inactiveTrackColor: Colors.white,
                    trackShape: RoundedRectSliderTrackShape(),
                    trackHeight: 8.0,
                    thumbColor: Apptheme.primary,

                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 4.0),
                    overlayColor: Apptheme.primary,
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 12.0),
                  ),
                  child: Slider(
                    value: bedsliderValue,
                    onChanged: (v){
                      setState(() {
                        bedsliderValue = v;
                      });
                    },
                  ),
                ), "off"),



            mCustomWidget("Kitchen light",Container(  width: 50,
              height: 35,
              child: NeumorphicSwitch(

                  style: NeumorphicSwitchStyle(

                    activeThumbColor: Apptheme.primary,
                    inactiveThumbColor: Apptheme.background,
                    activeTrackColor: Apptheme.background,
                    inactiveTrackColor: Apptheme.background,
                  ),

                  value: kitchenroomBool, onChanged: (val){
                kitchenroomBool = val;
                setState(() {

                });
              }),
            ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Apptheme.primary,
                    inactiveTrackColor: Colors.white,
                    trackShape: RoundedRectSliderTrackShape(),
                    trackHeight: 8.0,
                    thumbColor: Apptheme.primary,

                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 4.0),
                    overlayColor: Apptheme.primary,
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 12.0),
                  ),
                  child: Slider(

                    value: kitchensliderValue,
                    onChanged: (v){
                      setState(() {
                        kitchensliderValue = v;
                      });
                    },
                  ),
                ), "off"),
          ],
        ),
      ),
    );
  }

  mCustomWidget(@required var title,@required var switchBtn,@required var percent,@required var subtitle,){
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child:
      Neumorphic(
          style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              depth: 4,
              lightSource: LightSource.topLeft,
              color: Apptheme.background
          ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:12.0,horizontal: 12),
          child: Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width-150,

                      child: Row(
                        children: [
                          SvgPicture.asset(Res.idea),
                          SizedBox(width: 12,),
                          Text(title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),

                    switchBtn

                  ],
                ),

                percent,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(subtitle,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),

                      Image.asset(Res.colors,width: 30,height: 30,)
                    ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
