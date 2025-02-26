import 'package:greengrocer/src/models/cart_item_model.dart';

class OrderModel {
  String id;
  DateTime createdDateTime;
  DateTime overdueDateTime;
  String status;
  String copyAndPaste;
  double total;
  List<CartItemModel> items;

  OrderModel({
    required this.id,
    required this.createdDateTime,
    required this.overdueDateTime,
    required this.status,
    required this.copyAndPaste,
    required this.total,
    required this.items,
  });
}
