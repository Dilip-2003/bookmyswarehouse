// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WareHouseModel {
  final String title;
  final String location;
  final int area;
  final int rent;
  final int rating;
  final int numberOfReviews;
  final String front;
  final String id;
  WareHouseModel({
    required this.title,
    required this.location,
    required this.area,
    required this.rent,
    required this.rating,
    required this.numberOfReviews,
    required this.front,
    required this.id,
  });

  WareHouseModel copyWith({
    String? title,
    String? location,
    int? area,
    int? rent,
    int? rating,
    int? numberOfReviews,
    String? front,
    String? id,
  }) {
    return WareHouseModel(
      title: title ?? this.title,
      location: location ?? this.location,
      area: area ?? this.area,
      rent: rent ?? this.rent,
      rating: rating ?? this.rating,
      numberOfReviews: numberOfReviews ?? this.numberOfReviews,
      front: front ?? this.front,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'location': location,
      'area': area,
      'rent': rent,
      'rating': rating,
      'numberOfReviews': numberOfReviews,
      'front': front,
      'id': id,
    };
  }

  factory WareHouseModel.fromMap(Map<String, dynamic> map) {
    return WareHouseModel(
      title: map['title'] as String,
      location: map['location'] as String,
      area: map['area'] as int,
      rent: map['rent'] as int,
      rating: map['rating'] as int,
      numberOfReviews: map['numberOfReviews'] as int,
      front: map['front'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WareHouseModel.fromJson(String source) =>
      WareHouseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WareHouseModel(title: $title, location: $location, area: $area, rent: $rent, rating: $rating, numberOfReviews: $numberOfReviews, front: $front, id: $id)';
  }

  @override
  bool operator ==(covariant WareHouseModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.location == location &&
        other.area == area &&
        other.rent == rent &&
        other.rating == rating &&
        other.numberOfReviews == numberOfReviews &&
        other.front == front &&
        other.id == id;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        location.hashCode ^
        area.hashCode ^
        rent.hashCode ^
        rating.hashCode ^
        numberOfReviews.hashCode ^
        front.hashCode ^
        id.hashCode;
  }
}
