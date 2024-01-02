import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../widgets/UserBlogwidget.dart';

class UserBlogpage extends StatefulWidget {
  // final String blogID;
  // final String blogTitle;
  // final String blogDescription;
  // final String ind;
  // final DatabaseReference dbref;

  UserBlogpage({
    Key? key,
    // required this.blogID,
    // required this.blogTitle,
    // required this.blogDescription,
    // required this.ind,
    // required this.dbref
  }) : super(key: key);

  @override
  State<UserBlogpage> createState() => _UserBlogpageState();
}

class _UserBlogpageState extends State<UserBlogpage> {
  final dbref = FirebaseDatabase.instance.ref("testusers");
  final key = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.redAccent,
              padding: EdgeInsets.all(25),
              child: Row(
                children: [
                  Icon(
                    Icons.sort,
                    size: 30,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      "My Blog",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),

            /////////////////////////////////////////
            ///
            Container(
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Color(0xFFEDECF2),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 5),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                size: 27,
                                color: const Color.fromARGB(255, 31, 30, 30),
                              ),
                              border: InputBorder.none,
                              hintText: "Search here.....",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /////////// Blogs/////////////
                  SizedBox(
                    height: 12,
                  ),
                  UserBlogwidget(
                    ind: key,
                    dbref: dbref,
                  ),
                ],
              ), //main column
            ) //main container
          ],
        ),
      ),
    );
  }
}
