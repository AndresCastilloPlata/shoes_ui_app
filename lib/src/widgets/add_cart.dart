import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/widgets.dart';

class AddCartBoton extends StatelessWidget {
  final double monto;
  const AddCartBoton({super.key, required this.monto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.11),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            const SizedBox(width: 25),
            Text(
              '\$$monto',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const OrangeButton(texto: 'Add to cart'),
            const SizedBox(width: 30),
          ],
        ),
      ),
    );
  }
}
