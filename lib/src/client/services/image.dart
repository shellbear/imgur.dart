part of imgur.client;

class ImageService extends BaseService {
  ImageService(Imgur client) : super(client);

  /// Get infos about an image.
  /// https://apidocs.imgur.com/?version=latest#2078c7e0-c2b8-4bc8-a646-6e544b087d0f
  Future<BaseResponse<Image>> getInfos(String imgId) async {
    return BaseResponse.fromJson(json.decode(
        (await client.request(HttpMethod.GET, '/3/image/$imgId')).body));
  }

  /// Get comments of given image.
  Future<BaseResponseList<Comment>> getComments(String imgId,
      {BestSort sort = BestSort.best}) async {
    return BaseResponseList<Comment>.fromJson(json.decode((await client.request(
            HttpMethod.GET, '/3/image/$imgId/comments/${fmtType(sort)}/all'))
        .body));
  }

  /// Delete an image.
  /// https://apidocs.imgur.com/?version=latest#ca48883b-6964-4ab8-b87f-c274e32a970d
  Future<BaseResponse<bool>> delete(String imgId) async {
    return BaseResponse.fromJson(json.decode(
        (await client.request(HttpMethod.DELETE, '/3/image/$imgId')).body));
  }

  /// Updates the title or description of an image.
  /// https://apidocs.imgur.com/?version=latest#7db0c13c-bf70-4e87-aecf-047abc65686d
  Future<BaseResponse<bool>> update(String imgId, {String title, String description}) async {
    final Map<String, String> body = {};

    if (title != null) {
      body['title'] = title;
    }
    if (description != null) {
      body['description'] = description;
    }

    return BaseResponse<bool>.fromJson(json.decode((await client
        .request(HttpMethod.POST, '/3/image/$imgId', body: body))
        .body));
  }

  /// Upload an image.
  /// https://apidocs.imgur.com/?version=latest#c85c9dfc-7487-4de2-9ecd-66f727cf3139
  Future<BaseResponse> upload(
    String albumId,
    String type,
    String name, {
    String image,
    String video,
    String title,
    String description,
    bool disabledAudio,
  }) async {
    List<http.MultipartFile> files;
    Map<String, String> body = {
      'album_id': albumId,
      'type': type,
      'name': name,
    };

    if (video != null) {
      files.add(await http.MultipartFile.fromPath('video', video));
    }
    if (image != null) {
      files.add(await http.MultipartFile.fromPath('image', image));
    }
    if (title != null) {
      body['title'] = title;
    }
    if (description != null) {
      body['description'] = description;
    }
    if (disabledAudio != null) {
      body['disabled_audio'] = (disabledAudio ? 1 : 0).toString();
    }

    return BaseResponse.fromJson(json.decode((await client
            .upload(HttpMethod.POST, '/3/upload', body: body, files: files))
        .body));
  }

  /// Add or remove an image to favorites.
  ///
  /// If [favorite] is called on a favorite image, then the it will be removed
  /// from the list of favorites.
  /// https://apidocs.imgur.com/?version=latest#5dd1c471-a806-43cb-9067-f5e4fc8f28bd
  Future<BaseResponse<String>> favorite(String imgId) async {
    return BaseResponse.fromJson(json.decode(
        (await client.request(HttpMethod.POST, '/3/image/$imgId/favorite'))
            .body));
  }
}
