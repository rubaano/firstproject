
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'canceddetails.dart';
class usermodel{
  final String imagename;
  final String name;
  final String price;
  usermodel( {
    required this.imagename,
    required this.name,
    required this.price,
  });
}
class allcanedfood extends StatelessWidget {
  List<usermodel>users=[
    usermodel( imagename :'canced1.bmp',
        name: 'kernel corn',
        price: '10\$'
    ),
    usermodel( imagename: 'canned food.jpg',
      name: 'kernel corn',
      price: '20\$',
    ),
    usermodel( imagename: 'canned food.jpg',
      name: 'kernel corn',
      price: '20\$',
    ),


  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('shopping now',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.teal,fontStyle: FontStyle.italic),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child:   SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.only( topRight: Radius.circular(50),
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
                      width:15,
                    ),
                    Text('search'),
                  ],
                ),
              ),
              SizedBox(height: 15,),

              SizedBox(height: 15,),
              ListView.separated(shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index)=>buildUserIteam(users[index],context),
                separatorBuilder: (context,index)=>Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20,end: 20),
                  child: Container(width: double.infinity,height: 1,color: Colors.white38,),
                ), itemCount:users.length,),

            ],



          ),
        ),
      ),
    );
  }
  Widget buildUserIteam(usermodel user,context)=>Padding(
    padding: const EdgeInsets.all(10.0),
    child:   Container(
      height: 380,
      width: double.infinity,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.only( topRight: Radius.circular(50),
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
            height: 280,
            width: double.infinity,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.only( topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),

              ),
              color: Colors.white38,image: new DecorationImage(image: AssetImage("images/${user.imagename}"),fit:BoxFit.cover,),
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('${user.name}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                  ),
                  SizedBox(height: 10,),
                  Text('${user.price}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),
                  ),

                ],
              ),
              SizedBox(width: 20,),

              Container(

                //   width: double.infinity,

                // height: 60,

                color: Colors.teal,

                child: MaterialButton(onPressed: (){

                  // var result=weight / pow(height/ 100,2);
                  //print(result.round());
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>canneddetails(


                    ),
                    ),
                  );
                },

                  child: Text('Order',style: TextStyle(color:Colors.white,
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



}






