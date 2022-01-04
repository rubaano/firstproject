import 'package:flutter/material.dart';

class canneddetails extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('shopping now',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.tealAccent,fontStyle: FontStyle.italic),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),



        child:  Expanded(

          child: Container(

            width: double.infinity,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.only( topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),

              ),
              color: Colors.tealAccent,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.only( topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),

                    ),
                    color: Colors.white38,image: new DecorationImage(image: AssetImage('images/canced1.bmp'),fit:BoxFit.cover,),
                  ),
                  //  Image(image: AssetImage('images/counselor.jpg'),
                  //  fit: BoxFit.contain,height: 100,width: double.maxFinite,

                  //      ),


                ),



                SizedBox(width: 20,),
                SizedBox(height: 20,),

                Text('Canned food',style: TextStyle(fontSize:20,fontWeight: FontWeight.w400,backgroundColor: Colors.teal,color: Colors.white),),
                SizedBox(height: 20,),
                Text('Type:original',style: TextStyle(fontSize:20,fontWeight: FontWeight.w400,backgroundColor: Colors.teal,color: Colors.white),),
                SizedBox(height: 20,),
                Text('expiry date:02/02/2022',style: TextStyle(fontSize:20,fontWeight: FontWeight.w400,backgroundColor: Colors.teal,color: Colors.white),),
                SizedBox(height: 20,),
                Text('Location:syria',style: TextStyle(fontSize:20,fontWeight: FontWeight.w400,backgroundColor: Colors.teal,color: Colors.white),),
                SizedBox(height: 20,),
                Text('contact us',style: TextStyle(fontSize:20,fontWeight: FontWeight.w400,backgroundColor: Colors.teal,color: Colors.white),),

                Container(

                  width: double.infinity,

                  height: 60,

                  // color: Colors.deepPurpleAccent,

                  child: MaterialButton(onPressed: (){},
                    child:   Text('0968817535',style: TextStyle(fontSize:20,fontWeight: FontWeight.w400,color: Colors.white),),

                  ),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),

                  ),

                ),





              ],
            ),
          ),
        ),




      ),
    );

  }
}
