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
      {this.baseUrl = 'https://api.imgur.com/', http.Client client})
      : this.client = client != null ? client : http.Client();

  AccountService get account {
    if (_account == null) {
      _account = AccountService(this);
    }
    return _account;
  }

  AlbumService get album {
    if (_album == null) {
      _album = AlbumService(this);
    }
    return _album;
  }

  CommentService get comment {
    if (_comment == null) {
      _comment = CommentService(this);
    }
    return _comment;
  }

  GalleryService get gallery {
    if (_gallery == null) {
      _gallery = GalleryService(this);
    }
    return _gallery;
  }

  ImageService get image {
    if (_image == null) {
      _image = ImageService(this);
    }
    return _image;
  }

  Future<http.Response> request(
    HttpMethod method,
    String path, {
    Map<String, String> headers,
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

    return await _sendRequest(req);
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

    return await _sendRequest(req);
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
