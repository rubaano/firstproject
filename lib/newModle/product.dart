import 'package:cloud_firestore/cloud_firestore.dart';

import 'discount.dart';

class Product {
  final String id;
  final String name;
  final String type;
  final int price;
  final String imageURL;
  final String userID;
  final int count;
  final Timestamp expirationDate;
  final List<Discount> discount;

  Product(this.id,
      {required this.name,
        required this.imageURL,
      required this.type,
      required this.price,
      required this.userID,
      required this.count,
      required this.expirationDate,
      required this.discount}) {
    if (discount.length > 3) {
      throw 'you cant enter discount bigger than 3 ';
    }
  }

  Map<String, dynamic> toJSON() {
    return {
      'name': this.name,
      'discount': this.discount,
      'price': this.price,
      'count': this.count,
      'expirationDate': this.expirationDate,
      'type': this.type,
      'userID': this.userID,
    };
  }

  factory Product.fromJSON(Map<String, dynamic> data,String id,List<Discount> d) {
    print('i am in from json $d');
    return Product(id,
        name: data['name'],
        imageURL: data['imageURL'],
        type: data['type'],
        price: data['price'],
        userID: data['userID'],
        count: data['count'],
        expirationDate: data['expiration date'],
    discount:d);
  }

  bool isExpiration(){
    return expirationDate.compareTo(Timestamp.now())<0;
  }

  // int offerValue(){
  //    for (var element in discount) {
  //     Timestamp.now().toDate().day==expirationDate.toDate().day-element.duration;
  //   }
  //
  // }
}
