import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_room/res.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isSuccessful=false;
  List<dynamic> _list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3F6),
      appBar: AppBar(
        elevation: 0,
        title: Text("Dashboard",style: TextStyle(fontSize: 20,color: Colors.black),),centerTitle: true,backgroundColor: Color(0xffF3F3F6),),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:28.0),
                child: Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height/4,
                child: Column(
                  children: [
                    Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(Res.option_two)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 80,
                            height: 80,
                            child: Image.asset(Res.option_one)),
                        Container(
                            width: 80,
                            height: 80,
                            child: Image.asset(Res.option_three)),
                      ],
                    )
                  ],
                ),
                ),
              ),
              DragTarget(
                builder: (context, List<String> candidateData, rejectedData) {
                  return Center(
                    child: _list.isEmpty
                        ? Padding(
                      padding: EdgeInsets.only(top: 100.0),
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        child: Center(
                            child:Image.asset(Res.dashcenter)),
                      ),
                    ):_list.length==1?Padding(
                      padding: EdgeInsets.only(top: 100.0),
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        child: Center(
                            child:Image.asset(Res.ring_one)),
                      ),
                    ):_list.length==2?Padding(
                      padding: EdgeInsets.only(top: 100.0),
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        child: Center(
                            child:Image.asset(Res.ring_two)),
                      ),
                    ):Padding(
                      padding: EdgeInsets.only(top: 100.0),
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        child: Center(
                            child:Image.asset(Res.full_ring)),
                      ),
                    )
                  );
                },
                onWillAccept: (data) {
                  return true;
                },
                onAccept: (data) {
                  setState(() {
                    _list.add(_list.length+1);
                    isSuccessful = true;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:28.0),
                child: Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height/4,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Draggable(
                            data: 'Flutter',
                            child:     Container(
                                width: 80,
                                height: 80,
                                child: Image.asset(Res.google)),
                            feedback:    Container(
                                width: 80,
                                height: 80,
                                child: Image.asset(Res.google)),
                            childWhenDragging: Container(),
                          ),
                          Draggable(
                            data: 'Flutter',
                            child:     Container(
                                width: 80,
                                height: 80,
                                child: Image.asset(Res.bulb)),
                            feedback:    Container(
                                width: 80,
                                height: 80,
                                child: Image.asset(Res.bulb)),
                            childWhenDragging: Container(),
                          ),
                        ],
                      ),

                      Draggable(
                        data: 'Flutter',
                        child:     Container(
                            width: 80,
                            height: 80,
                            child: Image.asset(Res.matt)),
                        feedback:    Container(
                            width: 80,
                            height: 80,
                            child: Image.asset(Res.matt)),
                        childWhenDragging: Container(),
                      ),

                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
