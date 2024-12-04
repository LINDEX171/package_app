import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final dio = Dio();
  List pays = [];
  getCountries() async{
    final response =await dio.get("https://restcountries.com/v3.1/all");
    setState(() {
      pays = response.data;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
          getCountries();
          }, icon: Icon(Icons.refresh))
        ],
      ),
      body: Text("$pays"),
    );
  }
}
