import 'package:flutter/material.dart';

class ShoeDescription extends StatelessWidget {
  final String titulo;
  final String description;

  const ShoeDescription({
    super.key,
    required this.titulo,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(titulo,
              style:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
          const SizedBox(height: 20),
          Text(description,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black54,
                height: 1.8,
              )),
        ],
      ),
    );
  }
}
