import 'package:cambo_travel_app/data.dart';
import 'package:cambo_travel_app/models/favorite_place.dart';
import 'package:cambo_travel_app/pages/home_page.dart';
import 'package:cambo_travel_app/pages/widgets/card_favorite.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const HomePage();
                }),
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffF7F7F9),
              ),
              child: const Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
        title: const Text(
          "Favorite Places",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: _buildUI(context),
        ),
      ),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Favorite Places",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          _listFavorite(context),
        ],
      ),
    );
  }

  Widget _listFavorite(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 10,
          childAspectRatio: 0.81,
        ),
        itemCount: favoritesPlaces.length,
        itemBuilder: (context, index) {
          FavoritePlace favoritePlace = favoritesPlaces[index];
          return CardFavorite(
            title: favoritePlace.title,
            location: favoritePlace.location,
            urlImg: favoritePlace.urlImg,
          );
        },
      ),
    );
  }
}
