import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ImageUrl = "https://media-exp1.licdn.com/dms/image/C5635AQEk3ei8bEtxoQ/profile-framedphoto-shrink_400_400/0/1619342711522?e=1628103600&v=beta&t=7Ndp3O_qHx6FyiRuTDOdtp6mpZGCGu0nFGZchGDX8Lw";

    return Drawer (
      child : Container(
        color: Colors.yellow,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text("shubham",
                style: TextStyle(
                color: Colors.white,
              ),
              ),
              accountEmail: Text("shubham.joshi11@gmail.com",
              style: TextStyle(
                color: Colors.white,
              ),),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(ImageUrl),
              ),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home ,
              color: Colors.white,
            ),
            title: Text("Home",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,

            ),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled ,
              color: Colors.white,
            ),
            title: Text("Profile",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,

              ),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.mail_solid ,
              color: Colors.white,
            ),
            title: Text("Email ME",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,

              ),
            ),
          ),

        ],
      ),),
    );
  }
}
