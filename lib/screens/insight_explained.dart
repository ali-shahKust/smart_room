import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_room/utils/apptheme.dart';
import 'package:smart_room/utils/iUtills.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Insight_Explained extends StatefulWidget {
  @override
  _Insight_ExplainedState createState() => _Insight_ExplainedState();
}

class _Insight_ExplainedState extends State<Insight_Explained> {
  TooltipBehavior _tooltipBehavior;
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
  @override
  void initState(){
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
                  height: MediaQuery.of(context).size.height/2.5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    //Initialize the spark charts widget
                    child: SfSparkLineChart(
                      //Enable the trackball
                      trackball: SparkChartTrackball(
                          activationMode: SparkChartActivationMode.tap),
                      //Enable marker
                      marker: SparkChartMarker(
                          displayMode: SparkChartMarkerDisplayMode.all),
                      //Enable data label
                      labelDisplayMode: SparkChartLabelDisplayMode.all,
                      data: <double>[1,2,34],
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
class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}