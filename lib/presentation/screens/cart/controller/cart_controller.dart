import 'package:get/get.dart';

import '../../../../domain/models/cart/cart.dart';
import '../../../../domain/repository/repository.dart';

class CartController extends GetxController {

  final RxList<Cart> cart = RxList.empty();

  final Rx<RxStatus> _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;

  final Repository _repository;

  CartController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _getCart();
  }

  _getCart() async {
    _status.value = RxStatus.loading();
    try {
      // _repository.getCart().then((remoteCart) {
        _status.value = RxStatus.success();
      //   cart.value = remoteCart;
      // });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
      cart.value = [];
    }
  }

  void addToCart(Cart cart) {
    this.cart.add(cart);
  }

  void removeFromCart(Cart cart) {
    this.cart.remove(cart);
  }

  bool isInCart(Cart cart) {
    return this.cart.contains(cart);
  }
}