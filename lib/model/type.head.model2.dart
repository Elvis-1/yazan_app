import 'package:flutter/material.dart';

class TypeHead2 {
  num? status;
  String? msg;
  Results? results;
  TypeHead2({this.status, this.msg, this.results});

  TypeHead2.fromJson(Map<String, dynamic> json) {
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
  // String? location_id;
  String? name;
  // String? latitude;
  // String? longitude;
  // Photo? photo;

  Data({
    //   this.latitude,
    //  this.location_id,
    // this.longitude,
    this.name,
    //this.photo
  });

  Data.fromJson(Map<String, dynamic> json) {
    // location_id = json['location_id'];
    name = json['name'];
    // latitude = json['latitude'];
    // longitude = json['longitude'];
    // photo = json['photo'] != null ? Photo.fromJson(json['json']) : null;
  }
}

class Photo {
  Images? images;
  bool? is_blessed;

  Photo({this.images, this.is_blessed});

  Photo.fromJson(Map<String, dynamic> json) {
    images = json['images'] != null ? Images.fromJson(json['image']) : null;
    is_blessed = json['is_blessed'];
  }
}

class Images {
  Small? small;
  Images({this.small});

  Images.fromJson(Map<String, dynamic> json) {
    small = json['small'] != null ? Small.fromJson(json['small']) : null;
  }
}

class Small {
  String? url;
  Small({this.url});
  Small.fromJson(Map<String, dynamic> json) {
    url = json['url'];
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
