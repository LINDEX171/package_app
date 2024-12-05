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

  getCountries() async {
    try {
      final response = await dio.get("https://restcountries.com/v3.1/all");
      setState(() {
        pays = response.data;
      });
    } catch (e) {
      print("Erreur lors de la récupération des données : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              getCountries();
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: pays.length,
        itemBuilder: (context, index) {
          final country = pays[index];

          // Gestion des champs optionnels
          final flag = country["flag"] ;
          final name = country["name"]["common"];
          final capital = (country["capital"] != null && country["capital"].isNotEmpty)
              ? country["capital"][0]
              : "Capitale inconnue";

          return ListTile(
            leading: Text(flag,style: TextStyle(fontSize: 40,),),
            title: Text(name),
            subtitle: Text(capital),
            onTap: () {

            },

          );
        },
      ),
    );
  }
}
