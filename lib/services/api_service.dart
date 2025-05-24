import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/album.dart';
import '../models/photo.dart';

class ApiService {
  final http.Client client;
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  ApiService({http.Client? client}) : client = client ?? http.Client();

  Future<List<Album>> fetchAlbums() async {
    final response = await client.get(Uri.parse('$baseUrl/albums'));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Album.fromJson(e)).toList();
    }
    throw Exception('Failed to load albums');
  }

  Future<List<Photo>> fetchPhotos(int albumId) async {
    final response =
    await client.get(Uri.parse('$baseUrl/photos?albumId=$albumId'));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Photo.fromJson(e)).toList();
    }
    throw Exception('Failed to load photos');
  }
}
