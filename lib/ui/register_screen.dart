import 'dart:convert';
import 'dart:io';
// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
import '../model/register_response.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({Key? key}) : super(key: key);
  registerstate createState ()=> registerstate();
}

class registerstate extends State<RegisterScreen>{
  final TextEditingController? controllerTxtNama = TextEditingController();
  final TextEditingController? controllerTxtNohp = TextEditingController();
  final TextEditingController? controllerTxtEmail = TextEditingController();
  final TextEditingController? controllerTxtPass = TextEditingController();
  final TextEditingController? controllerTxtConpass = TextEditingController();


  Future<void> register(String nama, String nohp, String email, String pass, String conpass ) async {
    String? pesan;
    bool? nextScreen = false;
    var client = http.Client();
    try {
      var url = Uri.parse('http://192.168.43.182:80/api/rest_api.php?action=loginAdmin');
      final response = await client.post(url, body: {"nama": nama, "no_hp": nohp, "email": email, "password": pass, "config_pass": conpass});
      if (response.statusCode == 200) {
        RegisterResponse loginResponse = RegisterResponse.fromJson(json.decode(response.body.toString()));
        if(loginResponse.status==true){
          pesan = loginResponse.pesan.toString();
          nextScreen = true;
        }else{
          pesan = "Pendaftaran Akun Gagal";
        }
      } else {
        pesan = "Pendaftaran Akun Gagal";
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
      body: Container(
        padding: EdgeInsets.fromLTRB(10,40,10,10),
        child: Column(
          children: [
            Container(
              height: 10,
            ),
            Center(
              child: Image.asset(
                "assets/images/myresto.png",
                height: 300,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15,15,15,5),
              child: TextFormField(
                controller: controllerTxtNama,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                onChanged: (value) {
                  setState(() {
                    String? nama = controllerTxtNama!.text.toString();
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                      const BorderSide(color: Colors.orange, width: 0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                  hintText: "Masukkan Nama Anda",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: "verdana_regular",
                  ),
                  labelText: 'Nama',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: "verdana_regular",
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15,5,15,5),
              child: TextFormField(
                controller: controllerTxtEmail,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                onChanged: (value) {
                  setState(() {
                    String? email = controllerTxtEmail!.text.toString();
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email_outlined,
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
            Container(
              margin: EdgeInsets.fromLTRB(15,5,15,5),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: controllerTxtNohp,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                onChanged: (value) {
                  setState(() {
                    String? nohp = controllerTxtNohp!.text.toString();
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone_sharp,
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                      const BorderSide(color: Colors.orange, width: 0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                  hintText: "Masukkan No.Handphone Anda",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: "verdana_regular",
                  ),
                  labelText: 'No Hanphone',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: "verdana_regular",
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15,5,15,5),
              child: TextFormField(
                // keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                controller: controllerTxtPass,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                onChanged: (value) {
                  setState(() {
                    String? pass = controllerTxtPass!.text.toString();
                  });
                },
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
            Container(
              margin: EdgeInsets.fromLTRB(15,5,15,5),
              child: TextFormField(
                // keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                controller: controllerTxtConpass,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                onChanged: (value) {
                  setState(() {
                    String? conpass = controllerTxtConpass!.text.toString();
                  });
                },
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
                  hintText: "Masukkan Kembali Password Anda",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: "verdana_regular",
                  ),
                  labelText: 'Konfirmasi Password',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: "verdana_regular",
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: InkWell(
                child: Text(
                  "Sudah punya akun?",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () async{
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()),);
                }
              )
            ),
            GFButton(
              onPressed: (){},
              text: "Daftar",
              shape: GFButtonShape.pills,
              fullWidthButton: true,
            ),
          ],
        ),
      ),
    );
  }
}
      // Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen()),);