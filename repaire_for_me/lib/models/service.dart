
class Service{
  String id;
  String name;
  String desc;
  String numberOfUsage;
  List<String> rates;
  List<String> imgUrls;

  Service({this.id='NULL', this.name='NULL', this.desc='NULL', this.numberOfUsage='0', this.rates,
    this.imgUrls});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    numberOfUsage = json['numberOfUsage'];
    json['rates']!=null? rates = json['rates'].cast<String>():rates =[];
    json['imgUrls']!=null? imgUrls = json['imgUrls'].cast<String>(): imgUrls =[];

  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['numberOfUsage'] = this.numberOfUsage;
    data['rates'] = this.rates;
    data['imgUrls'] = this.imgUrls;
    return data;
  }
}

