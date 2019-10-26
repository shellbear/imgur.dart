part of imgur.common;

/// A class representing a basic response.
class BaseResponse<T> {
  final bool success;
  final int status;
  T data;

  BaseResponse({this.success, this.status, this.data});

  /// Initialize a [BaseResponse] instance from Json data.
  BaseResponse.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        status = json['status'],
        data = _DynamicConverter<T>().fromJson(json['data']);
}

/// A class similar to BaseResponse, except that it contains a data array
/// instead of a single element.
class BaseResponseList<T> {
  bool success;
  int status;
  List<T> data;

  BaseResponseList({this.data, this.success, this.status});

  /// Initialize a [BaseResponseList] instance from Json data.
  BaseResponseList.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        status = json['status'],
        data = List<T>.from(
            ((json['data'] as List<dynamic>)?.cast<Map<String, dynamic>>())
                ?.map(_DynamicConverter<T>().fromJson)
                ?.toList());
}

/// An helper class that converts JSON types to class and vice versa.
class _DynamicConverter<T> implements JsonConverter<T, Object> {
  _DynamicConverter();

  /// [fromJson] takes a json [Object] and converts it to an Imgur model.
  ///
  /// If the type isn't a [BaseModel] instance then the type is returned
  /// without conversion.
  @override
  T fromJson(Object json) {
    switch (T) {
      case AccountSettings:
        return AccountSettings.fromJson(json) as T;
      case Account:
        return Account.fromJson(json) as T;
      case Album:
        return Album.fromJson(json) as T;
      case Avatar:
        return Avatar.fromJson(json) as T;
      case AvatarData:
        return AvatarData.fromJson(json) as T;
      case AvatarListData:
        return AvatarListData.fromJson(json) as T;
      case BlockedUser:
        return BlockedUser.fromJson(json) as T;
      case Comment:
        return Comment.fromJson(json) as T;
      case Conversation:
        return Conversation.fromJson(json) as T;
      case CustomGallery:
        return CustomGallery.fromJson(json) as T;
      case GalleryAlbum:
        return GalleryAlbum.fromJson(json) as T;
      case GalleryAlbumImage:
        return GalleryAlbumImage.fromJson(json) as T;
      case GalleryImage:
        return GalleryAlbum.fromJson(json) as T;
      case GalleryProfile:
        return GalleryProfile.fromJson(json) as T;
      case Image:
        return Image.fromJson(json) as T;
      case MemeMetadata:
        return MemeMetadata.fromJson(json) as T;
      case Message:
        return Message.fromJson(json) as T;
      case Notification:
        return Notification.fromJson(json) as T;
      case RawId:
        return RawId.fromJson(json) as T;
      case TagVote:
        return TagVote.fromJson(json) as T;
      case Tag:
        return Tag.fromJson(json) as T;
      case Topic:
        return Topic.fromJson(json) as T;
      case Trophy:
        return Trophy.fromJson(json) as T;
      case Vote:
        return Vote.fromJson(json) as T;
    }

    return json as T;
  }

  /// [toJson] returns the json representation of an [Object].
  ///
  /// If the given object inherits from [BaseModel], the [toJson] method is
  /// called, otherwise the object is returned as is.
  @override
  Object toJson(T object) {
    if (T is BaseModel) {
      return (object as BaseModel).toJson();
    }

    return T;
  }
}
