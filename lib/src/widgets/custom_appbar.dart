import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String texto;

  const CustomAppBar({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          margin: const EdgeInsets.only(top: 60),
          width: double.infinity,
          // height: 150,

          child: Row(
            children: [
              Text(texto,
                  style: const TextStyle(
                      fontSize: 35, fontWeight: FontWeight.w700)),
              const Spacer(),
              const Icon(Icons.search, size: 35)
            ],
          ),
        ),
      ),
    );
  }
}
