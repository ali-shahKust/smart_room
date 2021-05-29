import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_room/res.dart';
import 'package:smart_room/screens/insight.dart';
import 'package:smart_room/utils/apptheme.dart';

class ViewPage extends StatefulWidget {
  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("View",style: TextStyle(fontSize: 20,color: Colors.black),),centerTitle: true,backgroundColor: Color(0xffF3F3F6),),
      backgroundColor: Apptheme.background,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              mCustomCard(Res.yoga, "Well being"),
              InkWell(onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Insight()));
              },child:               mCustomCard(Res.puzzle, "Productivity"),),
              mCustomCard(Res.sleep, "Sleep"),
            ],
          ),
        ),
      ),
    );
  }
  mCustomCard(@required var icon , @required var title){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Neumorphic(
        style: NeumorphicStyle(
            shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            depth: 4,
            lightSource: LightSource.topLeft,
            color: Apptheme.background
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,height: 100,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SvgPicture.asset(icon),
                SizedBox(width: 25,),
                Text(title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
