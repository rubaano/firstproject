class ProductModel {

  bool status = false;
  ProductDataModel data = ProductDataModel(0, []);
  ProductModel();
  ProductModel.  fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = ProductDataModel.fromJson(json['data']);
  }

}

class ProductDataModel {
  int currentPage = 0;
  List<DataModel> data = [];
  ProductDataModel(this.currentPage, this.data);
  ProductDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    json['data'].forEach((element) {
      data.add(DataModel.fromJson(element));
    });
  }

}

class DataModel {
  int id = 0;
  String name = '';
  String image = '';
  DataModel({required this.name,required this.image,required this.id});
  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
