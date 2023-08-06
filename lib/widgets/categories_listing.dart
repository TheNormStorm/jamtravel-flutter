import 'package:flutter/material.dart';
import 'package:jamtravel/models/tourist_destinaitons.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (contect, index) {
          return Chip(
              label: Text(touristDest[index].name),
              avatar: CircleAvatar(
                backgroundImage: AssetImage(touristDest[index].image),
              ),
              backgroundColor: Colors.white,
              elevation: 0.4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)));
        },
        separatorBuilder: ((context, index) => const Padding(
              padding: EdgeInsets.only(right: 10),
            )),
        itemCount: touristDest.length,
      ),
    );
  }
}
