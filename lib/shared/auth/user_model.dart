import 'dart:convert';

class UserModel{
  final String name;
  final String? photoURL;

  UserModel({required this.name, this.photoURL});

  //Convertendo os dados em string
  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(name: map['name'], photoURL: map['photoURL']);
  }

  factory UserModel.fromJson(String json) => UserModel.fromMap(jsonDecode(json));

  //Convertendo a classe dart em um objeto
  Map<String, dynamic> toMap() =>{
    "name": name,
    "photoURL": photoURL,
  };

  //Converte a classe em json
  String toJson()=> jsonEncode(toMap);


}