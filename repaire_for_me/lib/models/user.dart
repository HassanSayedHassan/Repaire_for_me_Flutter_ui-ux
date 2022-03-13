import 'package:flutter/cupertino.dart';
import 'package:repaire_for_me/models/location.dart';

class CurrentUser {
  String id;
  String name;
  String phone;
  String email;
  String pass;
  String imagUrl;
  Location location= Location();

  CurrentUser(
      {this.id = 'NULL',
      this.name= 'NULL',
      this.phone= 'NULL',
      this.email= 'NULL',
      this.pass= 'NULL',
      this.imagUrl= 'NULL',
        location,
      });

  CurrentUser.fromJson(Map<String, dynamic> json) {
    json['id'] != null ? id = json['id'] : id = 'NULL';
    name = json['name'];
    phone = json['phone'];
    json['email'] != null ? email = json['email'] : email = 'NULL';
    pass = json['pass'];
    imagUrl = json['imagUrl'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'email': email,
        'pass': pass,
        'imagUrl': imagUrl,
        'location': this.location.toJson()
      };
}
