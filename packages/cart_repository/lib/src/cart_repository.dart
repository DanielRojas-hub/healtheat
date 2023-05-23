import 'package:cart_repository/cart_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository {
  CartRepository({
    Future<SharedPreferences>? prefs,
  }) : _prefs = prefs ?? SharedPreferences.getInstance();

  final Future<SharedPreferences> _prefs;

  static const cartCacheKey = '__cart_cache_key__';

  Future<Cart> getCart() async {
    final SharedPreferences prefs = await _prefs;
    final json = prefs.getString(cartCacheKey);
    return json != null ? Cart.fromJson(json) : Cart.empty;
  }

  Future<void> setCart({required Cart cart}) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(cartCacheKey, cart.toJson());
  }
}
