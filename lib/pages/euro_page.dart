import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

class EuroPage extends StatefulWidget{
  @override
  State<EuroPage> createState() => _EuroPage();
}

class _EuroPage extends State<EuroPage>{

  String cotacaoAtual = "";

  @override
  void initState() {
    super.initState();
    verCotacao();
  }

  Future<void> verCotacao() async{
    
    final url = "https://economia.awesomeapi.com.br/json/last/EUR";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      setState(() {
        final data = json.decode(response.body);
        // print(data["USDBRL"]["ask"]);
        double cotacaoAtual = double.parse(data["EURBRL"]["ask"]);
        //Eu uso o number format para formatar o número fazendo ele se abreviar
        NumberFormat formatter = NumberFormat.currency(locale: "pt_BR", symbol: "R\$", decimalDigits: 2);
        this.cotacaoAtual = formatter.format(cotacaoAtual).replaceAll("R\$", "€").toString();

        // print(cotacaoAtual);
      });
    }
    else{
      print("Erro ao buscar cotação: ${response.statusCode}");
    }
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cotação Euro"),
      ),
      body: Center(
        child: Text("Cotação atual do Euro hoje: ${cotacaoAtual}"),
      ),
    );
  }
}