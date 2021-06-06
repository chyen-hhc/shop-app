import 'package:http/http.dart' as http;

Future<http.Response> fetchAlbum() {
  return http.get(Uri.https(
      'https://shopapp-project-9c987-default-rtdb.firebaseio.com/', 'au'));
}
