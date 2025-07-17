import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class IenePage extends StatefulWidget{
  @override
  State<IenePage> createState() => _IenePage();
}

class _IenePage extends State<IenePage>{

  String cotacaoAtual = "";

  void initState(){
    super.initState();
    verCotacao();
  }

  Future<void> verCotacao() async{
    var url = Uri.parse("https://economia.awesomeapi.com.br/json/last/JPY");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        var data = json.decode(response.body);
        var cotacao = data["JPYBRL"]["ask"];
        print(cotacao);
        cotacao = double.parse(cotacao);
        var formato = NumberFormat.currency(locale: "pt_BR", symbol: "R\$", decimalDigits: 2);
        cotacaoAtual = formato.format(cotacao).replaceAll("R\$", "¥").toString();
        print("Cotação do Iene: ${cotacaoAtual}");
      });
    } else {
      print("Erro ao buscar cotação");
    }
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cotação Iene"),
      ),
      body: Center(
        child: Text("Cotação atual do Iene hoje: ${cotacaoAtual}"),
      ),
    );
  }
}