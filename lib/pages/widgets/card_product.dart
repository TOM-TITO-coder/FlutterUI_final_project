import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
    required this.title,
    required this.location,
    required this.rate,
    required this.urlImg,
  });

  final String title;
  final String location;
  final String rate;
  final String urlImg;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.7,
      height: size.height * 0.48,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 10),
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: size.width,
            height: size.height * 0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              urlImg,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "⭐ $rate",
                style: const TextStyle(
                  fontSize: 18,
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            children: [
              const Icon(
                Icons.location_pin,
                color: Color(0xff7D848D),
              ),
              Text(
                location,
                style: const TextStyle(
                  color: Color(0xff7D848D),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
