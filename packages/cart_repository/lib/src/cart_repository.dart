import 'package:cache/cache.dart';
import 'package:cart_repository/cart_repository.dart';

class CartRepository {
  CartRepository({
    CacheClient? cache,
  }) : _cache = cache ?? CacheClient();

  final CacheClient _cache;

  static const cartCacheKey = '__cart_cache_key__';

  Cart? readCart() {
    final cartRead = _cache.read<String>(key: cartCacheKey);
    return cartRead != null ? Cart.fromJson(cartRead) : null;
  }

  void writeCart({required Cart cart}) {
    _cache.write(key: cartCacheKey, value: cart.toJson());
  }
}
