import 'package:firstpro/modules/products/makeupdetails.dart';
import 'package:firstpro/modules/products/product.dart';
import 'package:firstpro/newModle/product.dart';
import 'package:firstpro/server/product_server.dart';
import 'package:firstpro/shared/components/product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class usermodel {
  final String imagename;
  final String name;
  final String price;
  final String descripition;
  final String number;

  usermodel({
    required this.imagename,
    required this.name,
    required this.price,
    required this.descripition,
    required this.number,
  });
}

class makeupproducts extends StatefulWidget {
  final List<Product > products;
  makeupproducts(this.products);
  @override
  State<makeupproducts> createState() => _makeupproductsState();
}

class _makeupproductsState extends State<makeupproducts> {

  bool _loading=false;
  final ProductServer _server=ProductServer();
  // void _loadProduct()async{
  //   setState(() {
  //     _loading=true;
  //   });
  //   products = await _server.getAllProduct()??[];
  //   setState(() {
  //     _loading=false;
  //   });
  // }
  @override
  void initState() {
    super.initState();
    // _loadProduct();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:const Text(
          'shopping now',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.deepPurpleAccent,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              decoration:const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: Colors.white38,
              ),
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(
                    width: 15,
                  ),
                  Text('search'),
                ],
              ),
            ),
           const SizedBox(
              height: 15,
            ),
           const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics:const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildUserIteam(widget.products[index], context),
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.white38,
                  ),
                ),
                itemCount:widget.products.length,
              ),
            ),
          ],
        ),
      ),
    );
  }


}
