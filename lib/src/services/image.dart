part of imgur.services;

/// A service for images.
///
/// https://apidocs.imgur.com/?version=latest#de179b6a-3eda-4406-a8d7-1fb06c17cb9c
class ImageService extends BaseService {
  ImageService(Imgur client) : super(client);

  /// Delete an image.
  ///
  /// https://apidocs.imgur.com/?version=latest#ca48883b-6964-4ab8-b87f-c274e32a970d
  Future<bool> delete(String imgId) async =>
      BaseResponse<bool>.fromJson(json.decode(
              (await client.request(HttpMethod.DELETE, '/3/image/$imgId'))
                  .body))
          .data;

  /// Add or remove an image to favorites.
  ///
  /// If [favorite] is called on a favorite image, then the it will be removed
  /// from the list of favorites.
  ///
  /// https://apidocs.imgur.com/?version=latest#5dd1c471-a806-43cb-9067-f5e4fc8f28bd
  Future<String> favorite(String imgId) async =>
      BaseResponse<String>.fromJson(json.decode((await client.request(
                  HttpMethod.POST, '/3/image/$imgId/favorite'))
              .body))
          .data;

  /// Get comments of given image.
  Future<List<Comment>> getComments(String imgId,
          {BestSort sort = BestSort.best}) async =>
      BaseResponseList<Comment>.fromJson(json.decode((await client.request(
                  HttpMethod.GET,
                  '/3/image/$imgId/comments/${fmtType(sort)}/all'))
              .body))
          .data;

  /// Get infos about an image.
  ///
  /// https://apidocs.imgur.com/?version=latest#2078c7e0-c2b8-4bc8-a646-6e544b087d0f
  Future<Image> getInfos(String imgId) async =>
      BaseResponse<Image>.fromJson(json.decode(
              (await client.request(HttpMethod.GET, '/3/image/$imgId')).body))
          .data;

  /// Get votes about an image.
  Future<Vote> getVotes(String imgId) async =>
      BaseResponse<Vote>.fromJson(json.decode(
              (await client.request(HttpMethod.GET, '/3/image/$imgId/votes'))
                  .body))
          .data;

  /// Updates the title or description of an image.
  ///
  /// https://apidocs.imgur.com/?version=latest#7db0c13c-bf70-4e87-aecf-047abc65686d
  Future<bool> update(String imgId, {String title, String description}) async {
    final body = <String, String>{};

    if (title != null) {
      body['title'] = title;
    }
    if (description != null) {
      body['description'] = description;
    }

    return BaseResponse<bool>.fromJson(json.decode((await client
                .request(HttpMethod.POST, '/3/image/$imgId', body: body))
            .body))
        .data;
  }

  /// Upload an image to your Imgur account.
  Future<Image> uploadImage({
    File imageFile,

    /// Upload image from path.
    String imagePath,

    /// Upload image from an Url.
    String imageUrl,

    /// An image
    String imageBase64,

    /// The id of the album you want to add the image to. For anonymous albums,
    /// album should be the delete hash that is returned at creation.
    String albumId,

    /// The name of the image, this is automatically detected if image is
    /// passed via imageFile parameter.
    String name,

    /// The title of the image.
    String title,

    /// The description of the image.
    String description,
  }) async {
    final files = <http.MultipartFile>[];
    final body = <String, String>{};

    if (imageFile != null) {
      files.add(http.MultipartFile.fromBytes(
          'image', imageFile.readAsBytesSync(),
          filename: imageFile.path));
      body['type'] = 'file';
    } else if (imagePath != null) {
      files.add(await http.MultipartFile.fromPath('image', imagePath));
      body['type'] = 'file';
    } else if (imageUrl != null) {
      body['image'] = imageUrl;
      body['type'] = 'URL';
    } else if (imageBase64 != null) {
      body['image'] = imageBase64;
      body['type'] = 'base64';
    } else {
      return Future.error('You must provide at least one file source.');
    }

    if (name != null) {
      body['name'] = name;
    }
    if (albumId != null) {
      body['album'] = albumId;
    }
    if (title != null) {
      body['title'] = title;
    }
    if (description != null) {
      body['description'] = description;
    }

    return _upload(body: body, files: files);
  }

  /// Upload a video to your Imgur account.
  Future<Image> uploadVideo({
    File videoFile,

    /// Upload video from path.
    String videoPath,

    /// The id of the album you want to add the image to. For anonymous albums,
    /// it should be the delete hash that is returned at creation.
    String albumId,

    /// The name of the image, this is automatically detected if image is passed
    /// via videoFile parameter.
    String name,

    /// The title of the video.
    String title,

    /// The description of the video.
    String description,

    /// Will remove the audio track from a video file
    bool disableAudio,
  }) async {
    final files = <http.MultipartFile>[];
    final body = {'type': 'file'};

    if (videoFile != null) {
      files.add(http.MultipartFile.fromBytes(
          'video', videoFile.readAsBytesSync(),
          filename: videoFile.path));
    } else if (videoPath != null) {
      files.add(await http.MultipartFile.fromPath('video', videoPath));
    } else {
      return Future.error('You must provide at least one file source.');
    }

    if (name != null) {
      body['name'] = name;
    }
    if (albumId != null) {
      body['album'] = albumId;
    }
    if (title != null) {
      body['title'] = title;
    }
    if (description != null) {
      body['description'] = description;
    }
    if (disableAudio != null) {
      body['disableAudio'] = (disableAudio ? 1 : 0).toString();
    }

    return _upload(body: body, files: files);
  }

  /// Vote on an image.
  ///
  /// The vote parameter can only be set as [VoteType.up], [VoteType.down], or
  /// [VoteType.veto].
  Future<bool> vote(String imgId, VoteType vote) async =>
      BaseResponse<bool>.fromJson(json.decode((await client.request(
                  HttpMethod.POST,
                  '/3/gallery/image/$imgId/vote/${fmtType(vote)}'))
              .body))
          .data;

  /// An upload helper function for image/video.
  ///
  /// https://apidocs.imgur.com/?version=latest#c85c9dfc-7487-4de2-9ecd-66f727cf3139
  Future<Image> _upload({
    List<http.MultipartFile> files,
    Map<String, String> body
  }) async {
    http.Response resp = await client.upload(
      HttpMethod.POST,
      '/3/upload',
      body: body,
      files: files,
    );
    var baseResp = BaseResponse.fromJson(jsonDecode(resp.body));
    return Image.fromJson(baseResp.data);
  }
}
