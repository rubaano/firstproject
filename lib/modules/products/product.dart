
import 'package:flutter/material.dart';
class product extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container();
    /*Container(
      height: 380,
      width: double.infinity,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.only(topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),

        ),
        color: Colors.white38,
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 280,
            width: double.infinity,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),

              ),
              color: Colors.white38,
              image: new DecorationImage(image: AssetImage(
                  'images/counselor.jpg'), fit: BoxFit.cover,),
            ),
            //  Image(image: AssetImage('images/counselor.jpg'),
            //  fit: BoxFit.contain,height: 100,width: double.maxFinite,

            //      ),


          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Column(
                children: [
                  Text('Counselor NYX', style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                  Text('price:10\$', style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w400),
                  ),

                ],
              ),
              SizedBox(width: 20,),

              Container(

                //   width: double.infinity,

                // height: 60,

                color: Colors.deepPurpleAccent,

                child: MaterialButton(onPressed: () {
                  // var result=weight / pow(height/ 100,2);
                  //print(result.round());
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                        product(


                        ),
                    ),
                  );
                },

                  child: Text(
                    'Order', style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                  ),
                ),

              )


            ],


          ),


        ],
      ),
    ),*/
  }
}
