part of imgur.client;

class Imgur {
  final Authentication auth;
  final String baseUrl;
  final http.Client client;

  GalleryService _gallery;
  ImageService _image;
  AlbumService _album;
  AccountService _account;
  CommentService _comment;

  Imgur(this.auth,
      {this.baseUrl = 'https://api.imgur.com/', http.Client httpClient})
      : client = httpClient ?? http.Client();

  AccountService get account => _account ??= AccountService(this);

  AlbumService get album => _album ??= AlbumService(this);

  CommentService get comment => _comment ??= CommentService(this);

  GalleryService get gallery => _gallery ??= GalleryService(this);

  ImageService get image => _image ??= ImageService(this);

  /// Make a new http request.
  Future<http.Response> request(
    /// The http method.
    HttpMethod method,

    /// The path URL relative to [baseUrl].
    String path, {

    /// An optional [Map] of additional http headers.
    Map<String, String> headers,

    /// An optional body to send with.
    dynamic body,
  }) async {
    final uri = Uri.parse(baseUrl).resolve(path);
    final req = http.Request(fmtType(method), uri);

    if (body != null) {
      if (body is Map<String, String>) {
        req.headers['Content-Type'] = 'application/x-www-form-urlencoded';
        req.bodyFields = body;
      } else {
        req.body = body.toString();
      }
    }

    if (headers != null) {
      req.headers.addAll(headers);
    }

    return _sendRequest(req);
  }

  Future<http.Response> upload(
    HttpMethod method,
    String path, {
    Map<String, String> headers,
    Map<String, String> body,
    List<http.MultipartFile> files,
  }) async {
    final uri = Uri.parse(baseUrl).resolve(path);
    final req = http.MultipartRequest(fmtType(method), uri);

    if (body != null) {
      req.fields.addAll(body);
    }

    if (files != null) {
      req.files.addAll(files);
    }

    if (headers != null) {
      req.headers.addAll(headers);
    }

    return _sendRequest(req);
  }

  Future<http.Response> _sendRequest(http.BaseRequest req) async {
    req.headers.addAll(auth.headers);

    final streamedResponse = await client.send(req);
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode >= 400) {
      return Future.error(response);
    }

    return response;
  }
}
