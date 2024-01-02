import 'package:db_proj_blogappui/widgets/Likebtn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../pages/Blogpage.dart';

class Blogwidget extends StatefulWidget {
  // final String blogID;
  // final String blogTitle;
  // final String blogDescription;
  // final String ind;
  // final DatabaseReference dbref;
  Blogwidget({
    Key? key,
    // required this.blogID,
    // required this.blogTitle,
    // required this.blogDescription,
    // required this.ind,
    // required this.dbref
  }) : super(key: key);

  @override
  State<Blogwidget> createState() => _BlogwidgetState();
}

class _BlogwidgetState extends State<Blogwidget> {
  final dbref = FirebaseDatabase.instance.ref("testusers");
  final key = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream:dbref.child("path").onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (!snapshot.hasData ||
              snapshot.data?.snapshot.value == null) {
            return Center(child: Text("No data available."));
          } else {
            // Process data here
            var data = snapshot.data!.snapshot.value;
            List<Object?> list = [];

            if (data is List) {
              list = data;
            } else if (data is Map) {
              list = data.values.toList();
            }

            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                Object? items = list[index];

                if (items is Map<dynamic, dynamic>) {
                  String title = items["Title"] ?? "No Title";
                  String desc = items["Desc"] ?? "No Description";

                  return ListTile(
                    title: Text(title),
                    subtitle: Text(desc),
                  );

                  // return myCustomWidget(items, index);
                } else if (items == null) {
                  return Container();
                } else {
                  print("SMAS => " + items.toString());
                  return ListTile(
                    title: Text(items.toString()),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }

  Widget myCustomWidget(Map<dynamic, dynamic> items, int index) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Blogpage()));
                },
                child: Hero(
                  tag: "blogImage",
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage('assets/images/$index.jpg'),
                          fit: BoxFit.cover,
                          opacity: 0.8,
                        )),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Blog Title",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    //////////like btn
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Likebtn(
                          isLiked: false,
                          onTap: () {},
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.comment_outlined,
                              size: 24,
                              color: const Color.fromARGB(255, 136, 132, 132),
                            ),
                          ),
                        )
                      ],
                    ),

                    ////////////like count ////////
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
