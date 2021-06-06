import 'package:sembast/sembast.dart';
import 'package:shop_app/data/app_database.dart';
import 'package:shop_app/data/models/Product.dart';

class ProductDao {
  static const String PRODUCT_TITLE = 'products';
  final _productStore = intMapStoreFactory.store(PRODUCT_TITLE);
  Future<Database> get _db async => await AppDatabase.instance.database;
  Future insert(Product product) async {
    await _productStore.add(await _db, product.toMap());
  }

  Future update(Product product) async {
    final finder = Finder(filter: Filter.byKey(product.id));
    await _productStore.update(await _db, product.toMap(), finder: finder);
  }

  Future<List<Product>> getAllSortedByName() async {
    final finder = Finder(sortOrders: [
      SortOrder('title'),
    ]);
    final recordSnapshots = await _productStore.find(await _db, finder: finder);
    return recordSnapshots.map((snapshot) {
      final product = Product.fromMap(snapshot.value);
      product.id = snapshot.key;
      return product;
    }).toList();
  }
}
