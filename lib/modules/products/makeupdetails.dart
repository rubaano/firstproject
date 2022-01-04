
import 'package:firstproject/newModle/product.dart';
import 'package:flutter/material.dart';

class makeupdetails extends StatelessWidget {
  final Product product;

  makeupdetails({required this.product});

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
        child: Expanded(
          child: Container(
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
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius:const BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
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
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 20,
                ),

                /*  Text('Councelor NYC  for all skin concerns',style: TextStyle(fontSize:20,fontWeight: FontWeight.w400,backgroundColor: Colors.deepPurpleAccent,color: Colors.white),),
        SizedBox(height: 20,),
        Text('Type:counselor original',style: TextStyle(fontSize:20,fontWeight: FontWeight.w400,backgroundColor: Colors.deepPurpleAccent,color: Colors.white),),
        SizedBox(height: 20,),
        Text('expiry date:02/02/2022',style: TextStyle(fontSize:20,fontWeight: FontWeight.w400,backgroundColor: Colors.deepPurpleAccent,color: Colors.white),),
        SizedBox(height: 20,),
        Text('Location:syria',style: TextStyle(fontSize:20,fontWeight: FontWeight.w400,backgroundColor: Colors.deepPurpleAccent,color: Colors.white),),
        SizedBox(height: 20,),
      Text('contact us',style: TextStyle(fontSize:20,fontWeight: FontWeight.w400,backgroundColor: Colors.deepPurpleAccent,color: Colors.white),),
*/
                Text(
                  product.name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      backgroundColor: Colors.deepPurpleAccent,
                      color: Colors.white),
                ),
                //TODO:remove id from this text
                Text(
                  product.id,
                  style:const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      backgroundColor: Colors.deepPurpleAccent,
                      color: Colors.white),
                ),
                Text(
                  product.count.toString(),
                  style:const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      backgroundColor: Colors.deepPurpleAccent,
                      color: Colors.white),
                ),
                Text(
                  product.type,
                  style:const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      backgroundColor: Colors.deepPurpleAccent,
                      color: Colors.white),
                ),
             /*   Text(
                  'contact us:09333858',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      backgroundColor: Colors.deepPurpleAccent,
                      color: Colors.white),
                ),*/
                // Container(
                //   width: double.infinity,
                //
                //   height: 60,
                //
                //   // color: Colors.deepPurpleAccent,
                //
                //   child: MaterialButton(
                //     onPressed: () {},
                //     child: Text(
                //       '${number}',
                //       style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.w400,
                //           color: Colors.white),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
