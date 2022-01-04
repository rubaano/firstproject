class loginmodel{

  late bool status;
late String message;
late  userdata data;
  loginmodel.fromJson(Map<String,dynamic>json){
    status=json['status'];
    message=json['message'];
    data=(json['data']!=null?userdata.fromJson(json['data']):null)!;



  }

}
class userdata{
late int id;
late String name;
late String phone ;
late String Token;
//userdata({required this.name,required this.phone,required this.id,required this.Token});
userdata.fromJson(Map<String,dynamic>json){
id=json['id'];
name=json['name'];
phone=json['phone'];
Token=json['token'];


}
}