import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class iUtills {
  static Widget getAuthTextField({
    @required var controller,
    @required var hint,
    @required var isPassword,
    @required var isPhone,
    @required var icon,
    @required var sufIcon,
  }) {
    return Material(
      elevation: 1.2,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.transparent,
            suffixIcon: Icon(sufIcon),
            contentPadding: EdgeInsets.all(12),
            border: InputBorder.none
          ),
        ),
      ),
    );
  }

  static final boldStyleText = GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500,);
  static final normaltyleText = GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w300,);
//  static Widget getTitleText ({
//    @required var text,
//  }){
//  return  Text(text,style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500,color: Apptheme.textColor),);
//  }
}