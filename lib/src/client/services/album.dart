part of imgur.client;

/// A service for albums.
/// https://apidocs.imgur.com/?version=latest#3606f862-8281-48f1-b0f7-49a5f77da0e1
class AlbumService extends BaseService {
  AlbumService(Imgur client) : super(client);

  /// Get infos about a given album.
  /// https://apidocs.imgur.com/?version=latest#5369b915-ad8b-47b1-b44b-8e2561e41cee
  Future<BaseResponse<Album>> getInfos(String albumId) async {
    return BaseResponse<Album>.fromJson(json.decode(
        (await client.request(HttpMethod.GET, '/3/album/$albumId')).body));
  }

  /// Get comments of a given album.
  Future<BaseResponseList<Comment>> getComments(String albumId,
      {BestSort sort = BestSort.best}) async {
    return BaseResponseList<Comment>.fromJson(json.decode((await client.request(
            HttpMethod.GET, '/3/album/$albumId/comments/${fmtType(sort)}/all'))
        .body));
  }

  /// Get all images inside an album.
  /// https://apidocs.imgur.com/?version=latest#7dde894b-a967-4419-9be2-082fbf379109
  Future<BaseResponseList<Image>> getImages(String albumId) async {
    return BaseResponseList<Image>.fromJson(json.decode(
        (await client.request(HttpMethod.GET, '/3/album/$albumId/images'))
            .body));
  }

  /// Get votes about an album.
  Future<BaseResponse<Vote>> getVotes(String albumId) async {
    return BaseResponse.fromJson(json.decode(
        (await client.request(HttpMethod.GET, '/3/album/$albumId/votes'))
            .body));
  }

  /// Get a details about a single image inside an album.
  /// https://apidocs.imgur.com/?version=latest#d4a30456-8905-40e0-8e14-9b51194c197e
  Future<BaseResponse<Image>> getImage(String albumId, String imgId) async {
    return BaseResponse<Image>.fromJson(json.decode(
        (await client.request(HttpMethod.GET, '/3/album/$albumId/image/$imgId'))
            .body));
  }

  /// Add or remove an album to favorites.
  ///
  /// If [favorite] is called on a favorite album, then the it will be removed
  /// from the list of favorites.
  /// https://apidocs.imgur.com/?version=latest#31c72664-59c1-426f-98d7-ac7ad6547cc2
  Future<BaseResponse<String>> favorite(String albumId) async {
    return BaseResponse<String>.fromJson(json.decode(
        (await client.request(HttpMethod.POST, '/3/album/$albumId/favorite'))
            .body));
  }

  /// Vote on an album. The vote parameter can only be set as up, down, or veto.
  Future<BaseResponse<bool>> vote(String albumId, VoteType vote) async {
    return BaseResponse.fromJson(json.decode((await client.request(
            HttpMethod.POST, '/3/gallery/album/$albumId/vote/${fmtType(vote)}'))
        .body));
  }
}
