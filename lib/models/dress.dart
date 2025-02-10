import 'package:json_annotation/json_annotation.dart';

part 'dress.g.dart';

@JsonSerializable()
class Dress {
  String? title;
  String? image;
  String? body;
  num? countInStock;
  @JsonKey(defaultValue: false)
  final bool favourite;
  String? price;

  Dress(this.body, this.countInStock, this.image, this.title, this.price,
      this.favourite);

  factory Dress.fromJson(Map<String, dynamic> json) => _$DressFromJson(json);

  Map<String, dynamic> toJson() => _$DressToJson(this);
}
