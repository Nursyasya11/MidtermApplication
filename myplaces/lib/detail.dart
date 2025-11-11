import 'package:flutter/material.dart';
import 'place.dart';

class DetailPage extends StatelessWidget {
  final Place place;
  const DetailPage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: const Color.fromARGB(255, 252, 232, 168),
  title: Text(
    place.name,
    style: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 102, 67, 7),
      letterSpacing: 1.2,
      shadows: [
        Shadow(
          offset: Offset(1.5, 1.5),
          blurRadius: 3.0,
          color: Color.fromARGB(255, 253, 254, 254),
        ),
      ],
    ),
  ),
),
      body: SingleChildScrollView(
  padding: const EdgeInsets.all(16),
  child: Center(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 600),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 176, 172, 167),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(31, 0, 0, 0),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),         
        ],
      ),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            place.imageUrl,
            errorBuilder: (c, e, s) =>
                const Icon(Icons.image_not_supported, size: 100),
          ),
          const SizedBox(height: 15),
          Text(place.name,
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold)),
          Text("${place.state} • ${place.category}"),
          const SizedBox(height: 10),
          Text("Rating: ${place.rating}"),
          const SizedBox(height: 15),

          const Text("Description:",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text(place.description),

          const SizedBox(height: 15),
          const Text("Contact:",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text(place.contact),

          const SizedBox(height: 15),
          const Text("Location:",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text("Lat: ${place.latitude},  Lng: ${place.longitude}"),

          const SizedBox(height: 15),
          SelectableText(
            "Google Maps Link:\n"
            "https://www.google.com/maps/search/?api=1&query=${place.latitude},${place.longitude}",
          ),
        ],
      ),
    ),
  ),
),

    );
  }
}
