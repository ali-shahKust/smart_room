import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_room/utils/apptheme.dart';
import 'package:smart_room/utils/iUtills.dart';

class DailyDairy extends StatefulWidget {
  @override
  _DailyDairyState createState() => _DailyDairyState();
}

class _DailyDairyState extends State<DailyDairy> {
  Color _selectedColor = Colors.white;
  double currentOffset = 0.0;
  var _selected=-1 ;
  var _productive = 2;
  var _focus = 1;
  ScrollController controller= ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = ScrollController()
      ..addListener(() {
        print("offset = ${controller.offset}");
        setState(() {

        });
        currentOffset= controller.offset;
      });


    print("current offset ${currentOffset}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Daily Dairy",style: TextStyle(fontSize: 20,color: Colors.white),),centerTitle: true,backgroundColor: Apptheme.primary,),

      backgroundColor: Color(0xff22AAE2),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          controller: controller,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:22.0,vertical:18),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                     color: controller.positions.isNotEmpty&&controller.offset>25?Apptheme.container.withOpacity(0.7):Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('How do you feel today?',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 18,),),
                            Row(
                              children: [
                                Theme(data: ThemeData(

                                  radioTheme: RadioThemeData(

                                  )
                                ),
                                child: Radio(
                                  overlayColor: MaterialStateProperty.all(Colors.white),
                                  onChanged: (value) {

                                    _selected= value;
                                    setState(() {

                                    });
                                  }, value: 0, groupValue: _selected,)),
                                Text('Very Negative',style: iUtills.normaltyleText,)
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  overlayColor: MaterialStateProperty.all(Colors.white),

                                  onChanged: (value) {   _selected= value;
                                   setState(() {

                                    });
                                  }, value: 1, groupValue: _selected,),
                                Text('Negative',style: iUtills.normaltyleText,)

                              ],
                            ),
                            Row(
                              children: [
                                Radio(onChanged: (value) {    _selected= value;
                                setState(() {

                                });
                                }, value: 2, groupValue: _selected,),
                                Text('Nuetral',style: iUtills.normaltyleText,)

                              ],
                            ),
                            Row(
                              children: [
                                Radio(onChanged: (value) {   _selected= value;
                                setState(() {

                                });
                                }, value: 3, groupValue: _selected,),
                                Text('Positive',style: iUtills.normaltyleText,)

                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5.0),

                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: controller.positions.isNotEmpty&&controller.offset>50&&controller.offset<120?Colors.white:Apptheme.container.withOpacity(0.7)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('How focus were you today?',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 18,),),
                            Row(
                              children: [
                                Theme(data: ThemeData(
                                    radioTheme: RadioThemeData(

                                    )
                                ),
                                    child: Radio(
                                      overlayColor: MaterialStateProperty.all(Colors.white),
                                      onChanged: (value) {
                                        _focus = value;
                                        setState(() {

                                        });
                                      }, value: 1, groupValue: _focus,)),
                                Text('Very Unfocused',style: iUtills.normaltyleText,)
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  onChanged: (value) {   _focus = value;
                                        setState(() {

                                        }); }, value: 2, groupValue: _focus,),
                                Text('Unfocused',style: iUtills.normaltyleText,)

                              ],
                            ),
                            Row(
                              children: [
                                Radio(onChanged: (value) {   _focus = value;
                                setState(() {

                                }); }, value: 3, groupValue: _focus,),
                                Text('Nuetral',style: iUtills.normaltyleText,)

                              ],
                            ),
                            Row(
                              children: [
                                Radio(onChanged: (value) {   _focus = value;
                                setState(() {

                                }); }, value: 4, groupValue: _focus,),
                                Text('Focused',style: iUtills.normaltyleText,)

                              ],
                            ),
                            Row(
                              children: [
                                Radio(onChanged: (value) {   _focus = value;
                                setState(() {

                                }); }, value: 5, groupValue: _focus,),
                                Text('Very Focused',style: iUtills.normaltyleText,)

                              ],
                            ),

                          ],
                        ),
                      ),
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5.0),

                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: controller.positions.isNotEmpty&&controller.offset>120&&controller.offset<320?Colors.white:Apptheme.container.withOpacity(0.7)
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('How Productive were you today?',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 18,),),
                            Row(
                              children: [
                                Theme(data: ThemeData(
                                    radioTheme: RadioThemeData(

                                    )
                                ),
                                    child: Radio(
                                      overlayColor: MaterialStateProperty.all(Colors.white),
                                      onChanged: (value) {
                                        _productive = value;
                                        setState(() {

                                        });
                                      }, value: 1, groupValue: _productive,)),
                                Text('Very Unproductive',style: iUtills.normaltyleText,)
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  onChanged: (value) {   _productive = value;
                                  setState(() {

                                  }); }, value: 2, groupValue: _productive,),
                                Text('Unproductive',style: iUtills.normaltyleText,)

                              ],
                            ),
                            Row(
                              children: [
                                Radio(onChanged: (value) {   _productive = value;
                                setState(() {

                                }); }, value: 3, groupValue: _productive,),
                                Text('Nuetral',style: iUtills.normaltyleText,)

                              ],
                            ),
                            Row(
                              children: [
                                Radio(onChanged: (value) {   _productive = value;
                                setState(() {

                                }); }, value: 4, groupValue: _productive,),
                                Text('Productive',style: iUtills.normaltyleText,)

                              ],
                            ),
                            Row(
                              children: [
                                Radio(onChanged: (value) {   _productive = value;
                                setState(() {

                                }); }, value: 5, groupValue: _productive,),
                                Text('Very Productive',style: iUtills.normaltyleText,)

                              ],
                            ),

                          ],
                        ),
                      ),
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5.0),

                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: controller.positions.isNotEmpty&&controller.offset>320&&controller.offset<520?Colors.white:Apptheme.container.withOpacity(0.7)
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('How Productive were you today?',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 18,),),
                            Row(
                              children: [
                                Theme(data: ThemeData(
                                    radioTheme: RadioThemeData(

                                    )
                                ),
                                    child: Radio(
                                      overlayColor: MaterialStateProperty.all(Colors.white),
                                      onChanged: (value) {
                                        _productive = value;
                                        setState(() {

                                        });
                                      }, value: 1, groupValue: _productive,)),
                                Text('Very Unproductive',style: iUtills.normaltyleText,)
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  onChanged: (value) {   _productive = value;
                                  setState(() {

                                  }); }, value: 2, groupValue: _productive,),
                                Text('Unproductive',style: iUtills.normaltyleText,)

                              ],
                            ),
                            Row(
                              children: [
                                Radio(onChanged: (value) {   _productive = value;
                                setState(() {

                                }); }, value: 3, groupValue: _productive,),
                                Text('Nuetral',style: iUtills.normaltyleText,)

                              ],
                            ),
                            Row(
                              children: [
                                Radio(onChanged: (value) {   _productive = value;
                                setState(() {

                                }); }, value: 4, groupValue: _productive,),
                                Text('Productive',style: iUtills.normaltyleText,)

                              ],
                            ),
                            Row(
                              children: [
                                Radio(onChanged: (value) {   _productive = value;
                                setState(() {

                                }); }, value: 5, groupValue: _productive,),
                                Text('Very Productive',style: iUtills.normaltyleText,)

                              ],
                            ),

                          ],
                        ),
                      ),
                    ),

                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
