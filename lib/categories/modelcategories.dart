class CategoriesModel {

  bool status = false;
  CategoriesDataModel data = CategoriesDataModel(0, []);
CategoriesModel();
  CategoriesModel.  fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = CategoriesDataModel.fromJson(json['data']);
  }

}

class CategoriesDataModel {
  int currentPage = 0;
  List<DataModel> data = [];
  CategoriesDataModel(this.currentPage, this.data);
  CategoriesDataModel.fromJson(Map<String, dynamic> json) {
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
