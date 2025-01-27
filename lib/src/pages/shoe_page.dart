import 'package:flutter/material.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/widgets/widgets.dart';

class ShoePage extends StatelessWidget {
  const ShoePage({super.key});

  @override
  Widget build(BuildContext context) {
    cambiarStatusDart();
    return const Scaffold(
      // body: CustomAppBar(texto: 'For you'),
      // body: ShoeSizePreview(),
      body: Column(
        children: [
          CustomAppBar(texto: 'For you'),
          SizedBox(height: 20),
          Expanded(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Hero(tag: 'Shoe-1', child: ShoeSizePreview()),
                ShoeDescription(
                    titulo: 'Nike Air Max 720',
                    description:
                        'The Nike Air Max 720 goes bigger than ever before with Nike\'s taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.'),
              ],
            ),
          )),
          AddCartBoton(monto: 180.0),
        ],
      ),
    );
  }
}
