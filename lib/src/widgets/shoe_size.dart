import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/shoe_model.dart';
import 'package:shoes_app/src/pages/shoe_desc_page.dart';

class ShoeSizePreview extends StatelessWidget {
  final bool fullScreen;

  const ShoeSizePreview({super.key, this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ShoeDescPage(),
              ));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (fullScreen) ? 10 : 40,
          vertical: (fullScreen) ? 25 : 5,
        ),
        child: Container(
          width: double.infinity,
          height: (fullScreen) ? 510 : 520,
          decoration: BoxDecoration(
            color: const Color(0xffFFCF53),
            borderRadius: (!fullScreen)
                ? BorderRadius.circular(50)
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
          ),
          child: Column(
            children: [
              //Zapato con su sombra
              _ShoeShadow(
                fullScreen: fullScreen,
              ),

              //tallas zapato
              if (!fullScreen) const _ShoeSizes(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget {
  const _ShoeSizes();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BoxShoeSize(7),
          _BoxShoeSize(7.5),
          _BoxShoeSize(8),
          _BoxShoeSize(8.5),
          _BoxShoeSize(9),
          _BoxShoeSize(9.5),
        ],
      ),
    );
  }
}

class _BoxShoeSize extends StatelessWidget {
  final double talla;

  const _BoxShoeSize(
    this.talla,
  );

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return GestureDetector(
      onTap: () {
        final shoeModel = Provider.of<ShoeModel>(context, listen: false);
        shoeModel.talla = talla;
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: (talla == shoeModel.talla)
                ? const Color(0xffF1A23A)
                : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if (talla == shoeModel.talla)
                const BoxShadow(
                  color: Color(0xffF1A23A),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                )
            ]),
        alignment: Alignment.center,
        child: Text(
          talla.toString().replaceAll('.0', ''),
          style: TextStyle(
              color: (talla == shoeModel.talla)
                  ? Colors.white
                  : const Color(0xffFFCF53),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  final bool fullScreen;
  const _ShoeShadow({required this.fullScreen});

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return Padding(
      padding:
          (!fullScreen) ? const EdgeInsets.all(40) : const EdgeInsets.all(70),
      child: Stack(
        children: [
          Positioned(
            bottom: (!fullScreen) ? 30 : 20,
            right: 0,
            child: _ShadowShoe(fullScreen: fullScreen),
          ),
          Image(image: AssetImage(shoeModel.assetImage)),
        ],
      ),
    );
  }
}

class _ShadowShoe extends StatelessWidget {
  final bool fullScreen;

  const _ShadowShoe({required this.fullScreen});
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 320,
        height: (!fullScreen) ? 100 : 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(color: Color(0xffEAA14E), blurRadius: 40),
            ]),
      ),
    );
  }
}
