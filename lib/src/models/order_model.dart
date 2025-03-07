import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  String id;

  String status;
  String qrCodeImage;
  double total;

  @JsonKey(name: 'createAt')
  DateTime? createdDateTime;

  @JsonKey(name: 'due')
  DateTime overdueDateTime;

  @JsonKey(name: 'copiaecola')
  String copyAndPaste;

  @JsonKey(defaultValue: [])
  List<CartItemModel> items;

  bool get isOverDue => overdueDateTime.isBefore(DateTime.now());

  OrderModel({
    required this.id,
    required this.createdDateTime,
    required this.overdueDateTime,
    required this.status,
    required this.copyAndPaste,
    required this.total,
    required this.items,
    required this.qrCodeImage,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  @override
  String toString() {
    return 'OrderModel(id: $id, createdDataTiem: $createdDateTime, overdueDateTime: $overdueDateTime, status: $status, copyAndPaste: $copyAndPaste, total: $total, items: $items, qrCodeImage: $qrCodeImage)';
  }
}
