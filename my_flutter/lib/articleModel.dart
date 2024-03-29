import 'dart:async';
import 'dart:convert';

import 'dart:io';

class Article {
  String title = "123title";
  final String publishDate;
  final String description;
  String imageUrl;

  Article(this.title, this.publishDate, this.description);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }
    // Get an Image
    HttpClient http = new HttpClient();
    try {
      var uri = new Uri.http('dog.ceo', '/api/breeds/image/random');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      var decoded = json.decode(responseBody);
      var url = decoded['message'];
      imageUrl = url;
    } catch (exception) {
      print(exception);
    }
  }
}
