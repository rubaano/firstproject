import 'package:flutter/material.dart';
class usermodel{
  final int id;
  final String name;
  final String phone;
  usermodel({
   required this.id,
    required this.name,
    required this.phone,
});
}
class user_screen extends StatelessWidget {
  List<usermodel>users=[
usermodel(id: 1,
  name: 'xxxx',
  phone: '38388'),
    usermodel(id: 2,
        name: 'aaaa',
        phone: '55558'),
    usermodel(id: 3,
        name: 'rrrrr',
        phone: '88'),

    usermodel(id: 1,
        name: 'abdullah',
        phone: '38388'),
    usermodel(id: 2,
        name: 'ruba',
        phone: '55558'),
    usermodel(id: 3,
        name: 'hiba',
        phone: '88')
];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
title: Text('user'),
      ),
body: ListView.separated(itemBuilder: (context,index)=>buildUserItem(users[index]),
    separatorBuilder: (context,index)=>Padding(
      padding: const EdgeInsetsDirectional.only(start: 20),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[300],
      ),
    ),
    itemCount: users.length),

    );
  }
  Widget buildUserItem(usermodel user)=>Padding(
    padding: const EdgeInsets.all(8),
    child:   Row(

      children: [

        CircleAvatar(

          radius: 25,

          child: Text('${user.id}',style :TextStyle(

              fontSize:25,

              fontWeight: FontWeight.bold),

          ),

        ),

        SizedBox(width: 20,),

        Column(



          mainAxisSize: MainAxisSize.min,

          crossAxisAlignment: CrossAxisAlignment.start,

          children:[

            Text('${user.name}',style :TextStyle(

                fontSize:25,

                fontWeight: FontWeight.bold),),

            Text('${user.phone}',style:TextStyle(color: Colors.grey)),

          ],



        )



      ],

    ),
  );
}
