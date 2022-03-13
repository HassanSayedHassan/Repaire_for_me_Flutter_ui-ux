
import 'package:flutter/cupertino.dart';
import 'package:repaire_for_me/models/user.dart';

class UserProvider with ChangeNotifier{
  CurrentUser currentUser=CurrentUser(
    name:'NULL',
    pass: 'NULL',
    imagUrl: 'NULL',
    email: 'NULL',
    id: 'NULL',
    phone: 'NULL',
  );

  CurrentUser get get_current_user{
    return currentUser;
  }

  void update_current_user(CurrentUser newUser){
    currentUser.name=newUser.name;
    currentUser.email=newUser.email;
    currentUser.id=newUser.id;
    currentUser.phone=newUser.phone;
    currentUser.imagUrl=newUser.imagUrl;
    currentUser.location.latitude=newUser.location.latitude;
    currentUser.location.longitude=newUser.location.longitude;
    notifyListeners();
  }
}