part of imgur.services;

/// A service for galleries.
///
/// https://apidocs.imgur.com/?version=latest#f9236628-fd66-4b4a-bf3c-fb65074dd560
class GalleryService extends BaseService {
  GalleryService(Imgur client) : super(client);

  /// Get a list of galleries with provided parameters.
  ///
  /// https://apidocs.imgur.com/?version=latest#eff60e84-5781-4c12-926a-208dc4c7cc94
  Future<List<GalleryAlbumImage>> list({
    int page = 0,
    Section section = Section.hot,
    ViralSort sort = ViralSort.time,
    Window window = Window.all,
    Query query = Query.q,
    bool showViral = true,
    bool showMature = false,
    bool albumPreviews = false,
  }) async =>
      BaseResponseList<
              GalleryAlbumImage>.fromJson(json.decode((await client.request(
                  HttpMethod.GET,
                  '/3/gallery/${fmtType(section)}/${fmtType(sort)}/${fmtType(window)}/$page?showViral=$showViral&mature=$showMature&album_previews=$albumPreviews'))
              .body))
          .data;

  /// Search the gallery with a given query.
  ///
  /// https://apidocs.imgur.com/?version=latest#3c981acf-47aa-488f-b068-269f65aee3ce
  Future<List<GalleryAlbumImage>> search(
    String search, {
    int page = 0,
    ViralSort sort = ViralSort.time,
    Window window = Window.all,
    Query query = Query.q,
  }) async =>
      BaseResponseList<
              GalleryAlbumImage>.fromJson(json.decode((await client.request(
                  HttpMethod.GET,
                  '/3/gallery/search/${fmtType(sort)}/${fmtType(window)}/$page?${fmtType(query)}=$search'))
              .body))
          .data;

  /// Get suggestions based on your search.
  Future<List<String>> searchSuggestions(String search) async =>
      BaseResponseList<String>.fromJson(json.decode((await client.request(
                  HttpMethod.GET, '/3/reaction/suggest?q=$search'))
              .body))
          .data;
}
