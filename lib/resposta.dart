import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  Resposta(this.texto, this.onSelected);

  final String texto;
  final void Function() onSelected;

  final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20, color: Colors.blue),
    foregroundColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: style,
        onPressed: onSelected,
        child: Text(texto),
      ),
    );
  }
}
