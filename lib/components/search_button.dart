import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SearchButton({super.key , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange, 
      ),
      child: const Text(
        'Buscar CEP',
        style: TextStyle(
          color: Colors.black,
        ),
        ),
    );
  }
}
