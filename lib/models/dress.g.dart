// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dress _$DressFromJson(Map<String, dynamic> json) => Dress(
      json['body'] as String?,
      json['countInStock'] as num?,
      json['image'] as String?,
      json['title'] as String?,
      json['price'] as String?,
      json['favourite'] as bool? ?? false,
    );

Map<String, dynamic> _$DressToJson(Dress instance) => <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'body': instance.body,
      'countInStock': instance.countInStock,
      'favourite': instance.favourite,
      'price': instance.price,
    };
