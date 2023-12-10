
class LoginModel{
  String? mobile;
  String? packageName;

  LoginModel.fromJason(Map<String,dynamic> json){
    mobile = json['mobile'];
    packageName = json['package_name'];
  }
}