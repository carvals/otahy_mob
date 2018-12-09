import 'package:flutter/material.dart';



class HomeCardModel {

String guid;
//potentially future class
String userCategory;
String userName;
String type;
//other properties
String name;
String rankingText;
double rankingDouble;
String shortDesc;
String avatarUrl;
String itemPicUrl;
String location;
double lat;
double lon;

//simple constructor
HomeCardModel(this.guid, this.userCategory, this.userName, this.type, 
    this.name, this.rankingDouble, this.shortDesc, this.avatarUrl,
    this.itemPicUrl, this.rankingText, this.location, this.lat, this.lon);

//from map
HomeCardModel.fromMap(Map<String, dynamic> map){
    this.avatarUrl = map['avatarUrl'];
    this.guid = map['guid'];
    this.itemPicUrl = map['itemPicUrl'];
    this.name = map['name'];
    this.rankingDouble = map['rankingDouble'];
    this.rankingText = map['rankingText'];
    this.shortDesc = map['shortDesc'];
    this.type = map['type'];
    this.userCategory = map['userCategory'];
    this.userName = map['userName'];
    this.location = map['location'];
    this.lat = map['lat'];
    this.lon = map['lon'];
}

//return map
Map<String, dynamic>toMap(){
  var map = new Map<String, dynamic>();
    map['avatarUrl'] = avatarUrl;
      map['guid'] = guid;
      map['itemPicUrl'] = itemPicUrl;
      map['name'] = name;
      map['rankingDouble'] = rankingDouble;
      map['rankingText'] = rankingText;
      map['shortDesc'] = shortDesc;
      map['type'] = type;
      map['userCategory'] = userCategory;
      map['userName'] = userName;
      map['location'] = location;
      map['lat'] = lat;
      map['lon'] = lon;

      return map;
}


  
}