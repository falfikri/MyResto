import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
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

    if(nextScreen==true){
      login_berhasil();
    }else{
      login_gagal();
    }
  }
  @override
  Widget build (BuildContext context){
    return Scaffold(

      /* appbar */
      
      appBar: AppBar(
        title: Image.asset("assets/images/myrestoo3.png"),
      ),
      
      body: Container(
        padding: EdgeInsets.fromLTRB(10,40,10,10),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text("Masukkan E-mail dan Password \n yang sudah anda daftarkan"),
            ),

            /* Container textediting E-mail */

            Container(
              margin: EdgeInsets.fromLTRB(15,15,15,5),
              child: TextFormField(
                controller: controllerTxtEmail,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),

                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                      const BorderSide(color: Colors.orange, width: 0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                  hintText: "Masukkan E-mail Anda",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: "verdana_regular",
                  ),
                  labelText: 'E-mail',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: "verdana_regular",
                  ),
                ),
              ),
            ),

            /* Container textediting Password */

            Container(
              margin: EdgeInsets.fromLTRB(15,15,15,5),
              child: TextFormField(
                controller: controllerTxtPassword,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),

                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                      const BorderSide(color: Colors.orange, width: 0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                  hintText: "Masukkan Password Anda",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: "verdana_regular",
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: "verdana_regular",
                  ),
                ),
              ),
            ),

            /* Lupa Password */

            Container(
              padding: EdgeInsets.all(10.0),
            ),
            Center(
              child: InkWell(
                child: Text("Lupa Password?",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: ()async{
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()),);
                }
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0)
            ),
          ],
        ),
      ),
    );
  }

  /* login response */

  login_berhasil() async{
    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      borderSide: const BorderSide(
        color: Colors.green,
        width: 3,
      ),
      width: 400,
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(2),
      ),
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      title: 'INFO',
      desc: 'Berhasil Masuk Ke Akun!\n',
      showCloseIcon: false,
      btnOkOnPress: () async{
        // Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()),);
      },
    ).show();
  }

  login_gagal() async{
    AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      borderSide: const BorderSide(
        color: Colors.red,
        width: 3,
      ),
      width: 400,
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(2),
      ),
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      title: 'INFO',
      desc: 'Gagal Masuk ke Akun!\nPeriksa Kembali Data Masuk Anda',
      showCloseIcon: false,
      btnOkOnPress: (){}
    ).show();
  }
}