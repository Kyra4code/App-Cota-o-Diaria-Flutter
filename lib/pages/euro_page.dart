import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EuroPage extends StatefulWidget{
  @override
  State<EuroPage> createState() => _EuroPage();
}

class _EuroPage extends State<EuroPage>{

  @override
  void initState() {
    super.initState();
    verCotacao();
  }

  Future<void> verCotacao() async{
    
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cotação Euro"),
      ),
      body: Center(

      ),
    );
  }
}