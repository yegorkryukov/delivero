import 'dart:convert';
import 'dart:io';

class Meal {
  final String name;
  final String location;
  final String description;
  final String price;
  String imageUrl;

  int rating = 0;

  Meal(this.name, this.location, this.description, this.price);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = HttpClient();
    try {
      var uri = Uri.https('themealdb.com', '/api/json/v1/1/random.php');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      imageUrl = json.decode(responseBody)['meals'][0]['strMealThumb'];

    } catch (exception) {
      print(exception);
    }
  }
}
