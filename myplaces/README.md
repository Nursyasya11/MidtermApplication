NAME : NURSYASYA AINA BINTI ANUAR
NO.MATRIC: 307825
GitHub repository link : https://github.com/Nursyasya11/MidtermApplication.git 
YouTube presentation link: https://youtu.be/gnzTBvljB5A 
1. (List View, Detail Page, And Error/Loading State)
a. List View
 
b. Detail Page
 
c. Error/Loading State
 
2. Show your method to load data (Code segment only)
Future<List<Place>> fetchPlaces() async {
    const url =
        "https://slumberjer.com/teaching/a251/locations.php?state=&category=&name=";
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return data.map((e) => Place.fromJson(e)).toList();
      } else {
        throw Exception("Server error: ${response.statusCode}");
      }
    } on SocketException {
      throw Exception("No internet connection");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

3. Show your data model class (Full class)
class Place {
  final String id;
  final String name;
  final String state;
  final String category;
  final String description;
  final String imageUrl;
  final double latitude;
  final double longitude;
  final String contact;
  final double rating;

  Place({
    required this.id,
    required this.name,
    required this.state,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
    required this.contact,
    required this.rating,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    double toDouble(dynamic v) {
      if (v == null) return 0.0;
      if (v is num) return v.toDouble();
      return double.tryParse(v.toString()) ?? 0.0;
    }

    return Place(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      state: json['state'] ?? '',
      category: json['category'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['image_url'] ?? '',
      latitude: toDouble(json['latitude']),
      longitude: toDouble(json['longitude']),
      contact: json['contact'] ?? '',
      rating: toDouble(json['rating']),
    );
  }
}


4. Image load error handling (Code segment only)
 child: Image.network(
                          place.imageUrl,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (c, e, s) =>
                              const Icon(Icons.broken_image, size: 60, color: Colors.white),
                        ),
5. UI Widget handling no data and with data list array (Code segment only). 
if (list.isEmpty) {
            return const Center(child: Text("No data available", style: TextStyle(color: Colors.white)));
          }
          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3.0,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final place = list[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPage(place: place),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 254, 254, 254).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                        child: Image.network(
                          place.imageUrl,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (c, e, s) =>
                              const Icon(Icons.broken_image, size: 60, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              place.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              place.state,
                              style: const TextStyle(color: Colors.white70),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  place.rating.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
 
Authorship Note with signature
_______________________________
(NURSYASYA AINA BINTI ANUAR (307825)
“I confirm that this project represents my own original work in accordance with academic integrity policies. No part of the code was fully generated by AI tools such as ChatGPT or GitHub Copilot. I relied solely on lecture notes, class tutorials, and official Flutter documentation. I understand that my work may be scrutinized, and if it is found that I did not personally develop the code, marks may be deducted, or the submission may be disqualified.”

