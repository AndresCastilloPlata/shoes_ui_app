import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/shoe_model.dart';

import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/widgets/widgets.dart';

class ShoeDescPage extends StatelessWidget {
  const ShoeDescPage({super.key});

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            const Hero(tag: 'Shoe-1', child: ShoeSizePreview(fullScreen: true)),
            Positioned(
                top: 100,
                child: FloatingActionButton(
                  onPressed: () {
                    cambiarStatusDart();
                    Navigator.pop(context);
                  },
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                  child: const Icon(
                    Icons.chevron_left_rounded,
                    color: Colors.white,
                    size: 60,
                  ),
                ))
          ]),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                const ShoeDescription(
                    titulo: 'Nike Air Max 720',
                    description:
                        'The Nike Air Max 720 goes bigger than ever before with Nike\'s taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.'),
                _MontoBuyNow(),
                const _Colors(),
                const _BotonLikeCartSettings(),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class _BotonLikeCartSettings extends StatelessWidget {
  const _BotonLikeCartSettings();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const _BotonShadow(Icon(Icons.favorite, color: Colors.red, size: 30)),
          _BotonShadow(Icon(Icons.shopping_cart, color: Colors.grey, size: 30)),
          _BotonShadow(Icon(Icons.settings, color: Colors.grey, size: 30)),
        ],
      ),
    );
  }
}

class _BotonShadow extends StatelessWidget {
  final Icon icon;
  const _BotonShadow(
    this.icon,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                spreadRadius: -5,
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
      child: icon,
    );
  }
}

class _Colors extends StatelessWidget {
  const _Colors();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned(
                  left: 100,
                  child: _BotonColor(
                      Color(0xffC6D642), 4, 'assets/imgs/verde.png')),
              Positioned(
                  left: 65,
                  child: _BotonColor(
                      Color(0xffFFAD29), 3, 'assets/imgs/amarillo.png')),
              Positioned(
                  left: 33,
                  child: _BotonColor(
                      Color(0xff2099F1), 2, 'assets/imgs/azul.png')),
              _BotonColor(Color(0xff364d56), 1, 'assets/imgs/negro.png'),
            ],
          )),
          OrangeButton(
            texto: 'More related items',
            ancho: 180,
            alto: 30,
            color: Color(0xffFFc675),
          ),
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final int index;

  final Color color;

  final String urlImagen;

  const _BotonColor(
    this.color,
    this.index,
    this.urlImagen,
  );

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: () {
          final shoeModel = Provider.of<ShoeModel>(context, listen: false);
          shoeModel.assetImage = urlImagen;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            const Text('\$180.0',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
            const Spacer(),
            Bounce(
                delay: const Duration(seconds: 1),
                from: 8,
                child:
                    const OrangeButton(texto: 'Buy now', ancho: 120, alto: 45)),
          ],
        ),
      ),
    );
  }
}
