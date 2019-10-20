part of imgur.client;

/// A service for user's account.
/// https://apidocs.imgur.com/?version=latest#a94d108b-d6e3-4e68-9521-47ea79501c85
class AccountService extends BaseService {
  AccountService(Imgur client) : super(client);

  /// Return all of the images associated with the account.
  /// https://apidocs.imgur.com/?version=latest#2e45daca-bd44-47f8-84b0-b3f2aa861735
  Future<BaseResponseList<Image>> getImages(
      {String username = 'me', int page = 0}) async {
    return BaseResponseList<Image>.fromJson(json.decode((await client.request(
            HttpMethod.GET, '/3/account/$username/images/$page'))
        .body));
  }

  /// Returns the total number of images associated with the account.
  /// https://apidocs.imgur.com/?version=latest#2c9edd88-e763-43b4-8ca8-557609d197c3
  Future<BaseResponse<int>> getImageCount({String username = 'me'}) async {
    return BaseResponse<int>.fromJson(json.decode((await client.request(
            HttpMethod.GET, '/3/account/$username/images/count'))
        .body));
  }

  /// Get the current account's avatar URL and avatar name.
  /// https://apidocs.imgur.com/?version=latest#6427d23d-2ad2-44e3-846d-65d7b042afbd
  Future<BaseResponse<AvatarData>> getAvatar({String username = 'me'}) async {
    return BaseResponse<AvatarData>.fromJson(json.decode(
        (await client.request(HttpMethod.GET, '/3/account/$username/avatar'))
            .body));
  }

  /// Returns the account settings, only accessible if you're logged in as the user.
  /// https://apidocs.imgur.com/?version=latest#ce57e346-3515-4381-a772-ef5ade60bdee
  Future<BaseResponse<AccountSettings>> getSettings() async {
    return BaseResponse<AccountSettings>.fromJson(json.decode(
        (await client.request(HttpMethod.GET, '/3/account/me/settings')).body));
  }

  /// If authenticated, get the list of available avatars for the given user
  /// https://apidocs.imgur.com/?version=latest#ff70e965-286b-4a36-9745-de646aedfb81
  Future<BaseResponse<AvatarListData>> getAvailableAvatars(
      {String username = 'me'}) async {
    return BaseResponse<AvatarListData>.fromJson(json.decode((await client
            .request(HttpMethod.GET, '/3/account/$username/available_avatars'))
        .body));
  }

  /// Return the images the user has favorited in the gallery.
  /// https://apidocs.imgur.com/?version=latest#56a1d1ff-d203-4a6e-b54e-e49f9bdfbc0d
  Future<BaseResponseList<GalleryAlbumImage>> getFavoriteGalleries({
    String username = 'me',
    int page = 0,
    FavoriteSort sort = FavoriteSort.newest,
  }) async {
    return BaseResponseList<
        GalleryAlbumImage>.fromJson(json.decode((await client.request(
            HttpMethod.GET,
            '/3/account/$username/gallery_favorites/$page/${fmtType(sort)}'))
        .body));
  }

  /// Returns the users favorited images, only accessible if you're logged
  /// in as the user.
  /// https://apidocs.imgur.com/?version=latest#a432a8e6-2ece-4544-bc7a-2999eb586f06
  Future<BaseResponseList<GalleryAlbumImage>> getFavoriteImages({
    String username = 'me',
    int page = 0,
    FavoriteSort sort = FavoriteSort.newest,
  }) async {
    return BaseResponseList<GalleryAlbumImage>.fromJson(json.decode(
        (await client.request(HttpMethod.GET,
                '/3/account/$username/favorites/$page/${fmtType(sort)}'))
            .body));
  }

  /// Return the images a user has submitted to the gallery.
  ///
  /// You can add sorting as well after paging. Sorts can be:
  /// [DateBestSort.newest] (default), [DateBestSort.oldest], [DateBestSort.worst],
  /// [DateBestSort.best].
  Future<BaseResponseList<GalleryAlbumImage>> getSubmissions({
    String username = 'me',
    int page = 0,
    DateBestSort sort = DateBestSort.newest,
  }) async {
    return BaseResponseList<GalleryAlbumImage>.fromJson(json.decode(
        (await client.request(HttpMethod.GET,
                '/3/account/$username/submissions/$page/${fmtType(sort)}'))
            .body));
  }

  /// Return the comments the user has created.
  /// https://apidocs.imgur.com/?version=latest#a1813588-ec93-46c4-985b-9e53d7b1c316
  Future<BaseResponseList<Comment>> getComments({
    String username = 'me',
    DateBestSort sort = DateBestSort.newest,
    int page = 0,
  }) async {
    return BaseResponseList<Comment>.fromJson(json.decode((await client.request(
            HttpMethod.GET,
            '/3/account/$username/comments/${fmtType(sort)}/$page'))
        .body));
  }

  /// Associate images to account
  Future<BaseResponse> associate(String deletehashes) async {
    Map<String, String> body = {'deletehashes': deletehashes};

    return BaseResponse.fromJson(json.decode((await client.request(
            HttpMethod.POST, '/3/account/me/associateimages',
            body: body))
        .body));
  }

  /// Return a count of all of the comments associated with the account.
  /// https://apidocs.imgur.com/?version=latest#e67c348d-c235-4839-8041-7244ced0c7db
  Future<BaseResponse<int>> getCommentCount({String username = 'me'}) async {
    return BaseResponse<int>.fromJson(json.decode((await client.request(
            HttpMethod.GET, '/3/account/$username/comments/count'))
        .body));
  }

  /// Updates the account settings for a given user, the user must be logged in.
  /// https://apidocs.imgur.com/?version=latest#7bc88d39-d06d-4661-afff-38ea5b9a1d0a
  Future<BaseResponse<bool>> updateSettings({
    String bio,
    bool publicImages,
    bool messagingEnabled,
    bool acceptedGalleryTerms,
    bool showMature,
    bool newsletterSubscribed,
    Privacy albumPrivacy,
    String username,
    String avatar,
  }) async {
    final Map<String, String> body = {};

    if (bio != null) {
      body['bio'] = bio;
    }
    if (publicImages != null) {
      body['public_images'] = publicImages.toString();
    }
    if (messagingEnabled != null) {
      body['messaging_enabled'] = messagingEnabled.toString();
    }
    if (acceptedGalleryTerms != null) {
      body['accepted_gallery_terms'] = acceptedGalleryTerms.toString();
    }
    if (showMature != null) {
      body['showMature'] = showMature.toString();
    }
    if (newsletterSubscribed != null) {
      body['newsletterSubscribed'] = newsletterSubscribed.toString();
    }
    if (albumPrivacy != null) {
      body['albumPrivacy'] = fmtType(albumPrivacy);
    }
    if (username != null) {
      body['username'] = username;
    }
    if (avatar != null) {
      body['avatar'] = avatar;
    }

    return BaseResponse<bool>.fromJson(json.decode((await client
            .request(HttpMethod.PUT, '/3/account/me/settings', body: body))
        .body));
  }
}
