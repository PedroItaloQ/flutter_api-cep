import 'package:flutter/material.dart';
import 'package:cep_api/components/custom_appbar.dart';
import 'package:cep_api/components/cep_input.dart';
import 'package:cep_api/components/search_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consulta CEP',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cepController = TextEditingController();
  String _cepData = '';

  Future<void> _searchCep() async {
    final String cep = _cepController.text;
    final response = await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      setState(() {
        _cepData = '''
Estado: ${data['uf']}
Região: ${data['regiao']}
IBGE: ${data['ibge']}
Bairro: ${data['bairro']}
Logradouro: ${data['logradouro']}
        ''';
      });
    } else {
      setState(() {
        _cepData = 'Erro ao buscar CEP';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CepInput(controller: _cepController),
            const SizedBox(height: 16),
            SearchButton(onPressed: _searchCep),
            const SizedBox(height: 16),
            Text(
              _cepData,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 219, 216, 216),              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 70, 67, 67),
    );
  }
}
