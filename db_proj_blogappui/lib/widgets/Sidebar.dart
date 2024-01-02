import 'package:db_proj_blogappui/pages/AddBlogpage.dart';
import 'package:db_proj_blogappui/pages/UserBlogpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';

import '../pages/Login.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'username',
              style: TextStyle(fontSize: 15),
            ),
            accountEmail:
                Text('email@gmail.com', style: TextStyle(fontSize: 15)),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://plus.unsplash.com/premium_photo-1683121769247-7824fdc324de?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.redAccent,
            ),
          )
          ////////////////////////////dashboard options/////////
          ,
          ListTile(
            leading: Icon(Icons.my_library_books),
            title: Text('My Blogs'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserBlogpage(
                          // blogID: '',
                          // blogDescription: '',
                          // blogTitle: '',
                          // ind: '',
                          // dbref: FirebaseDatabase.instance.ref("Appusers"),
                        )),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Add Post'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddBlogpage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text('Logout'),
            onTap: () async {
              await FirebaseAuth.instance.signOut().then((value) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              });
              ;
            },
          ),
        ],
      ),
    );
  }
}
