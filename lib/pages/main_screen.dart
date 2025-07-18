import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget{
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tela Principal"),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage('assets/images/drawer_header.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(
                'Páginas de cotação',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.dollarSign),
              title: Text('Dólar'),
              onTap: () {
                Navigator.pushNamed(context, "/dolar_page");
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.euroSign),
              title: Text('Euro'),
              onTap: () {
                Navigator.pushNamed(context, "/euro_page");
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.yenSign),
              title: Text("Iene"),
              onTap: () => Navigator.pushNamed(context, "/iene_page"),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Bem Vindo ao aplicativo de cotação!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text("Começar com o Dólar"),
                  onPressed:(){
                      Navigator.pushNamed(context, "/dolar_page");
                  })
              ],
            )
          ),
        ),
      )
    );
  }
}