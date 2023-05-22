import 'package:cache/cache.dart';
import 'package:cart_repository/cart_repository.dart';

class CartRepository {
  CartRepository({
    CacheClient? cache,
  }) : _cache = cache ?? CacheClient();

  final CacheClient _cache;

  static const cartCacheKey = '__cart_cache_key__';

  Cart readCart() {
    return _cache.read<Cart>(key: cartCacheKey) ?? Cart.empty;
  }

  void writeCart({required Cart cart}) {
    _cache.write(key: cartCacheKey, value: cart);
  }
}
