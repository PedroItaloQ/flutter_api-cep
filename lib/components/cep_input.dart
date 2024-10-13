import 'package:flutter/material.dart';

class CepInput extends StatelessWidget {
  final TextEditingController controller;

  const CepInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: const TextStyle(
        color: Color.fromARGB(255, 219, 216, 216), 
      ),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelText: 'Digite o CEP',
        labelStyle: const TextStyle(
         color: Color.fromARGB(255, 219, 216, 216), 
        )
      ),
    );
  }
}
