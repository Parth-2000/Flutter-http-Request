// Importing the Pakages
import 'package:flutter/material.dart';
import 'dart:core';

class UserProfilePage extends StatelessWidget {

  // The data from HomePage is transfered through Navigator is Stored in result variable of particular List Tile(user)
  final result;
  // Constructor
  UserProfilePage(this.result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      image: DecorationImage(
                        image: NetworkImage(result['picture']['large']),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(
                        width: 2.0,
                        color: Colors.white,
                      )
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text(result["name"]["title"] + " " + result["name"]["first"] + " " + result["name"]["last"], style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10.0),
                  Divider(
                    color: Colors.black26,
                    thickness: 1.5,
                  ),
                  SizedBox(height: 20.0),
                  Text('UserName:- ' + result['login']['username'], style: TextStyle(fontSize: 20.0),),
                  SizedBox(height: 20.0),
                  Text('Password:- ' + result['login']['password'], style: TextStyle(fontSize: 20.0),),
                  SizedBox(height: 20.0),
                  // Use the substring method to get the some part of the string from the full string 
                  Text('DOB:- ' + result['dob']['date'].substring(0, 10), style: TextStyle(fontSize: 20.0),),
                  SizedBox(height: 20.0),
                  Text('Gender:- ' + result['gender'], style: TextStyle(fontSize: 20.0),),
                  SizedBox(height: 20.0),
                  Text('Contact Number:- ' + result['phone'], style: TextStyle(fontSize: 20.0),),                
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}