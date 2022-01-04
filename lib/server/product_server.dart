import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstpro/newModle/discount.dart';
import 'package:firstpro/newModle/product.dart';
import 'package:firstpro/newModle/type.dart';

class ProductServer {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference _productCollection =
      _firestore.collection('product');
  late final CollectionReference _typeCOllection =
      _firestore.collection('type');

  Future<List<Product>?> getAllProduct() {
    print('i am in get all product');
    print(_productCollection.path);
    return _productCollection.get().then((value) async {
      List<Product> products = [];

      // print('the value is $value');
      for (var element in value.docs) {
        print(element.data.call());
        if (element.data != null) {
          List<Discount> d = [];
          await _firestore
              .collection('product/${element.id}/discount')
              .get()
              .then((value) {
            print(value);
            for (var element in value.docs) {
              print(element.data());
              d.add(Discount(
                  duration: element.data()['duration'] ?? 0,
                  offerValue: element.data()['offerValue'] ?? 0  ));
            }
          });
          products.add(Product.fromJSON(
              element.data() as Map<String, dynamic>, element.id, d));
        }
      }
      return products;
    });
  }

  Future<Query<Object?>> getProductByName(String name) async {
    return _productCollection.where('name', isEqualTo: name);
  }

  Future<bool> addProduct(Product product) {
    return _productCollection
        .add(product.toJSON())
        .then((value) => true)
        .catchError((e) => false);
  }

  Future<bool> deleteProduct(String productID) {
    return _productCollection
        .doc(productID)
        .delete()
        .then((value) => true)
        .catchError((e) => false);
  }

  Future<bool> editProduct(Product product) {
    return _productCollection
        .doc(product.id)
        .update(product.toJSON())
        .then((value) => true)
        .catchError((e) => false);
  }

  Future<List<MyType>?> getAllType() {
    return _typeCOllection.get().then((value) {
      List<MyType> types = [];
      value.docs.forEach((element) {
        types.add(MyType.fromJSON(element.data() as Map<String, dynamic>));
      });
      return types;
    });
  }

  Future<List<Map<String, dynamic>>?> getProductByType() async {
    List<MyType>? types = await getAllType();
    List<Product>? products = await getAllProduct();
    List<Map<String, dynamic>> result = [];
    types?.forEach((typeName) {
      result.add({
        'name': typeName.name,
        'products': products
            ?.where((product) => product.type == typeName.name)
            .toList(),
        'imageURL': typeName.imageURL
      });
    });
    return result;
  }
}
