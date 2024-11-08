class categoryModel {
  final String categoryid ;
  final String categoryname;
  final String categoryimage;
  categoryModel({required this.categoryid, required this.categoryname,required this.categoryimage});
  factory categoryModel.fromjson(Map<String,dynamic>jsondata)
  {
    return categoryModel(
      categoryid:jsondata['categoryid'],
      categoryname:jsondata['categoryname'],
      categoryimage:jsondata['categoryimage'],
    );
  }
  Map<String ,dynamic> toMap(){
    return{
      'categoryid':categoryid,
      'categoryname':categoryname,
      'categoryimage':categoryimage,
    };
  }
}