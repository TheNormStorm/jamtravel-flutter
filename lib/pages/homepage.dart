import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:jamtravel/widgets/categories_listing.dart';
import 'package:jamtravel/widgets/custom_widgets.dart';
import 'package:jamtravel/widgets/location_card.dart';
import 'package:jamtravel/widgets/nearby_places_listing.dart';
import 'package:jamtravel/widgets/recommendation_listing.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "JamTravel",
              style: TextStyle(
                color: Color.fromARGB(255, 47, 110, 22),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        actions: const [
          CustomIconButton(
            icon: Icon(
              Ionicons.search_outline,
              color: Color.fromARGB(255, 47, 110, 22),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 12),
            child: CustomIconButton(
              icon: Icon(
                Ionicons.notifications_outline,
                color: Color.fromARGB(255, 47, 110, 22),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(15),
        children: [
          //Location Cards
          const LocationCard(),
          //Categories
          const SizedBox(height: 15),
          const Categories(),

          //Recommendations
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommendation",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton(onPressed: () {}, child: const Text("View All"))
            ],
          ),
          const SizedBox(height: 10),
          const JamTravelData(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nearby From You",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton(onPressed: () {}, child: const Text("View All"))
            ],
          ),
          const SizedBox(height: 10),
          const NearbyPlaces(),
        ],
      ),
    );
  }
}
