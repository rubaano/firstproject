

class MyType {
  final String name;
  final String imageURL;

  MyType(this.name, this.imageURL);


  Map<String,dynamic> toJSON() {
    return {
      'name': name,
      'imageURL': imageURL
    };
  }
  factory MyType.fromJSON(Map<String,dynamic > data){
    return MyType(data['name'], data['imageURL']);

  }
}