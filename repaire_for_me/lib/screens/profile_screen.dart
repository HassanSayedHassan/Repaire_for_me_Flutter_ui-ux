import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repaire_for_me/helpers/help_fun.dart';
import 'package:repaire_for_me/helpers/my_themes.dart';
import 'package:repaire_for_me/models/location.dart';
import 'package:repaire_for_me/models/order.dart';
import 'package:repaire_for_me/models/service.dart';
import 'package:repaire_for_me/models/technical.dart';
import 'package:repaire_for_me/models/user.dart';
import 'package:repaire_for_me/services/firebase_api.dart';
import 'package:repaire_for_me/widgets/button.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: MyTheme(context).background_color,
            body: Stack(alignment: Alignment.center, children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 281.0,
                          height: 153.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                            image: DecorationImage(
                              image: MyTheme(context).app_logo,
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff528034)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    drowText('Ahmed Hassan', "assets/icons/name_icon.svg"),
                    drowText('E-mail', "assets/icons/email_icon.svg"),
                    drowText('011 4522 9131', "assets/icons/phone.svg"),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {
                              Order _order=Order();
                              _order.data=DateTime.now().toString();
                              _order.sender.name='hassan';
                              final doc = FirebaseFirestore.instance.collection('orders').doc();

                              _order.code=doc.id;
                              await doc.set(_order.toJson()).whenComplete(() {});


                              ///add  tech

                  /*            Technical tech=Technical();
                              final doc = FirebaseFirestore.instance.collection('technicals').doc();

                              tech.id=doc.id;
                              await doc.set(tech.toJson()).whenComplete(() {});*/

                              ///Get  Service

/*                              List<String> myImgUrls=[];
                              FirebaseFirestore.instance
                                  .collection('services')
                                  .get()
                                  .then((QuerySnapshot querySnapshot) {
                              querySnapshot.docs.forEach((doc) {
                                Service service = Service.fromJson(doc.data());
                              print(service.imgUrls.toString()??"NULL");
                              });
                              });*/
 ///Add Service
/*                              List<String> myImgUrls=[];
                              myImgUrls.add( "https://www.gstatic.com/mobilesdk/160503_mobilesdk/logo/2x/firebase_28dp.png");
                          //    myImgUrls.add( "https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg");
                              Service serv=Service(
                                name: 'Electricity',
                                desc: 'You stillontrone of the solutions could be to use the property withNavBar and toggle it according to the Platform.',
                                imgUrls: myImgUrls
                              );
                              final doc = FirebaseFirestore.instance.collection('services').doc("V29L9KwPdXPpVpXql6lo");

                              doc.update({"imgUrls": FieldValue.arrayUnion(myImgUrls)});


                            serv.id=doc.id;
                              await doc.set(serv.toJson()).whenComplete(() {});*/

 ///get All Users
/*                              FirebaseFirestore.instance
                                  .collection('users')
                                  .get()
                                  .then((QuerySnapshot querySnapshot) {
                                querySnapshot.docs.forEach((doc) {
                                  CurrentUser _user = CurrentUser.fromJson(doc.data());
                                  print(_user.email??"NULL");
                            });*/

                              //       await docTodo.set(_user.toJson());
                            },
                            child: Container(
                              width: 150,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.0),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xff707070)),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: SvgPicture.asset(
                                        "assets/icons/planet.svg",
                                        color: MyTheme(context).text_color,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Language',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color:
                                                  MyTheme(context).text_color,
                                              letterSpacing: 0.5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              if (Theme.of(context).brightness !=
                                  Brightness.dark) {
                                EasyDynamicTheme.of(context).changeTheme();
                                EasyDynamicTheme.of(context).changeTheme();
                              } else {
                                EasyDynamicTheme.of(context).changeTheme();
                              }
                            },
                            child: Container(
                              width: 150,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.0),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xff707070)),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: SvgPicture.asset(
                                        "assets/icons/moon.svg",
                                        color: MyTheme(context).text_color,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Theme',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color:
                                                  MyTheme(context).text_color,
                                              letterSpacing: 0.5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
/*                    MyButton('LogOut', () async {
                //      await FireBaseApi().log_out();
                      await HelpFun().removeSharedReferences();
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (c) {
                        return new LoginScreen();
                      }), (route) => false);
                    })*/
                  ],
                ),
              ),
              Positioned(
                top: 140,
                child: Stack(alignment: Alignment.center, children: [
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: const Color(0xFF03144c),
                    child: CircleAvatar(
                      radius: 65,
                      backgroundImage:
                          AssetImage('assets/images/user_photo.png'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade50,
                      child: IconButton(
                          icon: Icon(
                            Icons.add_a_photo,
                            color: const Color(0xFF03144c),
                          ),
                          onPressed: () {}),
                    ),
                  ),
                ]),
              ),
            ])));
  }

  Widget drowText(text, icon_path) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(width: 2.0, color: const Color(0xff518f82)),
      ),
      height: 55,
      child: Row(
        children: [
          SvgPicture.asset(
            icon_path,
            color: MyTheme(context).text_color,
          ),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.elMessiri(
                textStyle: TextStyle(
                    color: MyTheme(context).text_color, letterSpacing: 0.5),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
