// import 'package:flutter/material.dart';
// import 'package:myresto/ui/login_screen.dart';
// import 'package:flutter_login/flutter_login.dart';


// class LoginPage extends StatefulWidget {
//   static String tag = 'login-page';
//   @override
//   _LoginPageState createState() => new _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     final logo = Hero(
//       tag: 'hero',
//       child: CircleAvatar(
//         backgroundColor: Colors.transparent,
//         radius: 48.0,
//         child: Image.asset('assets/logo.png'),
//       ),
//     );

//     final email = TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       autofocus: false,
//       initialValue: 'alucard@gmail.com',
//       decoration: InputDecoration(
//         hintText: 'Email',
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//       ),
//     );

//     final password = TextFormField(
//       autofocus: false,
//       initialValue: 'some password',
//       obscureText: true,
//       decoration: InputDecoration(
//         hintText: 'Password',
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//       ),
//     );

//     final loginButton = Padding(
//       padding: EdgeInsets.symmetric(vertical: 16.0),
//       child: Material(
//         borderRadius: BorderRadius.circular(30.0),
//         shadowColor: Colors.lightBlueAccent.shade100,
//         elevation: 5.0,
//         child: MaterialButton(
//           minWidth: 200.0,
//           height: 42.0,
//           onPressed: () {
//             Navigator.of(context).pushNamed(HomePage.tag);
//           },
//           color: Colors.lightBlueAccent,
//           child: Text('Log In', style: TextStyle(color: Colors.white)),
//         ),
//       ),
//     );

//     final forgotLabel = FlatButton(
//       child: Text(
//         'Forgot password?',
//         style: TextStyle(color: Colors.black54),
//       ),
//       onPressed: () {},
//     );

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: ListView(
//           shrinkWrap: true,
//           padding: EdgeInsets.only(left: 24.0, right: 24.0),
//           children: <Widget>[
//             logo,
//             SizedBox(height: 48.0),
//             email,
//             SizedBox(height: 8.0),
//             password,
//             SizedBox(height: 24.0),
//             loginButton,
//             forgotLabel
//           ],
//         ),
//       ),
//     );
//   }
// }
// //====================================================

// @override
//   Widget build(BuildContext context) {
//     final inputBorder = BorderRadius.vertical(
//       bottom: Radius.circular(10.0),
//       top: Radius.circular(20.0),
//     );

//     return FlutterLogin(
//       title: 'ECORP',
//       logo: AssetImage('assets/images/ecorp-lightgreen.png'),
//       onLogin: (_) => Future(null),
//       onSignup: (_) => Future(null),
//       onSubmitAnimationCompleted: () {
//         Navigator.of(context).pushReplacement(MaterialPageRoute(
//           // builder: (context) => DashboardScreen(),
//         ));
//       },
//       onRecoverPassword: (_) => Future(null),
//       theme: LoginTheme(
//         primaryColor: Colors.teal,
//         accentColor: Colors.yellow,
//         errorColor: Colors.deepOrange,
//         titleStyle: TextStyle(
//           color: Colors.greenAccent,
//           fontFamily: 'Quicksand',
//           letterSpacing: 4,
//         ),
//         bodyStyle: TextStyle(
//           fontStyle: FontStyle.italic,
//           decoration: TextDecoration.underline,
//         ),
//         textFieldStyle: TextStyle(
//           color: Colors.orange,
//           shadows: [Shadow(color: Colors.yellow, blurRadius: 2)],
//         ),
//         buttonStyle: TextStyle(
//           fontWeight: FontWeight.w800,
//           color: Colors.yellow,
//         ),
//         cardTheme: CardTheme(
//           color: Colors.yellow.shade100,
//           elevation: 5,
//           margin: EdgeInsets.only(top: 15),
//           shape: ContinuousRectangleBorder(
//               borderRadius: BorderRadius.circular(100.0)),
//         ),
//         inputTheme: InputDecorationTheme(
//           filled: true,
//           fillColor: Colors.purple.withOpacity(.1),
//           contentPadding: EdgeInsets.zero,
//           errorStyle: TextStyle(
//             backgroundColor: Colors.orange,
//             color: Colors.white,
//           ),
//           labelStyle: TextStyle(fontSize: 12),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Colors.blue.shade700, width: 4),
//             borderRadius: inputBorder,
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Colors.blue.shade400, width: 5),
//             borderRadius: inputBorder,
//           ),
//           errorBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Colors.red.shade700, width: 7),
//             borderRadius: inputBorder,
//           ),
//           focusedErrorBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Colors.red.shade400, width: 8),
//             borderRadius: inputBorder,
//           ),
//           disabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey, width: 5),
//             borderRadius: inputBorder,
//           ),
//         ),
//         buttonTheme: LoginButtonTheme(
//           splashColor: Colors.purple,
//           backgroundColor: Colors.pinkAccent,
//           highlightColor: Colors.lightGreen,
//           elevation: 9.0,
//           highlightElevation: 6.0,
//           shape: BeveledRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//           // shape: CircleBorder(side: BorderSide(color: Colors.green)),
//           // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
//         ),
//       ),
//     );
//   }