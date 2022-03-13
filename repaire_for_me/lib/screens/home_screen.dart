import 'package:carousel_pro/carousel_pro.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:repaire_for_me/helpers/help_fun.dart';
import 'package:repaire_for_me/helpers/my_themes.dart';
import 'package:repaire_for_me/models/user.dart';
import 'package:repaire_for_me/providers/user_id_provider.dart';
import 'package:repaire_for_me/screens/profile_screen.dart';
import 'package:repaire_for_me/services/firebase_api.dart';
import 'package:repaire_for_me/widgets/service_card.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: MyTheme(context).background_color,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
/*              Text(userProvider.currentUser.name),
              ElevatedButton(
                child: Text(
                  'Register Now ',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
                onPressed: () async {
                  FireBaseApi().log_out();
                  await HelpFun().removeSharedReferences();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
              ),*/
                userProvider.currentUser.imagUrl == 'NULL'
                    ? drowHeder("NULL")
                    : drowHeder(userProvider.currentUser.imagUrl),
                drowAdv(),
                drowTitle(),
                Container(
                  height: 400,
                  child: GridView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return ServiceCard();
                    },
                    padding: EdgeInsets.all(10),
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //mainAxisExtent: 150,
                      childAspectRatio: 0.90,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 4,
                      crossAxisCount: 2,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget drowHeder(imageURL) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          child: InkWell(
            onTap: () {
              pushNewScreen(
                context,
                screen: ProfileScreen(),
                withNavBar: false, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );



            },
            child: CircleAvatar(
              radius: 25,
              //  child: Image.asset("assets/images/user_photo.png"),
              backgroundImage: imageURL == 'NULL'
                  ? AssetImage("assets/images/user_photo.png")
                  : NetworkImage(imageURL),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            height: 60,
            child: TextFormField(
              textAlignVertical: TextAlignVertical.bottom,
              controller: searchController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: 'search...',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              style: TextStyle(
                color: MyTheme(context).text_color,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget drowAdv() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.amber,
        shape: BoxShape.rectangle,
      ),
      child: Carousel(
        images: [
          NetworkImage(
              'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg'),
          NetworkImage(
              'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
          NetworkImage(
              'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg')
        ],
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

  Widget drowTitle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        'All Services',
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

  Widget DrowCard() {
    return Column(
      children: [
        Container(
          height: 110,
          width: 110,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/Electerricety_1.png"),
            ),
          ),
        ),
        Text(
          'صيانة السباكة',
          style: GoogleFonts.elMessiri(
            textStyle: TextStyle(color: Colors.black, letterSpacing: 0.5),
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
      ],
    );
  }
}
