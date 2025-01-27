import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final String texto;
  final double alto;
  final double ancho;
  final Color color;

  const OrangeButton({
    super.key,
    required this.texto,
    this.alto = 50,
    this.ancho = 150,
    this.color = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: ancho,
      height: alto,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        texto,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
