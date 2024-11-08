class userModel {
  final String name;
  final String email;
  final String numPhone;
  final String? uId;

  userModel({ required this.name, required this.email, required this.numPhone, required this.uId});

  factory userModel.fromJson(Map<String,dynamic>jsondata){
    return userModel(
        name:jsondata['name'],
        email:jsondata['email'],
        numPhone:jsondata['numPhone'],
        uId:jsondata['uId'],
       );
  }
  Map<String ,dynamic> toMap(){
    return{
      'name':name,
      'email':email,
      'numPhone':numPhone,
      'uId':uId,
    };
  }
}