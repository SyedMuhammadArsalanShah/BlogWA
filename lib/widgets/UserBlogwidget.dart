import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../pages/Blogpage.dart';

class UserBlogwidget extends StatefulWidget {
  // final String blogID;
  // final String blogTitle;
  // final String blogDescription;
  final String ind;
  final DatabaseReference dbref;
  UserBlogwidget(
      {Key? key,
      // required this.blogID,
      // required this.blogTitle,
      // required this.blogDescription,
      required this.ind,
      required this.dbref
      
      
      
      })
      : super(key: key);

  @override
  State<UserBlogwidget> createState() => _UserBlogwidgetState();
}

class _UserBlogwidgetState extends State<UserBlogwidget> {
  @override
  Widget build(BuildContext context) {
    return 
 StreamBuilder(
        stream: widget.dbref.child("path").child(widget.ind).onValue,
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
                  return myCustomlistile(items, index);
                } 
                
                else if (items == null) {
                  return Container();
                }
                else{
                return ListTile(
                  title: Text(items.toString()),
                );
              }},
            );
          }
        },
      );
   
  
  
  // Center(child: Text("here is my blog"),);
  
  
  
   }























  Widget myCustomlistile(Map<dynamic, dynamic> items, int index) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Blogpage()),
              );
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
                  ),
                ),
              ),
            ),
          ),
          //////blog title //////
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  (items != null && items["Title"] != null)
                      ? items["Title"].toString()
                      : "No Title",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                //////////like btn
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      color: const Color.fromARGB(255, 136, 132, 132),
                      icon: Icon(Icons.update),
                      onPressed: () {},
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.delete,
                          size: 24,
                          color: const Color.fromARGB(255, 136, 132, 132),
                        ),
                      ),
                    ),
                  ],
                ),

                ////////////like count ////////
              ],
            ),
          ),
        ],
      ),
    );
  }
}
