abstract class ApiConsumer {
  Future get(String Url, {Map<String, dynamic>? QueryParameters});
  Future post(String Url, {Map<String, dynamic>? Body});
}
