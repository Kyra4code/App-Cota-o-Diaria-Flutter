import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DolarPage extends StatefulWidget{
  @override
  State<DolarPage> createState() => _DolarPage();
}

class _DolarPage extends State<DolarPage>{

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
        title: Text("Cotação Dolar"),
      ),
      body: Center(

      ),
    );
  }
}