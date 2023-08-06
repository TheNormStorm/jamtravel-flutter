class TouristDestination {
  final String name;
  final String image;

  TouristDestination({required this.image, required this.name});
}

List<TouristDestination> touristDest = [
  TouristDestination(image: "assets/icons/mountain.png", name: "Tours"),
  TouristDestination(image: "assets/icons/beach.png", name: "Beach"),
  TouristDestination(image: "assets/icons/river.jpg", name: "Rivers"),
  TouristDestination(image: "assets/icons/food.png", name: "Restuarants"),
  TouristDestination(
      image: "assets/icons/museum.jpg", name: "Historical Sites"),
];
