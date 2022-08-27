import 'package:flutter/material.dart';

class TypeHead {
  num? status;
  String? msg;
  Results? results;
  TypeHead({this.status, this.msg, this.results});

  TypeHead.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
  }
}

class Results {
  List<Data>? data;
// paging,
  RestuarantAvailability? restaurant_availability_options;
  OpenHours? open_hours_options;

  Results.fromJson(Map<String, dynamic> json) {
    // data
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((element) {
        data!.add(Data.fromJson(element));
      });
    }
    // // restaurant availability
    restaurant_availability_options =
        json['restaurant_availability_options'] != null
            ? RestuarantAvailability.fromJson(
                json['restaurant_availability_options'])
            : null;

    // // open hours
    open_hours_options = json['open_hours_options'] != null
        ? OpenHours.fromJson(json['open_hours_options'])
        : null;
  }
}

class Data {
  String? location_id;
  String? name;
  String? latitude;
  String? longitude;
  String? photo;

  Data(
      {this.latitude, this.location_id, this.longitude, this.name, this.photo});

  Data.fromJson(Map<String, dynamic> json) {
    location_id = json['location_id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    photo = json['photo']?['images']?['small']?['url'] != null
        ? json['photo']['images']['small']['url']
        : null;
  }
}

class RestuarantAvailability {
  String? day;
  String? month;
  // TimeOptions? time_options;
  // PeopleOptions? people_options;

  RestuarantAvailability({this.day, this.month});

  RestuarantAvailability.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    month = json['month'];
  }
}

class TimeOptions {}

class PeopleOptions {}

class OpenHours {
  String? closed_count;
  bool? is_set;
  OpenHours({this.closed_count, this.is_set});

  OpenHours.fromJson(Map<String, dynamic> json) {
    closed_count = json['closed_count'];
    is_set = json['is_set'];
  }
}

class Detail {
  num? status;
  String? msg;
  Results2? results;
  Detail({this.status, this.msg, this.results});

  Detail.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    results =
        (json['results'] != null ? Results2.fromJson(json['results']) : null);
  }
}

class Results2 {
  List<Data2>? data;
// paging,
  RestuarantAvailability? restaurant_availability_options;
  OpenHours? open_hours_options;

  Results2.fromJson(Map<String, dynamic> json) {
    // data
    if (json['data'] != null) {
      data = <Data2>[];
      json['data'].forEach((element) {
        data!.add(Data2.fromJson(element));
      });
    }
    // // restaurant availability
    restaurant_availability_options =
        json['restaurant_availability_options'] != null
            ? RestuarantAvailability.fromJson(
                json['restaurant_availability_options'])
            : null;

    // // open hours
    open_hours_options = json['open_hours_options'] != null
        ? OpenHours.fromJson(json['open_hours_options'])
        : null;
  }
}

class Data2 {
  String? location_id;
  //String? name;
  //String? latitude;
  //String? longitude;
  //String? photo;
  String? description;
  Data2(
      {
      //this.latitude
     this.location_id,
      // , this.longitude,
      //this.name
      //, this.photo
      this.description});

  Data2.fromJson(Map<String, dynamic> json) {
    location_id = json['location_id'];
    // name = json['name'];
    // latitude = json['latitude'];
    // longitude = json['longitude'];
    // photo = json['photo']?['images']?['small']?['url'] != null
    //     ? json['photo']['images']['small']['url']
    //     : null;
    description = json['description'];
  }
}

class Review {
  num? status;
  String? msg;
  Results3? results;
  Review({this.status, this.msg, this.results});

  Review.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    results =
        (json['results'] != null ? Results3.fromJson(json['results']) : null);
  }
}
class Results3 {
  List<Data3>? data;
// paging,
  RestuarantAvailability? restaurant_availability_options;
  OpenHours? open_hours_options;

  Results3.fromJson(Map<String, dynamic> json) {
    // data
    if (json['data'] != null) {
      data = <Data3>[];
      json['data'].forEach((element) {
        data!.add(Data3.fromJson(element));
      });
    }
    // // restaurant availability
    restaurant_availability_options =
        json['restaurant_availability_options'] != null
            ? RestuarantAvailability.fromJson(
                json['restaurant_availability_options'])
            : null;

    // // open hours
    open_hours_options = json['open_hours_options'] != null
        ? OpenHours.fromJson(json['open_hours_options'])
        : null;
  }
}
class Data3 {
  String? location_id;
  //String? name;
  //String? latitude;
  //String? longitude;
  //String? photo;
  String? text;
  Data3(
      {
      //this.latitude
     this.location_id,
      // , this.longitude,
      //this.name
      //, this.photo
      this.text});

  Data3.fromJson(Map<String, dynamic> json) {
    location_id = json['location_id'];
    // name = json['name'];
    // latitude = json['latitude'];
    // longitude = json['longitude'];
    // photo = json['photo']?['images']?['small']?['url'] != null
    //     ? json['photo']['images']['small']['url']
    //     : null;
    text = json['text'];
  }
}