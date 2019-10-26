part of imgur.services;

/// A service for user's account.
///
/// https://apidocs.imgur.com/?version=latest#a94d108b-d6e3-4e68-9521-47ea79501c85
class AccountService extends BaseService {
  AccountService(Imgur client) : super(client);

  /// Associate images to account.
  Future<AssociateImage> associate(String deleteHashes) async {
    final body = {'deletehashes': deleteHashes};

    return BaseResponse<AssociateImage>.fromJson(json.decode((await client
                .request(HttpMethod.POST, '/3/account/me/associateimages',
                    body: body))
            .body))
        .data;
  }

  /// If authenticated, get the list of available avatars for the given user.
  ///
  /// https://apidocs.imgur.com/?version=latest#ff70e965-286b-4a36-9745-de646aedfb81
  Future<AvatarListData> getAvailableAvatars({String username = 'me'}) async =>
      BaseResponse<AvatarListData>.fromJson(json.decode((await client.request(
                  HttpMethod.GET, '/3/account/$username/available_avatars'))
              .body))
          .data;

  /// Get the current account's avatar URL and avatar name.
  ///
  /// https://apidocs.imgur.com/?version=latest#6427d23d-2ad2-44e3-846d-65d7b042afbd
  Future<AvatarData> getAvatar({String username = 'me'}) async =>
      BaseResponse<AvatarData>.fromJson(json.decode((await client.request(
                  HttpMethod.GET, '/3/account/$username/avatar'))
              .body))
          .data;

  /// Return a count of all of the comments associated with the account.
  ///
  /// https://apidocs.imgur.com/?version=latest#e67c348d-c235-4839-8041-7244ced0c7db
  Future<int> getCommentCount({String username = 'me'}) async =>
      BaseResponse<int>.fromJson(json.decode((await client.request(
                  HttpMethod.GET, '/3/account/$username/comments/count'))
              .body))
          .data;

  /// Return the comments the user has created.
  ///
  /// https://apidocs.imgur.com/?version=latest#a1813588-ec93-46c4-985b-9e53d7b1c316
  Future<List<Comment>> getComments({
    String username = 'me',
    DateBestSort sort = DateBestSort.newest,
    int page = 0,
  }) async =>
      BaseResponseList<Comment>.fromJson(json.decode((await client.request(
                  HttpMethod.GET,
                  '/3/account/$username/comments/${fmtType(sort)}/$page'))
              .body))
          .data;

  /// Return the user's favorite images in the gallery.
  ///
  /// https://apidocs.imgur.com/?version=latest#56a1d1ff-d203-4a6e-b54e-e49f9bdfbc0d
  Future<List<GalleryAlbumImage>> getFavoriteGalleries({
    String username = 'me',
    int page = 0,
    FavoriteSort sort = FavoriteSort.newest,
  }) async =>
      BaseResponseList<
              GalleryAlbumImage>.fromJson(json.decode((await client.request(
                  HttpMethod.GET,
                  '/3/account/$username/gallery_favorites/$page/${fmtType(sort)}'))
              .body))
          .data;

  /// Returns the user's favorite images, only accessible if you're logged
  /// in as the user.
  ///
  /// https://apidocs.imgur.com/?version=latest#a432a8e6-2ece-4544-bc7a-2999eb586f06
  Future<List<GalleryAlbumImage>> getFavoriteImages({
    String username = 'me',
    int page = 0,
    FavoriteSort sort = FavoriteSort.newest,
  }) async =>
      BaseResponseList<GalleryAlbumImage>.fromJson(json.decode(
              (await client.request(HttpMethod.GET,
                      '/3/account/$username/favorites/$page/${fmtType(sort)}'))
                  .body))
          .data;

  /// Returns the total number of images associated with the account.
  ///
  /// https://apidocs.imgur.com/?version=latest#2c9edd88-e763-43b4-8ca8-557609d197c3
  Future<int> getImageCount({String username = 'me'}) async =>
      BaseResponse<int>.fromJson(json.decode((await client.request(
                  HttpMethod.GET, '/3/account/$username/images/count'))
              .body))
          .data;

  /// Return all of the images associated with the account.
  ///
  /// https://apidocs.imgur.com/?version=latest#2e45daca-bd44-47f8-84b0-b3f2aa861735
  Future<List<Image>> getImages({String username = 'me', int page = 0}) async =>
      BaseResponseList<Image>.fromJson(json.decode((await client.request(
                  HttpMethod.GET, '/3/account/$username/images/$page'))
              .body))
          .data;

  /// Returns the account settings, only accessible if you're logged in as the
  /// user.
  ///
  /// https://apidocs.imgur.com/?version=latest#ce57e346-3515-4381-a772-ef5ade60bdee
  Future<AccountSettings> getSettings() async =>
      BaseResponse<AccountSettings>.fromJson(json.decode(
              (await client.request(HttpMethod.GET, '/3/account/me/settings'))
                  .body))
          .data;

  /// Return the images a user has submitted to the gallery.
  ///
  /// You can add sorting as well after paging. Sorts can be:
  /// [DateBestSort.newest] (default), [DateBestSort.oldest],
  /// [DateBestSort.worst], [DateBestSort.best].
  Future<List<GalleryAlbumImage>> getSubmissions({
    String username = 'me',
    int page = 0,
    DateBestSort sort = DateBestSort.newest,
  }) async =>
      BaseResponseList<
              GalleryAlbumImage>.fromJson(json.decode((await client.request(
                  HttpMethod.GET,
                  '/3/account/$username/submissions/$page/${fmtType(sort)}'))
              .body))
          .data;

  /// Updates the account settings for a given user, the user must be logged in.
  ///
  /// https://apidocs.imgur.com/?version=latest#7bc88d39-d06d-4661-afff-38ea5b9a1d0a
  Future<bool> updateSettings({
    /// The biography of the user, is displayed in the gallery profile page.
    String bio,

    /// Set the users images to private or public by default.
    bool publicImages,

    /// Allows the user to enable / disable private messages.
    bool messagingEnabled,

    /// The user agreement to the Imgur Gallery terms.
    bool acceptedGalleryTerms,

    /// Toggle display of mature images in gallery list endpoints.
    bool showMature,

    /// Toggle subscription to email newsletter.
    bool newsletterSubscribed,

    /// Sets the default privacy level of albums the users creates.
    Privacy albumPrivacy,

    /// A valid Imgur username (between 4 and 63 alphanumeric characters).
    String username,
  }) async {
    final body = <String, String>{};

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

    return BaseResponse<bool>.fromJson(json.decode((await client
                .request(HttpMethod.PUT, '/3/account/me/settings', body: body))
            .body))
        .data;
  }
}
