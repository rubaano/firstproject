import 'package:flutter/material.dart';
Widget defaultbuttom({
 double width=double.infinity,
 Color background=Colors.deepPurpleAccent,
  bool isUpperCase=true,
  double radius=3,
  required Function function ,
  required String text
})=> Container(
  width: width,

  child: MaterialButton(
    onPressed: () {
     function();
    },
    child: Text(
        isUpperCase? text.toUpperCase() :text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: background,
  ),
);
Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);


Widget defaultfield({
  required TextInputType type,
  required TextEditingController controller,
 bool ispassword=false,
 IconData? prefix,
 IconData? suffix,
required String label,
void Function()? suffixpressed,
  void Function ()?onChanged,
  required validate,
})=>TextFormField(
controller:controller,
keyboardType: type,
obscureText: ispassword,
  validator: validate,

onFieldSubmitted: (String value) {
print(value);



},
onChanged: (String value) {
print(value);
},

decoration: InputDecoration(
labelText: label,
prefixIcon: Icon(
prefix,color: Colors.deepPurpleAccent,
),
suffixIcon: suffix!=null  ? IconButton(
  onPressed: suffixpressed,
  icon:   Icon(

  suffix,color: Colors.deepPurpleAccent,

  ),
):null,
border: OutlineInputBorder(),
),
);


void navigateandFinish(
    context,
    widget,
    ) =>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
            (Route<dynamic> route) => false);