import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:jamtravel/pages/tour_page.dart';
import '../api/api_get_recommended.dart';

class JamTravelData extends StatefulWidget {
  const JamTravelData({Key? key}) : super(key: key);

  @override
  JamTravelState createState() => JamTravelState();
}

class TourData {
  final String name;
  final String rating;

  TourData(this.name, this.rating);
}

class JamTravelState extends State<JamTravelData> {
  late final Future
      myFuture; // Replace YourDataType with the actual data type you receive.

  @override
  void initState() {
    super.initState();
    myFuture = getPhotos(); //
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      child: FutureBuilder(
        future: myFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading data'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final data = snapshot.data![index];
                return SizedBox(
                  width: 220,
                  child: Card(
                    elevation: 0.4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        String name = snapshot.data![index].name;
                        String rating = snapshot.data![index].rating;
                        String parish = snapshot.data![index].parish;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TourPage(
                                image: snapshot.data![index].site,
                                name: name,
                                parish: parish,
                                rating: rating),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                imageUrl: snapshot.data![index].site,
                                width: double.maxFinite,
                                fit: BoxFit.cover,
                                height: 150,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  data.name.toString(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.star,
                                  color: Color(0xFFffd13d),
                                  size: 14,
                                ),
                                Text(
                                  data.rating.toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Ionicons.location,
                                  color: Theme.of(context).primaryColor,
                                  size: 16,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  data.parish.toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
