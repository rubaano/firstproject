

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstproject/server/product_server.dart';
import 'package:flutter/material.dart';

//import 'package:image_picker/image_picker.dart';
//import 'package:path/path.dart';
//import 'package:image_picker/image_picker.dart';
class addProduct extends StatefulWidget {
  @override
  State<addProduct> createState() => _addProductState();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var TypeController = TextEditingController();
  var numberController = TextEditingController();
  late String newValue;
}

class _addProductState extends State<addProduct> {
  // const addProduct({Key? key}) : super(key: key);
  // late PickedFile imagefile;
  //inal ImagePicker _picker = ImagePicker();
  dynamic file;
  final ProductServer _server = ProductServer();
  String name = '';
  String imageURL = '';
  String type = '';
  int count = 0;
  Timestamp timestamp = Timestamp(12, 12);
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var CounterController = TextEditingController;
  dynamic Valueshoose;
  List listItem = [];

  dynamic Valueday;
  List listday = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30"
  ];
  dynamic Valuemonth;
  List listmonth = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12"
  ];
  dynamic Valueyeare;
  List listyear = ["2021", "2022"];
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void loadListItem() async {
    await _server.getAllType().then((value) =>
        value?.forEach((element) {
          listItem.add(element.name);
        }));
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    loadListItem();
  }

  @override
  Widget build(BuildContext context) {
    //var CounterController=TextEditingController;
    var numberController = TextEditingController();
    var PriceController = TextEditingController();
    var Datecontroller = TextEditingController();
    var Countecontroller = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Text(
                    'Add Product...',
                    style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            child: MaterialButton(
                              onPressed: imagepicker,
                              child: const Text(
                                'Select image',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              //color: background,
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                        ),
                        if (file != null)
                          Image.file(
                            file,
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),

                        /*  Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(




                            ),
                          ),
                        ),*/
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                CircleAvatar(
                                  //  backgroundImage: imagefile==null?null:FileImage(imagefile),
                                  backgroundImage:
                                  file == null ? null : FileImage(file),
                                  radius: 44,
                                  backgroundColor: Colors.grey.shade200,
                                ),
                                CircleAvatar(
                                  radius: 7,
                                  backgroundColor: Colors.white,
                                ),
                                Icon(
                                  Icons.add_a_photo,
                                  color: Colors.black,
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(

                          controller: nameController,
                          keyboardType: TextInputType.name,
                          onFieldSubmitted: (String value) {
                            print(value);
                          },
                          onChanged: (String value) {

                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.edit,
                              color: Colors.deepPurpleAccent,
                            ),
                            labelText: ' Name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ('Name is too short !');
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.deepPurpleAccent, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, right: 6),
                            child: DropdownButton(
                              hint: Text(
                                "select Items",
                                style: TextStyle(color: Colors.grey),
                              ),
                              dropdownColor: Colors.grey.shade200,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.deepPurpleAccent,
                              ),
                              iconSize: 30,
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey.shade900),
                              borderRadius: BorderRadius.circular(5),
                              value: Valueshoose,
                              onChanged: (newValue) {
                                setState(() {
                                  Valueshoose = newValue;
                                });
                              },
                              items: listItem.map((valueItem) {
                                return DropdownMenuItem(
                                  child: Text(valueItem),
                                  value: valueItem,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: Countecontroller,
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (String value) {
                            print(value);
                          },
                          onChanged: (String value) {
                            print(value);
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.add_chart,
                              color: Colors.deepPurpleAccent,
                            ),
                            labelText: ' count',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ('count is too short !');
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: Datecontroller,
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (String value) {
                            print(value);
                          },
                          onChanged: (String value) {
                            print(value);
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.assessment_outlined,
                              color: Colors.deepPurpleAccent,
                            ),
                            labelText: ' discount',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ('discount is too short !');
                            }

                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 110,
                        child: TextFormField(
                          controller: PriceController,
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (String value) {
                            print(value);
                          },
                          onChanged: (String value) {
                            print(value);
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.monetization_on_outlined,
                              color: Colors.deepPurpleAccent,
                            ),
                            labelText: ' Price',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ('price is too short !');
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButton(
                          hint: Text(
                            "D",
                            style: TextStyle(color: Colors.grey),
                          ),

                          dropdownColor: Colors.grey.shade200,

                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.deepPurpleAccent,
                          ),

                          // iconSize: 30,

                          style: TextStyle(
                              fontSize: 20, color: Colors.grey.shade900),

                          borderRadius: BorderRadius.circular(5),

                          value: Valueday,

                          onChanged: (newValue) {
                            setState(() {
                              Valueday = newValue;
                            });
                          },

                          items: listday.map((valueItem) {
                            return DropdownMenuItem(
                              child: Text(valueItem),
                              value: valueItem,
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        width: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButton(
                          hint: Text(
                            "M",
                            style: TextStyle(color: Colors.grey),
                          ),

                          dropdownColor: Colors.grey.shade200,

                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.deepPurpleAccent,
                          ),

                          // iconSize: 30,

                          style: TextStyle(
                              fontSize: 20, color: Colors.grey.shade900),

                          borderRadius: BorderRadius.circular(5),

                          value: Valuemonth,

                          onChanged: (newValue) {
                            setState(() {
                              Valuemonth = newValue;
                            });
                          },

                          items: listmonth.map((valueItem) {
                            return DropdownMenuItem(
                              child: Text(valueItem),
                              value: valueItem,
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Container(
                          width: 60,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.deepPurpleAccent),
                              borderRadius: BorderRadius.circular(5)),
                          child: DropdownButton(
                            hint: Text(
                              "Y",
                              style: TextStyle(color: Colors.grey),
                            ),

                            dropdownColor: Colors.grey.shade200,

                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.deepPurpleAccent,
                            ),

                            // iconSize: 30,

                            style: TextStyle(
                                fontSize: 10, color: Colors.grey.shade900),

                            borderRadius: BorderRadius.circular(5),

                            value: Valueyeare,

                            onChanged: (newValue) {
                              setState(() {
                                Valueyeare = newValue;
                              });
                            },

                            items: listyear.map((valueItem) {
                              return DropdownMenuItem(
                                child: Text(valueItem),
                                value: valueItem,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  /*     Expanded(       child: TextFormField(

                controller: numberController,
                keyboardType: TextInputType.number,
                onFieldSubmitted: (String value){
                  print(value);
                },
                onChanged: (String value){
                  print(value);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.call,color: Colors.deepPurpleAccent,
                  ),
                  hintText: 'Mobile Number',


                  border: OutlineInputBorder(),
                ),
              ),),*/
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: Colors.deepPurpleAccent,
                      ),
                      labelText: ' email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('email is too short !');
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    child: MaterialButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          print(emailController.text);
                          print(PriceController.text);
                          print(Datecontroller.text);
                          print(nameController.text);
                          print(numberController.text);
                          print(Countecontroller.text);
                        }

                        // Navigator.push(context,
                        //   MaterialPageRoute(builder: (context)=>makeupproducts(
                        //
                        //   ),
                        //   ),

                        // );
                      },
                      child: Text(
                        'Add',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget? imageProfile() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 80,
        )
      ],
    );
  }

  void imagepicker() async {
    DateTime? a=await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2030,));
    print( a);
    // Timestamp.fromDate(a);
    // final = await _picker.pickImage(source: ImageSource.gallery);
    // XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    // if (image != null) {
    //   setState(() {
    //     file = File(image.path);
    //   });
    // }
  }
}


