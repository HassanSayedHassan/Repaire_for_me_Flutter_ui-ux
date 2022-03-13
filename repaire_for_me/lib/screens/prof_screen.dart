import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:repaire_for_me/helpers/my_themes.dart';


class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // OUTPUT: en_US
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme(context).background_color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/planet.svg",
                    color: Colors.black,
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'language'.tr(),
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      color: const Color(0xff111749),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                context.locale = Locale('en');
                setState(() {
                  print(context.locale.toString());
                });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: const Color(0xffffffff),
                  border:
                      Border.all(width: 1.0, color: const Color(0xff707070)),
                ),
                child: Row(
                  children: [
                    context.locale.toString() == 'en'
                        ? SvgPicture.asset(
                            "assets/icons/Action.svg",
                            color: Colors.black,
                            width: 30,
                            height: 30,
                          )
                        : SizedBox(
                            width: 25,
                          ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'lang.name.en'.tr(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        color: const Color(0xff111749),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.locale = Locale('ar');
                setState(() {
                  print(context.locale.toString());
                });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: const Color(0xffffffff),
                  border:
                      Border.all(width: 1.0, color: const Color(0xff707070)),
                ),
                child: Row(
                  children: [
                    context.locale.toString() == 'en'
                        ? SizedBox(
                            width: 25,
                          )
                        : SvgPicture.asset(
                            "assets/icons/Action.svg",
                            color: Colors.black,
                            width: 30,
                            height: 30,
                          ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'lang.name.ar'.tr(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        color: const Color(0xff111749),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              child: Text(
                'Change Theme ',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
              onPressed: () {
                if (Theme.of(context).brightness != Brightness.dark) {
                  EasyDynamicTheme.of(context).changeTheme();
                  EasyDynamicTheme.of(context).changeTheme();
                } else {
                  EasyDynamicTheme.of(context).changeTheme();
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
            ),
            ElevatedButton(
              child: Text(
                'start ',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
              onPressed: () {
/*                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));*/
              },
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
