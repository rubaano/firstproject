// import 'package:firstpro/product/productcubit.dart';
//
// import 'package:firstpro/product/modelproduct.dart';
// import 'package:firstpro/product/stateproduct.dart';
// import 'package:firstpro/shared/components/components.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class productscreen extends StatelessWidget {
//   var id;
// productscreen(this.id);
//   @override
//   Widget build(BuildContext context) {
//
//     print('screen');
//     print(productcubit.get(context).categoriesModel.data.data.length);
//     return Scaffold(
//         appBar: AppBar(title: const Text('yyy')),
//         body: BlocBuilder<productcubit, productStates>(
//           builder: (context, state){
//             if(state is ShopLoadingHomeaDataState){
//               return const CircularProgressIndicator();
//             }
//             return ListView.separated(
//                 itemBuilder: (context, index) => buildCatItem(
//                     productcubit.get(context).categoriesModel.data.data[index]),
//                 separatorBuilder: (context, index) => Padding(
//                   padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
//                   child: Container(
//                     width: double.infinity,
//                     height: 1,
//                     color: Colors.white38,
//                   ),
//                 ),
//                 itemCount: productcubit.get(context).categoriesModel.data.data.length);
//           },
//         )
//     );
//   }
//
//   Widget buildCatItem(DataModel model) => Padding(
//     padding: const EdgeInsets.all(10.0),
//     child: Container(
//       height: 200,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(50),
//           topLeft: Radius.circular(50),
//           bottomLeft: Radius.circular(50),
//           bottomRight: Radius.circular(50),
//         ),
//         color: Colors.white38,
//       ),
//       child: Column(
//         // mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             height: 120,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(50),
//                 topLeft: Radius.circular(50),
//                 bottomLeft: Radius.circular(5),
//                 bottomRight: Radius.circular(5),
//               ),
//               color: Colors.white38,
//               image: new DecorationImage(
//                 image: AssetImage(model.image),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             //  Image(image: AssetImage('images/counselor.jpg'),
//             //  fit: BoxFit.contain,height: 100,width: double.maxFinite,
//
//             //      ),
//           ),
//           SizedBox(
//             width: 20,
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Container(
//             //   width: double.infinity,
//
//             // height: 60,
//
//             child: MaterialButton(
//               onPressed: () {
//                 // var result=weight / pow(height/ 100,2);
//                 //print(result.round());
//                 /*   Navigator.push(context,
//                     MaterialPageRoute(builder: (context)=>makeupproducts (
//
//
//                     ),
//                     ),
//                   );*/
//
//               },
//               child: Text(
//                 model.name,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 25),
//               ),
//             ),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               //color: background,
//               color: Colors.deepPurpleAccent,
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
