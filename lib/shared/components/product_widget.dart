

import 'package:firstproject/modules/products/makeupdetails.dart';
import 'package:firstproject/newModle/product.dart';
import 'package:flutter/material.dart';
Widget buildUserIteam(Product product, context) => Padding(
  padding: const EdgeInsets.all(10.0),
  child: Container(
    height: 280,
    width: double.infinity,
    decoration:const BoxDecoration(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(50),
        topLeft: Radius.circular(50),
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      color: Colors.white38,
    ),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius:const BorderRadius.only(
              topRight: Radius.circular(50),
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            color: Colors.white38,
            image:  DecorationImage(
              image: NetworkImage(product.imageURL),
              fit: BoxFit.cover,
            ),
          ),
          //  Image(image: AssetImage('images/counselor.jpg'),
          //  fit: BoxFit.contain,height: 100,width: double.maxFinite,

          //      ),
        ),
        const  SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    product.name,
                    style:const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
                const  SizedBox(
                  height: 10,
                ),
                Text(
                  product.price.toString(),
                  style:const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              //   width: double.infinity,

              // height: 60,

              color: Colors.deepPurpleAccent,

              child: MaterialButton(
                onPressed: () {
                  // var result=weight / pow(height/ 100,2);
                  //print(result.round());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => makeupdetails(
                        product: product,
                      ),
                    ),
                  );
                },
                child:const Text(
                  'Order',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            )
          ],
        ),
      ],
    ),
  ),
);