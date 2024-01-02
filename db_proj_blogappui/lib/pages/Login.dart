import 'package:db_proj_blogappui/pages/Homepage.dart';
import 'package:db_proj_blogappui/pages/Signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool ishidden = true;
  var loginemail = TextEditingController();
  var loginpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: [
                    const Color.fromARGB(255, 252, 78, 78),
                    Color.fromARGB(255, 238, 168, 168),
                  ])),
              child: Padding(
                padding: EdgeInsets.only(top: 80, right: 42),
                child: Text(' Login ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
              )),
          Padding(
            padding: EdgeInsets.only(top: 200),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 18, right: 18, top: 85),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: loginemail,
                        decoration: InputDecoration(
                            label: Text(
                              'Email',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent,
                                fontSize: 18,
                              ),
                            ),
                            suffixIcon: Icon(
                              Icons.check,
                              color: Colors.black.withOpacity(0.4),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.redAccent))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        obscureText: ishidden,
                        controller: loginpassword,
                        decoration: InputDecoration(
                          label: Text(
                            'Password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                              fontSize: 18,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent)),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                ishidden = !ishidden;
                              });
                            },
                            icon: Icon(
                              ishidden == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 70,
                            ),
                            Text('Create an account ',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.75),
                                    fontSize: 15)),
                            InkWell(
                              child: Text('  Signup',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signup()));
                              },
                            ),
                          ],
                        ),
                      ),

                      //////////////////////login btn ///////////////
                      SizedBox(
                        height: 70,
                      ),
                      Container(
                        height: 55,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(colors: [
                              const Color.fromARGB(255, 252, 78, 78),
                              Color.fromARGB(255, 238, 168, 168),
                            ])),
                        child: Center(
                          child: InkWell(
                            onTap: () async {
                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: loginemail.text,
                                  password: loginpassword.text,
                                )
                                    .then((value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Homepage()));
                                });
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  print('No user found for that email.');
                                } else if (e.code == 'wrong-password') {
                                  print(
                                      'Wrong password provided for that user.');
                                }
                              }
                            },
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// import 'package:db_proj_blogappui/pages/Homepage.dart';
// import 'package:db_proj_blogappui/pages/Signup.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   bool isHidden = true;
//   var loginEmail = TextEditingController();
//   var loginPassword = TextEditingController();
//   var username = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.topRight,
//                 colors: [
//                   const Color.fromARGB(255, 252, 78, 78),
//                   Color.fromARGB(255, 238, 168, 168),
//                 ],
//               ),
//             ),
//             child: Padding(
//               padding: EdgeInsets.only(top: 80, right: 42),
//               child: Text(
//                 ' Login ',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 40,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           Stack(
//             children: [
//               Positioned(
//                 top: 80, // Adjust the position as needed
//                 left: MediaQuery.of(context).size.width / 2 -
//                     50, // Center the avatar
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundImage: NetworkImage(
//                     'https://plus.unsplash.com/premium_photo-1683121769247-7824fdc324de?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//                   ),
//                 ),
//               ),
//               Positioned(
//                   top: 148,
//                   right: 150,
//                   child: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     child: Icon(
//                       Icons.edit,
//                       color: Colors.redAccent,
//                       size: 22,
//                     ),
//                   )),
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 200),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40),
//                   topRight: Radius.circular(40),
//                 ),
//                 color: Colors.white,
//               ),
//               height: double.infinity,
//               width: double.infinity,
//               child: Padding(
//                 padding: EdgeInsets.only(left: 18, right: 18, top: 85),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // Username TextField
//                       TextField(
//                         controller: username,
//                         decoration: InputDecoration(
//                           label: Text(
//                             'Username',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.redAccent,
//                               fontSize: 18,
//                             ),
//                           ),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: Colors.redAccent),
//                           ),
//                         ),
//                       ),

//                       SizedBox(height: 20),

//                       // Email TextField
//                       TextField(
//                         controller: loginEmail,
//                         decoration: InputDecoration(
//                           label: Text(
//                             'Email',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.redAccent,
//                               fontSize: 18,
//                             ),
//                           ),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: Colors.redAccent),
//                           ),
//                         ),
//                       ),

//                       SizedBox(height: 20),

//                       // Password TextField
//                       TextField(
//                         obscureText: isHidden,
//                         controller: loginPassword,
//                         decoration: InputDecoration(
//                           label: Text(
//                             'Password',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.redAccent,
//                               fontSize: 18,
//                             ),
//                           ),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: Colors.redAccent),
//                           ),
//                           suffixIcon: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 isHidden = !isHidden;
//                               });
//                             },
//                             icon: Icon(
//                               isHidden
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               color: Colors.black.withOpacity(0.4),
//                             ),
//                           ),
//                         ),
//                       ),

//                       SizedBox(height: 20),

//                       // Create an account link
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: Row(
//                           children: [
//                             Text(
//                               'Create an account ',
//                               style: TextStyle(
//                                 color: Colors.black.withOpacity(0.75),
//                                 fontSize: 15,
//                               ),
//                             ),
//                             InkWell(
//                               child: Text(
//                                 '  Login',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => Signup(),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       ),

//                       SizedBox(height: 20),

//                       // Login Button
//                       Container(
//                         height: 55,
//                         width: 300,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           gradient: LinearGradient(
//                             colors: [
//                               const Color.fromARGB(255, 252, 78, 78),
//                               Color.fromARGB(255, 238, 168, 168),
//                             ],
//                           ),
//                         ),
//                         child: Center(
//                           child: InkWell(
//                             onTap: () async {
//                               try {
//                                 await FirebaseAuth.instance
//                                     .signInWithEmailAndPassword(
//                                   email: loginEmail.text,
//                                   password: loginPassword.text,
//                                 )
//                                     .then(
//                                   (value) {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => Homepage(),
//                                       ),
//                                     );
//                                   },
//                                 );
//                               } on FirebaseAuthException catch (e) {
//                                 if (e.code == 'user-not-found') {
//                                   print('No user found for that email.');
//                                 } else if (e.code == 'wrong-password') {
//                                   print('Wrong password provided.');
//                                 }
//                               }
//                             },
//                             child: Text(
//                               'LOGIN',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
