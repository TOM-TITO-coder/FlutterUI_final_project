import 'package:cambo_travel_app/constants.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  final List<CardOption> _listCard = [
    const CardOption(
        title: "from 90\$", urlImg: "assets/images/card_icons.png"),
    const CardOption(title: "Transport", urlImg: "assets/images/car_icon.png"),
    const CardOption(title: "Food", urlImg: "assets/images/fork_icon.png"),
    const CardOption(
        title: "Insurance", urlImg: "assets/images/insurance_icon.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildUI(context)),
    );
  }

  Widget _buildUI(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34),
                  //color: Colors.green,
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://th.bing.com/th/id/OIP.nhH9nGh8onFNyFdWs9FhWwEsDP?rs=1&pid=ImgDetMain",
                    ),
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.black, BlendMode.exclusion),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 15,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.5,
                        height: size.height * 0.07,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/profile.png",
                              ),
                              maxRadius: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Dara Veasna",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  "Location guide",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.38,
                left: size.width * 0.8,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          const Text(
            "AngkorWat Temple",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
            "AnkorWAt is a Hindu-Buddhist temple complex in Cambodia. Lacated on a site measuring 162. hectares ...",
            style: TextStyle(
              color: const Color(0xff222222).withOpacity(0.6),
              fontSize: 15,
            ),
          ),
          const Row(
            children: [
              Text(
                "Read more",
                style: TextStyle(color: Colors.redAccent),
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 32,
                color: Colors.redAccent,
              ),
            ],
          ),

          // card
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            children: _listCard
                .map(
                  (card) => CardOption(title: card.title, urlImg: card.urlImg),
                )
                .toList(),
          ),

          SizedBox(
            height: size.height * 0.02,
          ),
          // button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                fixedSize: Size(size.width, size.height * 0.08)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Buy a tour",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardOption extends StatelessWidget {
  const CardOption({
    super.key,
    required this.title,
    required this.urlImg,
  });

  final String title;
  final String urlImg;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.23,
      height: size.height * 0.15,
      child: Card(
        color: const Color(0xffF8F8F8),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width * 0.1,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                urlImg,
                // fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
