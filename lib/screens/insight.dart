import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_room/screens/insight_explained.dart';
import 'package:smart_room/utils/apptheme.dart';
import 'package:smart_room/utils/iUtills.dart';

class Insight extends StatefulWidget {
  @override
  _InsightState createState() => _InsightState();
}

class _InsightState extends State<Insight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,),) ,
        elevation: 0,
        title: Text("Insights",style: TextStyle(fontSize: 20,color: Colors.black),),centerTitle: true,backgroundColor: Color(0xffF3F3F6),),

      body: SingleChildScrollView(
        child: Column(
          children: [
            mWidget("Productivity insights goes here", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", 0.7),
            mWidget("Productivity insights goes here", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", 0.7),
            mWidget("Productivity insights goes here", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", 0.7),
          ],
        ),
      ),
    );
  }

  mWidget(@required var title, @required var subtitle, @required percentValue) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Insight_Explained()));
        },
        child: Card(
          elevation: 1.2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width - 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: iUtills.boldStyleText,
                        ),
                        Text(
                          subtitle,
                          style: iUtills.normaltyleText,
                        ),
                      ],
                    )),
                CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 5.0,
                  animation: true,
                  progressColor: Apptheme.primary,
                  percent: percentValue,
                  center: new Text(
                    "70.0%",
                    style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 11.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
