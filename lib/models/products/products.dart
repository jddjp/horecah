// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'package:horecah/models/models.dart';
import 'package:horecah/models/multimedia.dart';
import 'package:horecah/models/products/ad_type.dart';
import 'package:horecah/models/products/category.dart';
import 'package:horecah/models/products/image_model.dart';
import 'package:horecah/models/products/sub_category.dart';
import 'package:horecah/models/subcategory.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
Products productsFromJsonFavorite(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.phoneNumber,
    required this.currency,
    required this.city,
    required this.adType,
     this.subCategory,
    required this.category,
    required this.peopleType,
    required this.statusProduct,
    this.user,
    this.slug,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.country,
    this.multimedia,
    this.likes
  });

  String title;
  String description;
  double price;
  int phoneNumber;
  dynamic slug;
  String currency;
  dynamic city;
  String adType;
  SubCategory? subCategory;
  String category;
  String peopleType;
  String statusProduct;
  dynamic country;
  UserStrapi? user;
  int? id;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? publishedAt;
  List<Multimedia>? multimedia;
  List<Likes>? likes;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"].toDouble(),
        phoneNumber: json["phone_number"] != null ? int.parse(json["phone_number"]) : 0,
        slug: json["slug"],
        status: json["status"],
        statusProduct: json["status_product"] ?? "",
        peopleType: json["people_type"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        publishedAt:  json["published_at"] == null ? false : true,
        currency: json["currency"],
        city: json["city"] ?? "",
        country: json["country"] ?? "",
        adType: json["ad_type"] ?? "",
        subCategory: SubCategory.fromMap(json["sub_category"]),
        category: json["category"] ?? "",
        user: json["user"] != null 
            ? UserStrapi.fromJsonUpdated(json["user"])
            : null,
        multimedia: json["multimedia"] != null
            ? List<Multimedia>.from(
                json["multimedia"].map((x) => Multimedia.fromJson(x)))
            : null,
        likes: json["likes"] != null
            ? List<Likes>.from(
                json["likes"].map((x) => Likes.fromJson(x)))
            : null,
      );

  factory Products.fromJsonForFavorite(Map<String, dynamic> json) => Products(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    price: json["price"].toDouble(),
    phoneNumber: 0,
    slug: json["slug"],
    status: json["status"],
    statusProduct: json["status_product"] ?? "",
    peopleType: json["people_type"] ?? "",
    publishedAt:  json["published_at"] == null ? false : true,
    currency: json["currency"],
    city: json["city"] ?? "",
    country: json["country"] ?? "",
    adType: json["ad_type"] ?? "",
    subCategory: SubCategory.fromMap(json["sub_category"]),
    category: json["category"] ?? "",
    user: json["user"] != null
        ? UserStrapi.fromJsonUpdated(json["user"])
        : null,
    multimedia: json["multimedia"] != null
        ? List<Multimedia>.from(
        json["multimedia"].map((x) => Multimedia.fromJson(x)))
        : null,
    likes: json["likes"] != null
        ? List<Likes>.from(
        json["likes"].map((x) => Likes.fromJson(x)))
        : null,
  );

  factory Products.fromJsonForChat(Map<String, dynamic> json) => Products(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    price: json["price"].toDouble(),
    phoneNumber: json["phone_number"] != null ? int.parse(json["phone_number"]) : 0,
    slug: json["slug"],
    status: json["status"],
    statusProduct: json["status_product"] ?? "",
    peopleType: json["people_type"] ?? "",
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    publishedAt:  json["published_at"] == null ? false : true,
    currency: json["currency"],
    city: json["city"] ?? "",
    country: json["country"] ?? "",
    adType: json["ad_type"] ?? "",
    //subCategory: SubCategory.fromMap(json["sub_category"]),
    category: json["category"] ?? "",
    user: json["user"] != null
        ? UserStrapi.fromJsonUpdated(json["user"])
        : null,
    multimedia: json["multimedia"] != null
        ? List<Multimedia>.from(
        json["multimedia"].map((x) => Multimedia.fromJson(x)))
        : null,
    likes: json["likes"] != null
        ? List<Likes>.from(
        json["likes"].map((x) => Likes.fromJson(x)))
        : null,
  );


//FOR UPDATE


 factory Products.fromJsonForUpdate(Map<String, dynamic> json) => Products(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"].toDouble(),
        phoneNumber: json["phone_number"] != null ? int.parse(json["phone_number"]) : 0,
        slug: json["slug"],
        status: json["status"],
        statusProduct: json["status_product"] ?? "",
        peopleType: json["people_type"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        publishedAt:  json["published_at"] == null ? false : true,
        currency: json["currency"],
        city: json["city"] ?? "",
        country: json["country"] ?? "",
        adType: json["ad_type"] ?? "",
        subCategory: SubCategory.fromMap(json["sub_category"]),
        category: json["category"] ?? "",
        multimedia: json["multimedia"] != null
            ? List<Multimedia>.from(
                json["multimedia"].map((x) => Multimedia.fromJson(x)))
            : null,
        likes: json["likes"] != null
            ? List<Likes>.from(
                json["likes"].map((x) => Likes.fromJson(x)))
            : null,
      );





























      

  Map<String, dynamic> toJson() => {
        "id":id,
        "title": title,
        "description": description,
        "sub_category": subCategory!.toMap(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "multimedia": multimedia,
        "price": price.toInt(),
        "phone_number": phoneNumber.toString(),
        "status_product": statusProduct,
        "status": status,
        "people_type": peopleType,
        "currency": currency,
        "city": city,
        "ad_type": adType,
        "category": category,
        "user": user != null ? user!.toJson() : null,
      };
  static List<Products> fromListJson(List<dynamic> listPost) {
    List<Products> posts = [];
    for (var item in listPost) {
      posts.add(Products.fromJson(item));
    }
    return posts;
  }
}