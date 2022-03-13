
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {

  final String title;
  final Function on_tap;


  MyButton(this.title, this.on_tap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:on_tap ,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          color: Color(0xff5CB441),
          borderRadius: BorderRadius.circular(40)
        ),
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        child:Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            textStyle:TextStyle(color: Colors.white, letterSpacing: 0.5),
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),

        ) ,
      ),
    );
  }
}
