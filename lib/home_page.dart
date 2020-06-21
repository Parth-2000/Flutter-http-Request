// Importing the Pakages
import 'dart:convert';
import 'package:fetch_json_url/userprofile_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Url
  String url = 'https://randomuser.me/api/?results=30';
  List result;
  // This Function will make request from the url and fetch data decode it and store in variable 
  void makeRequest() async {
    var response = await http.get(url);
    setState(() {
      if(response.statusCode == 200){
        var extractdata = json.decode(response.body);
        result = extractdata["results"];
      }else{
        throw ErrorDescription("Something went Wrong ...");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Rest Api Example'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: result == null ? 0 : result.length,
        itemBuilder: (BuildContext context, index) {
          return  ListTile(
            contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            title:  Text(result[index]["name"]["title"] + " " + result[index]["name"]["first"] + " " + result[index]["name"]["last"]),
            subtitle:  Text(result[index]["email"]),
            leading:  CircleAvatar(
              backgroundColor: Colors.grey[850],
              child: Image(image: NetworkImage(result[index]["picture"]["thumbnail"])),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UserProfilePage(result[index])));
            },
          );
        },
      ),
    );
  }
}