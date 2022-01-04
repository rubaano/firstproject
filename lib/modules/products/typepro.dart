import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firstproject/intro_screen/Intro.dart';
import 'package:firstproject/modules/add_product/addproduct.dart';
import 'package:firstproject/server/product_server.dart';



import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';

import '../myaccount.dart';
import 'makeupproduct.dart';

class productstype extends StatefulWidget {
  @override
  State<productstype> createState() => _productstypeState();
}

class _productstypeState extends State<productstype> {
  bool _loading = false;
  List<Map<String, dynamic>> productsByType = [];
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  final ProductServer _server = ProductServer();

  void _loadProduct() async {
    setState(() {
      _loading = true;
    });
    productsByType = await _server.getProductByType() ?? [];
    print('-------------$productsByType');
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
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
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    height: 280,
                    width: double.infinity,
                    decoration: const BoxDecoration(
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
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(50),
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            color: Colors.white38,
                            image: DecorationImage(
                              image: NetworkImage(
                                  productsByType[index]['imageURL']),
                              fit: BoxFit.cover,
                            ),
                          ),
                          //  Image(image: AssetImage('images/counselor.jpg'),
                          //  fit: BoxFit.contain,height: 100,width: double.maxFinite,

                          //      ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    productsByType[index]['name'],
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ), IconButton(
                                onPressed: () {
                                  // var result=weight / pow(height/ 100,2);
                                  //print(result.round());
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => makeupproducts(
                                        productsByType[index]['products'],
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.arrow_forward_ios),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.white38,
                ),
              ),
              itemCount: productsByType.length,
            ),
      floatingActionButton: Builder(
        builder: (context) => FabCircularMenu(
          key: fabKey,
          // Cannot be Alignment.center
          alignment: Alignment.bottomRight,
          ringColor: Colors.white.withAlpha(100),
          ringDiameter: 300.0,
          ringWidth: 30.0,
          fabSize: 65.0,
          fabElevation: 10.0,
          fabIconBorder: CircleBorder(),
          fabColor: Colors.white,
          fabOpenIcon: Icon(Icons.menu_sharp, color: Colors.deepPurpleAccent),
          fabCloseIcon: Icon(Icons.close, color: Colors.green),
          fabMargin: const EdgeInsets.all(20.0),
          animationDuration: const Duration(milliseconds: 10),
          animationCurve: Curves.easeInOutCirc,
          onDisplayChange: (isOpen) {},
          children: <Widget>[
            RawMaterialButton(
              onPressed: () {
                /*     CashHelper.logout(key: 'token').then((value) {
                  if (value) {
                    navigateandFinish(context, IntroScreen());
                  }
                });*/

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IntroScreen(),
                  ),
                );
              },
              shape: CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: Icon(
                EvaIcons.logOut,
                color: Colors.green,
                size: 30,
              ),
            ),
            RawMaterialButton(
              onPressed: () {},
              shape: CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: Icon(
                Icons.facebook,
                color: Colors.blue,
                size: 30,
              ),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => addProduct(),
                  ),
                );
              },
              shape: CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: Icon(
                Icons.add_a_photo,
                color: Colors.purple,
                size: 30,
              ),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyAcount(),
                  ),
                );
              },
              shape: CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: Icon(
                Icons.account_box,
                color: Colors.lightBlueAccent,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
class lol extends StatefulWidget {
  @override
  State<lol> createState() => _lolState();
}

class _lolState extends State<lol> {
 // const lol({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
child: stack(),



    );
  }
}
*/
