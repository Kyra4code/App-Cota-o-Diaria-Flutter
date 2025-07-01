import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DolarPage extends StatefulWidget{
  @override
  State<DolarPage> createState() => _DolarPage();
}

class _DolarPage extends State<DolarPage>{

  String cotacaoAtual = "";
  DateTime now = DateTime.now();
  
  @override
  void initState() {
    super.initState();
    verCotacao();
  }

  Future<void> verCotacao() async{
    int dia = now.day;
    int mes = now.month;
    int ano = now.year;

    String diaStr = dia.toString().padLeft(2, '0');
    String mesStr = mes.toString().padLeft(2, '0');

    final url = "https://olinda.bcb.gov.br/olinda/servico/PTAX/versao/v1/odata/CotacaoDolarDia(dataCotacao=@dataCotacao)?@dataCotacao=%27$mesStr-$diaStr-$ano%27&\$top=100&\$format=json";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      setState(() {
        final data = json.decode(response.body);
        cotacaoAtual = data["value"][0]["cotacaoCompra"].toStringAsFixed(2);
        print(cotacaoAtual);
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
        title: Text("Cotação Dolar"),
      ),
      body: Center(
        child: Text("Cotação atual do dólar hoje: \$$cotacaoAtual"),
      ),
    );
  }
}