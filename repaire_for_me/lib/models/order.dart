import 'package:repaire_for_me/models/technical.dart';
import 'package:repaire_for_me/models/user.dart';

class Order {
  String id;
  String code;
  String serviceName;
  String status;
  String data;
  String price;
  String serviceRate;
  String techRate;
  String anyComment;
  CurrentUser sender = CurrentUser();
  Technical receiver = Technical();

  Order(
      {this.id = 'NULL',
      this.code = 'NULL',
        this.serviceName = 'NULL',
      this.status = 'NULL',
      this.data = 'NULL',
      this.price = 'NULL',
      this.serviceRate = 'NULL',
      this.techRate = 'NULL',
      this.anyComment = 'NULL',
      sender,
      receiver});

  Order.fromJson(Map<String, dynamic> json) {
    json['id'] != null ? id = json['id'] : id = 'NULL';
    code = json['code'];
    serviceName = json['serviceName'];
    status = json['status'];
    data = json['data'];
    price = json['price'];
    serviceRate = json['serviceRate'];
    techRate = json['techRate'];
    anyComment = json['anyComment'];
    sender = json['sender'] != null
        ? new CurrentUser.fromJson(json['sender'])
        : null;
    receiver = json['receiver'] != null
        ? new Technical.fromJson(json['receiver'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['serviceName'] = this.serviceName;
    data['status'] = this.status;
    data['data'] = this.data;
    data['price'] = this.price;
    data['serviceRate'] = this.serviceRate;
    data['techRate'] = this.techRate;
    data['anyComment'] = this.anyComment;
    data['sender'] = this.sender.toJson();
    data['receiver'] = this.receiver.toJson();
    return data;
  }
}
