import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class ColoursPicker extends StatefulWidget {
  @override
  _ColoursPickerState createState() => _ColoursPickerState();
}

class _ColoursPickerState extends State<ColoursPicker> {
   Color screenPickerColor; // Color for picker shown in Card on the screen.
   bool isDark;
  @override
  void initState() {
    screenPickerColor = Colors.blue;
    isDark = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,),) ,
        elevation: 0,
        title: Text("Colours",style: TextStyle(fontSize: 20,color: Colors.black),),centerTitle: true,backgroundColor: Color(0xffF3F3F6),),

      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          children: <Widget>[

            // Show the color picker in sized box in a raised card.
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Card(
                  elevation: 1.2,
                  child: ColorPicker(
                    pickersEnabled: const <ColorPickerType,bool>{
                      ColorPickerType.primary:true,
                      ColorPickerType.wheel:true,
                      ColorPickerType.accent:true,
                    },
                    // Use the screenPickerColor as start color.
                    color: screenPickerColor,
                    // Update the screenPickerColor using the callback.
                    onColorChanged: (Color color) =>
                        setState(() => screenPickerColor = color),
                    width: 44,
                    height: 44,
                    borderRadius: 22,
                    heading: Text(
                      'Select color',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    subheading: Text(
                      'Select color shade',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}