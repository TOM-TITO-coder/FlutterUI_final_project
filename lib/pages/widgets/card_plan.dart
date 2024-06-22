import 'package:flutter/material.dart';

class CardPlan extends StatelessWidget {
  const CardPlan({
    super.key,
    required this.title,
    required this.location,
    required this.urlImg,
    required this.datePlan,
  });

  final String title;
  final String location;
  final String urlImg;
  final String datePlan;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      width: size.width,
      height: size.height * 0.15,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage(
              urlImg,
            ),
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.calendar_month_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Text(
                    datePlan,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_pin,
                    size: 20,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Text(
                    location,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
