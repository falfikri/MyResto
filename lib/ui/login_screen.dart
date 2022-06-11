import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:flutter_login/flutter_login.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:http/http.dart' as http;
import '../model/login_response.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({Key? key}) : super(key: key);
  loginstate createState ()=> loginstate();
}

class loginstate extends State<LoginScreen>{
  final TextEditingController? controllerTxtEmail = TextEditingController();
  final TextEditingController? controllerTxtPassword = TextEditingController();

  Future<void> masuk(String email, String password) async {

    String? pesan;
    bool? nextScreen = false;
    var client = http.Client();

    try {
      var url = Uri.parse('http://172.20.10.3/api-resto/public/api/login');
      final response = await client.post(url, body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(json.decode(response.body.toString()));
        if(loginResponse.status==true){
          pesan = loginResponse.pesan.toString();
          nextScreen = true;
        }else{
          pesan = "Masuk ke Akun Gagal";
        }
      } else {
        pesan = "Masuk ke Akun Gagal";
      }
      }catch(e){
      pesan = e.toString();
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(pesan!)));
    if(nextScreen==true){
      Navigator.of(context).pop();
      // Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewDataKaryawanScreen()),);
    }
  }
  @override
  Widget build (BuildContext context){
    return Scaffold(
      
    );
  }
}