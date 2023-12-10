
class CheckedModel{
  String? mobile;
  String? token;
 CheckedModel.fromJason(Map<String,dynamic> json){
    mobile = json['mobile'];
    token = json['package_name'];
  }
}