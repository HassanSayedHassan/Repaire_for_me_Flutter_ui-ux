import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repaire_for_me/helpers/my_themes.dart';

import 'choose_technical_screen.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<String> myImgUrls = [];

  @override
  void initState() {
    myImgUrls.add(
        "https://www.gstatic.com/mobilesdk/160503_mobilesdk/logo/2x/firebase_28dp.png");
    myImgUrls.add(
        "https://www.gstatic.com/mobilesdk/160503_mobilesdk/logo/2x/firebase_28dp.png");
    myImgUrls.add(
        "https://www.gstatic.com/mobilesdk/160503_mobilesdk/logo/2x/firebase_28dp.png");
    myImgUrls.add(
        "https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyTheme(context).background_color,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                drowImages(),
                SizedBox(
                  height: 30,
                ),
                drowServiceName(),
                drowRating(),
                drowDisc(),
              ],
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

  Widget drowImages() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.amber,
        shape: BoxShape.rectangle,

      ),
      child: Carousel(
        images: getImages(),
        autoplayDuration: Duration(hours: 0, minutes: 0, seconds: 3),
        dotSize: 4.0,
        autoplay: false,
        dotSpacing: 15.0,
        dotColor: Colors.lightGreenAccent,
        indicatorBgPadding: 5.0,
        dotBgColor: Colors.purple.withOpacity(0),
        borderRadius: true,
      ),
    );
  }

  Widget drowServiceName() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        'Electerricety',
        style: GoogleFonts.roboto(
          textStyle:
              TextStyle(color: MyTheme(context).text_color, letterSpacing: 0.5),
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
        ),
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
            initialRating: 2.5,
            direction: Axis.horizontal,
            itemCount: 5,
            itemSize: 32,
            unratedColor: Colors.white38,
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
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChooseTechnicalScreen(),
            ));
      },
      child: Container(
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
    );
  }

  Widget drowDisc() {

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'You stillontrone of the solutions could be to use the property withNavBar and toggle it according to the Platform.',
        style: GoogleFonts.roboto(
          textStyle: TextStyle(color: Colors.grey, letterSpacing: 0.5),
          fontSize: 18,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  List<NetworkImage> getImages(){
    List<NetworkImage> networkImage=[];
    myImgUrls.forEach((element) {
      networkImage.add(NetworkImage(element));
    });
    return networkImage;
  }
}

