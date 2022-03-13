
import 'package:repaire_for_me/models/location.dart';

class Technical{
  String id;
  String name;
  String phone;
  String email;
  String pass;
  String imagUrl;
  String numberOfOrders;
  String serviceName;
  List<String> rates;

  Location location= Location();

  Technical(
      {this.id = 'NULL',
        this.name= 'NULL',
        this.phone= 'NULL',
        this.email= 'NULL',
        this.pass= 'NULL',
        this.imagUrl= 'NULL',
        this.numberOfOrders= 'NULL',
        this.serviceName= 'NULL',
        this.rates,
        location,
      });

  Technical.fromJson(Map<String, dynamic> json) {
    json['id'] != null ? id = json['id'] : id = 'NULL';
    name = json['name'];
    phone = json['phone'];
    json['email'] != null ? email = json['email'] : email = 'NULL';
    pass = json['pass'];
    imagUrl = json['imagUrl'];
    numberOfOrders = json['numberOfOrders'];
    serviceName = json['serviceName'];
    json['rates']!=null? rates = json['rates'].cast<String>():rates =[];

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
    'numberOfOrders': numberOfOrders,
    'serviceName': serviceName,
    'rates':rates,
    'location': this.location.toJson()
  };
}