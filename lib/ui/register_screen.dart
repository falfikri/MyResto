import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:http/http.dart' as http;
import '../model/register_response.dart';
import 'package:myresto/ui/login_screen.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({Key? key}) : super(key: key);
  registerstate createState ()=> registerstate();
}

class registerstate extends State<RegisterScreen>{

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      return;
      // String? nama = controllerTxtNama!.text.toString();
      // String? email= controllerTxtEmail!.text.toString();
      // String? nohp = controllerTxtNohp!.text.toString();
      // String? pass = controllerTxtPass!.text.toString();
      // String? conpass = controllerTxtConpass!.text.toString();
      // register(nama, nohp, email, pass, conpass);
    }
    _formKey.currentState!.save();
  }

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
      var url = Uri.parse('http://192.168.1.11/api-resto/public/api/register');
      final response = await client.post(url, body: {"name": nama, "no_hp": nohp, "email": email, "password": pass, "confirmed": conpass});
      if (response.statusCode == 200) {
        RegisterResponse registResponse = RegisterResponse.fromJson(json.decode(response.body.toString()));
        if(registResponse.status==true){
          pesan = registResponse.pesan.toString();
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
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(pesan!)));
    if(nextScreen==true){
      _showInformationDialog();
    }else{
      _showInformationDialog2();
    }
  } 

  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(10,40,10,10),
        child: ListView(
          shrinkWrap: true,
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

            /* Container nama */

            Container(
              margin: EdgeInsets.fromLTRB(15,15,15,5),
              child: TextFormField(
                controller: controllerTxtNama,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),

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

            /*Container E-mail*/

            Container(
              margin: EdgeInsets.fromLTRB(15,5,15,5),
              child: TextFormField(
                key: _formKey,
                controller: controllerTxtEmail,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),

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

                // email validation
                onFieldSubmitted: (value) {
                  //validator
                },
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return 'Masukkan E-mail yang Valid!';
                  }
                  return null;
                },
              ),
            ),

            /* Container No.hp */

            Container(
              margin: EdgeInsets.fromLTRB(15,5,15,5),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: controllerTxtNohp,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),

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

            /* Container password */
            
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

            /*container konfirmasi password */

            Container(
              margin: EdgeInsets.fromLTRB(15,5,15,5),
              child: TextFormField(
                // cursorColor: Colors.black,
                // keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                controller: controllerTxtConpass,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                // onChanged: (value) {
                //   setState(() {
                //     String? conpass = controllerTxtConpass!.text.toString();
                //   });
                // },
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

            /* Masuk Ke Akun */

            Container(
              margin: EdgeInsets.all(8),
            ),

            Center(
              child: InkWell(
                child: Text(
                  "Sudah punya akun?",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () async{
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()),);
                }
              ),
            ),

            Container(
              margin: EdgeInsets.all(6),
            ),

            GFButton(
              onPressed: () async{
                _submit();
                // String? nama = controllerTxtNama!.text.toString();
                // String? email= controllerTxtEmail!.text.toString();
                // String? nohp = controllerTxtNohp!.text.toString();
                // String? pass = controllerTxtPass!.text.toString();
                // String? conpass = controllerTxtConpass!.text.toString();
                // register(nama, nohp, email, pass, conpass);
              },
              text: "Daftar",
              shape: GFButtonShape.pills,
              fullWidthButton: true,
            ),
          ],
        ),
      ),
    );
  }

  /* Register response */

  _showInformationDialog() async{
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
      desc: 'Berhasil Mendaftarkan Akun!\nSilahkan Masuk ke Akun Anda',
      showCloseIcon: false,
      btnOkOnPress: () async{
        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()),);
      },
    ).show();
  }

  _showInformationDialog2() async{
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
      desc: 'Gagal Mendaftarkan Akun!\nPeriksa Kembali Pendaftaran Anda',
      showCloseIcon: false,
      btnOkOnPress: (){}
    ).show();
  }
}