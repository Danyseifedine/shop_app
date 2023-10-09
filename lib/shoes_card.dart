import 'package:flutter/material.dart';


class ShoesCard extends StatelessWidget {
  final String title;
  final int price;
  final String image;
  final Color bg;
  const ShoesCard(
      {super.key,
      required this.bg,
      required this.title,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 35),
      // color: Colors.amber,
      padding: const EdgeInsets.all(16.0),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16), color: bg),

      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
              child: Text(
                '\$$price',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Image(
            height: 150,
            image: AssetImage(image),
          )
        ],
      ),
    );
  }
}
