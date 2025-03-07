// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as String,
      createdDateTime: json['createAt'] == null
          ? null
          : DateTime.parse(json['createAt'] as String),
      overdueDateTime: DateTime.parse(json['due'] as String),
      status: json['status'] as String,
      copyAndPaste: json['copiaecola'] as String,
      total: (json['total'] as num).toDouble(),
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      qrCodeImage: json['qrCodeImage'] as String,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'qrCodeImage': instance.qrCodeImage,
      'total': instance.total,
      'createAt': instance.createdDateTime?.toIso8601String(),
      'due': instance.overdueDateTime.toIso8601String(),
      'copiaecola': instance.copyAndPaste,
      'items': instance.items,
    };
