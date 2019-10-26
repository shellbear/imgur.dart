part of imgur.services;

/// A service for albums.
///
/// https://apidocs.imgur.com/?version=latest#3606f862-8281-48f1-b0f7-49a5f77da0e1
class AlbumService extends BaseService {
  AlbumService(Imgur client) : super(client);

  /// Create a new album.
  ///
  /// https://apidocs.imgur.com/?version=latest#5369b915-ad8b-47b1-b44b-8e2561e41cee
  Future<Album> create({
    /// The image ids that you want to be included in the album.
    String ids,

    /// The delete hashes of the images that you want to be included in the
    /// album.
    String deleteHashes,

    /// The title of the album.
    String title,

    /// The description of the album.
    String description,

    /// Sets the privacy level of the album.
    Privacy privacy,

    /// The ID of an image that you want to be the cover of the album.
    String cover,
  }) async {
    final body = <String, String>{};

    if (ids != null) {
      body['ids'] = ids;
    }
    if (deleteHashes != null) {
      body['deletehashes'] = deleteHashes;
    }
    if (title != null) {
      body['title'] = title;
    }
    if (description != null) {
      body['description'] = description;
    }
    if (privacy != null) {
      body['privacy'] = fmtType(privacy);
    }
    if (privacy != null) {
      body['cover'] = fmtType(cover);
    }

    return BaseResponse<Album>.fromJson(json.decode(
            (await client.request(HttpMethod.POST, '/3/album', body: body))
                .body))
        .data;
  }

  /// Add or remove an album to favorites.
  ///
  /// If [favorite] is called on a favorite album, then the it will be removed
  /// from the list of favorites.
  ///
  /// https://apidocs.imgur.com/?version=latest#31c72664-59c1-426f-98d7-ac7ad6547cc2
  Future<String> favorite(String albumId) async =>
      BaseResponse<String>.fromJson(json.decode((await client.request(
                  HttpMethod.POST, '/3/album/$albumId/favorite'))
              .body))
          .data;

  /// Get comments of a given album.
  Future<List<Comment>> getComments(String albumId,
          {BestSort sort = BestSort.best}) async =>
      BaseResponseList<Comment>.fromJson(json.decode((await client.request(
                  HttpMethod.GET,
                  '/3/album/$albumId/comments/${fmtType(sort)}/all'))
              .body))
          .data;

  /// Get a details about a single image inside an album.
  ///
  /// https://apidocs.imgur.com/?version=latest#d4a30456-8905-40e0-8e14-9b51194c197e
  Future<Image> getImage(String albumId, String imgId) async =>
      BaseResponse<Image>.fromJson(json.decode((await client.request(
                  HttpMethod.GET, '/3/album/$albumId/image/$imgId'))
              .body))
          .data;

  /// Get all images inside an album.
  ///
  /// https://apidocs.imgur.com/?version=latest#7dde894b-a967-4419-9be2-082fbf379109
  Future<List<Image>> getImages(String albumId) async =>
      BaseResponseList<Image>.fromJson(json.decode(
              (await client.request(HttpMethod.GET, '/3/album/$albumId/images'))
                  .body))
          .data;

  /// Get infos about a given album.
  ///
  /// https://apidocs.imgur.com/?version=latest#5369b915-ad8b-47b1-b44b-8e2561e41cee
  Future<Album> getInfos(String albumId) async =>
      BaseResponse<Album>.fromJson(json.decode(
              (await client.request(HttpMethod.GET, '/3/album/$albumId')).body))
          .data;

  /// Get votes about an album.
  Future<Vote> getVotes(String albumId) async =>
      BaseResponse<Vote>.fromJson(json.decode(
              (await client.request(HttpMethod.GET, '/3/album/$albumId/votes'))
                  .body))
          .data;

  /// Vote on an album. The vote parameter can only be set as up, down, or veto.
  Future<bool> vote(String albumId, VoteType vote) async =>
      BaseResponse<bool>.fromJson(json.decode((await client.request(
                  HttpMethod.POST,
                  '/3/gallery/album/$albumId/vote/${fmtType(vote)}'))
              .body))
          .data;
}
