

import 'package:flutter/material.dart';
import 'package:repaire_for_me/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import 'my_themes.dart';

class HelpFun{

 void showLoading(context) {
   showDialog(
     context: context,
     barrierDismissible: false,
     builder: (BuildContext context) {
       return Dialog(
         child: Container(
           padding: const EdgeInsets.all(15.0),
           color: Colors.transparent,
           child: new Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             mainAxisSize: MainAxisSize.min,
             children: [
               new CircularProgressIndicator(
                 strokeWidth: 5,
                 backgroundColor: MyTheme(context).app_color1,
               ),
               new Text("Loading..."),
             ],
           ),
         ),
       );
     },
   );
 }

 void  closeLoading(context) {

 Navigator.pop(context); //pop dialog

 }

 void showToast(context,mess){
   Toast.show(mess, context, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER,backgroundColor: Colors.red);
 }

 Future<void> saveSharedReferences(CurrentUser user) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setString('id', user.id??'NULL');
   await prefs.setString('name', user.name??'NULL');
   await prefs.setString('imagUrl', user.imagUrl??'NULL');
   await prefs.setString('phone', user.phone??'NULL');
 //  await prefs.setDouble('latitude', user.latitude??0.0);
//   await prefs.setDouble('longitude', user.longitude??0.0);

 }
 Future<CurrentUser> getSharedReferences() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   CurrentUser user=CurrentUser();
   user.id= prefs.getString('id')??'NULL';
    user.name= prefs.getString('name')??'NULL';
   user.imagUrl= prefs.getString('imagUrl' )??'NULL';
   user.phone= prefs.getString('phone')??'NULL';
//   user.latitude= prefs.getDouble('latitude')??0.0;
//   user.longitude=  prefs.getDouble('longitude')??0.0;

  return user;
 }
 Future<void> removeSharedReferences() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setString('id', 'NULL');
   await prefs.setString('name', 'NULL');
   await prefs.setString('imagUrl', 'NULL');
   await prefs.setString('phone', 'NULL');
 //  await prefs.setDouble('latitude', 0.0);
 //  await prefs.setDouble('longitude', 0.0);
 }

}
