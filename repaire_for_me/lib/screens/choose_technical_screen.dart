import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repaire_for_me/helpers/my_themes.dart';

class ChooseTechnicalScreen extends StatefulWidget {
  ChooseTechnicalScreen({Key key}) : super(key: key);

  @override
  _ChooseTechnicalScreenState createState() => _ChooseTechnicalScreenState();
}

class _ChooseTechnicalScreenState extends State<ChooseTechnicalScreen> {

  final complianController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyTheme(context).background_color,

      body: Column(
        children: [

            drowHeder(),
          Expanded(

            child: GridView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return TechnicalCard();
              },
              padding: EdgeInsets.all(10),
              scrollDirection:Axis.vertical ,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //mainAxisExtent: 150,
                childAspectRatio: 3.0,
                mainAxisSpacing: 12,
                crossAxisSpacing: 4,
                crossAxisCount: 1,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: drowbtn(),
          ),
        ],
      ),
    ));
  }

 Widget drowHeder() {
    return    Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyTheme(context).background_color,
        borderRadius: BorderRadius.circular(22.0),
        boxShadow: [
          BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Choose Your Technical',
            style: GoogleFonts.roboto(
              textStyle:
              TextStyle(color: MyTheme(context).text_color, letterSpacing: 0.5),
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            ),
          ),
          PopupMenuButton<String>(
            icon:   SvgPicture.asset(
              "assets/icons/fillter_icon.svg",
              // By default our  icon color is white
              color: MyTheme(context).text_color,
            ),
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),

        ],
      ),
    );
 }

 Widget TechnicalCard(){
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: MyTheme(context).background_color,
        borderRadius: BorderRadius.circular(22.0),
        border: Border.all(width: 1.0, color: const Color(0xffe6dddd)),
        boxShadow: [
          BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage:AssetImage("assets/images/user_photo.png"),
          ),
          SizedBox(width: 15,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ahmed Hassan',
                style: GoogleFonts.roboto(
                  textStyle:
                  TextStyle(color: MyTheme(context).text_color, letterSpacing: 0.5),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
              ),
              Text(
                'Electricity technician',
                style: GoogleFonts.roboto(
                  textStyle:
                  TextStyle( color: MyTheme(context).text_color, letterSpacing: 0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
              ),
              drowRating(),
            ],
          ),
          SizedBox(width: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                              "assets/icons/loc_icon.svg",
                              // By default our  icon color is white
                              color: MyTheme(context).text_color,
                            ),
              Text(
                '20 KM',
                style: GoogleFonts.roboto(
                  textStyle:
                  TextStyle(color: MyTheme(context).app_color1, letterSpacing: 0.5),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          )
        ],
      ),
    );
 }
  Widget drowRating() {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RatingBar(
            initialRating: 4.0,
            direction: Axis.horizontal,
            itemCount: 5,
            itemSize: 22,
            unratedColor: Colors.grey.shade900,
            allowHalfRating: true,
            ignoreGestures: true,
            itemBuilder: (context, index) =>
                Icon(Icons.star, color: Color(0xff5CB441)),
            onRatingUpdate: (rating) {},
          ),
        ],
      ),
    );
  }

  Widget drowbtn() {
    return InkWell(
      onTap: () {
/*        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChooseTechnicalScreen(),
            ));*/
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal:10),
            height: 120,
            child: TextFormField(
              maxLines: 15,
              controller: complianController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(5)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(5)
                ),

                hintText: 'Enter Problem here...',
                hintStyle: TextStyle(color: Colors.grey),
              ),

              style: TextStyle(
                color:MyTheme(context).text_color,
                fontSize:20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            decoration: BoxDecoration(
                color: Color(0xff5CB441), borderRadius: BorderRadius.circular(40)),
            width: double.infinity,
            height: 50,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  'Make Request',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(color: Colors.white, letterSpacing: 0.5),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void choiceAction(String choice) {
    if (choice == Constants.rate_depend) {

    } else if (choice == Constants.loc_depend) {

    }
  }
}
class Constants {
  static const String rate_depend = 'ترتيب حسب التقييم';
  static const String loc_depend = 'ترتيب حسب الوقع';

  static const List<String> choices = <String>[
    rate_depend,
    loc_depend,
  ];
}



