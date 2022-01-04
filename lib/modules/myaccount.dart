
import 'package:flutter/material.dart';

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

class MyAcount extends StatelessWidget {
  List<usermodel> users = [
    usermodel(
      imagename: 'counselor.jpg',
      name: 'counselor',
      price: '10\$',
      descripition: 'Councelor NYC  for all skin concerns',
      number: '77787',
    ),
    usermodel(
      imagename: 'foundation1.jpg',
      name: 'foundation',
      price: '20\$',
      descripition: 'Councelor NYC  for all skin concerns',
      number: '77787',
    ),
    usermodel(
      imagename: 'foundation.jpg',
      name: 'foundation',
      price: '20\$',
      descripition: 'Councelor NYC  for all skin concerns',
      number: '77787',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Account',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.amber,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
              ),
              SizedBox(
                height: 15,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    deleteedit(users[index], context),
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(),
                  child: Container(
                    width: double.infinity,
                    height: 10,
                    color: Colors.white38,
                  ),
                ),
                itemCount: users.length,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget deleteedit(usermodel user, context) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Container(
                height: 100,
                width: 314,
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      color: Colors.deepPurpleAccent,
                      child: MaterialButton(
                        onPressed: () {},
                        child: const Text(
                          'Delete',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      // width: 100,
                      color: Colors.deepPurpleAccent,

                      child: MaterialButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => makeupdetails(),
                          //   ),
                          // );
                        },
                        child: const Text(
                          'Edit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 30,

                            //  width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                              color: Colors.white30,
                              image: new DecorationImage(
                                image: AssetImage("images/${user.imagename}"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            //  Image(image: AssetImage('images/counselor.jpg'),
                            //  fit: BoxFit.contain,height: 100,width: double.maxFinite,

                            //      ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Text(
                              '${user.name}',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            '${user.price}',
                            style: TextStyle(
                                fontSize: 5, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
