import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_room/utils/apptheme.dart';
import 'package:smart_room/utils/fakecharts.dart';
import 'package:smart_room/utils/iUtills.dart';

import 'package:fl_animated_linechart/chart/area_line_chart.dart';
import 'package:fl_animated_linechart/common/pair.dart';
import 'package:fl_animated_linechart/fl_animated_linechart.dart';
import 'package:flutter/material.dart';
class Insight_Explained extends StatefulWidget {
  @override
  _Insight_ExplainedState createState() => _Insight_ExplainedState();
}

class _Insight_ExplainedState extends State<Insight_Explained>with FakeChartSeries {
  int chartIndex = 0;

  @override
  Widget build(BuildContext context) {
    Map<DateTime, double> line1 = createLine2();
    Map<DateTime, double> line2 = createLine2_2();

    LineChart chart;

    if (chartIndex == 0) {
      chart = LineChart.fromDateTimeMaps(
          [line1, line2], [Colors.green, Colors.blue], ['C', 'C'],
          tapTextFontWeight: FontWeight.w400);
    } else if (chartIndex == 1) {
      chart = LineChart.fromDateTimeMaps(
          [createLineAlmostSaveValues()], [Colors.green], ['C'],
          tapTextFontWeight: FontWeight.w400);
    } else {
      chart = AreaLineChart.fromDateTimeMaps(
          [line1], [Colors.red.shade900], ['C'],
          gradients: [Pair(Colors.yellow.shade400, Colors.red.shade700)]);
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,),) ,
        elevation: 0,
        title: Text("Insights",style: TextStyle(fontSize: 20,color: Colors.black),),centerTitle: true,backgroundColor: Color(0xffF3F3F6),),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularPercentIndicator(
                  radius: 100.0,
                  lineWidth: 10.0,
                  animation: true,
                  progressColor: Apptheme.primary,
                  percent: 0.7,
                  center: new Text(
                    "70.0%",
                    style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 11.0),
                  ),
                ),
                SizedBox(height: 15,),

                Text("Less Instagram use might improve your sleep",style: iUtills.boldStyleText,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/2,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AnimatedLineChart(
                                chart,
                                key: UniqueKey(),
                              ), //Unique key to force animations
                            )),
                        SizedBox(width: 200, height: 50, child: Text('')),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:12.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width:MediaQuery.of(context).size.width/2.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(width: 60,height: 3,color: Apptheme.primary,),
                              Text('Instagram',style: iUtills.boldStyleText,)
                            ],
                          ),
                        ),
                        Container(
                          width:MediaQuery.of(context).size.width/2.4,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(width: 60,height: 3,color: Apptheme.green,),
                              Text('Sleep',style: iUtills.boldStyleText,)
                            ],
                          ),
                        ),
                      ],
                    ),
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
