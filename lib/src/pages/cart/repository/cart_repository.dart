import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/pages/cart/cart_result/cart_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class CartRepository {
  final _httpManager = HttpManager();
  Future<CartResult<List<CartItemModel>>> getCartItems({
    required String token,
    required String userId,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getCartItems,
      method: HttpMethods.post,
      headers: {
        'x-Parse-Session-Token': token,
      },
      body: {
        'user': userId,
      },
    );
    if (result['result'] != null) {
      //Tratar
      List<CartItemModel> data =
          List<Map<String, dynamic>>.from(result['result'])
              .map(CartItemModel.fromJson)
              .toList();
      return CartResult<List<CartItemModel>>.success(data);
    } else {
      //Retornar uma mensagem

      return CartResult.error(
          'Ocorreu um erro ao recuperar os itens do carrinho');
    }
  }

  Future checkoutCart({
    required String token,
    required double total,
  }) async {
    final result = await _httpManager
        .restRequest(url: Endpoints.checkout, method: HttpMethods.post, body: {
      'total': total,
    }, headers: {
      'x-Parse-Session-Token': token,
    });

    if (result['result'] != null) {
      final order = OrderModel.fromJson(result['result']);
      return CartResult<OrderModel>.success(order);
    } else {
      return CartResult.error('Não foi possivel realizar o pedido');
    }
  }

  Future<bool> changeItemQuantity({
    required String token,
    required String cartItemId,
    required int quantity,
  }) async {
    final result = await _httpManager.restRequest(
        url: Endpoints.changeItemQuantity,
        method: HttpMethods.post,
        body: {
          'cartItem': cartItemId,
          'quantity': quantity,
        },
        headers: {
          'x-Parse-Session-Token': token,
        });
    return result.isEmpty;
  }

  Future<CartResult<String>> addItemToCart({
    required String userId,
    required String token,
    required String productId,
    required int quantity,
  }) async {
    final result = await _httpManager.restRequest(
        url: Endpoints.addItemToCart,
        method: HttpMethods.post,
        body: {
          'user': userId,
          'quantity': quantity,
          'productId': productId,
        },
        headers: {
          'X-Parse-Session-Token': token,
        });

    if (result['result'] != null) {
      //Adicionar o produto no carrinho
      return CartResult<String>.success(result['result']['id']);
    } else {
      //Erro
      return CartResult.error('Não foi possivel adicionar o item no carrinho!');
    }
  }
}
