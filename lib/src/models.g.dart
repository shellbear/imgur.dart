// GENERATED CODE - DO NOT MODIFY BY HAND

part of imgur.models;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    id: json['id'] as String,
    url: json['url'] as String,
    bio: json['bio'] as String,
    reputation: (json['reputation'] as num)?.toDouble(),
    created: _dateTimeFromTimestamp(json['created'] as int),
    proExpiration: json['pro_expiration'],
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'bio': instance.bio,
      'reputation': instance.reputation,
      'created': _dateTimeToTimestamp(instance.created),
      'pro_expiration': instance.proExpiration,
    };

AccountSettings _$AccountSettingsFromJson(Map<String, dynamic> json) {
  return AccountSettings(
    accountUrl: json['account_url'] as String,
    email: json['email'] as String,
    publicImages: json['public_images'] as bool,
    albumPrivacy: json['album_privacy'] as String,
    proExpiration: json['pro_expiration'],
    acceptedGalleryTerms: json['accepted_gallery_terms'] as bool,
    activeEmails:
        (json['active_emails'] as List)?.map((e) => e as String)?.toList(),
    messagingEnabled: json['messaging_enabled'] as bool,
    blockedUsers: (json['blocked_users'] as List)
        ?.map((e) =>
            e == null ? null : BlockedUser.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    showMature: json['show_mature'] as bool,
    firstParty: json['first_party'] as bool,
  );
}

Map<String, dynamic> _$AccountSettingsToJson(AccountSettings instance) =>
    <String, dynamic>{
      'account_url': instance.accountUrl,
      'email': instance.email,
      'public_images': instance.publicImages,
      'album_privacy': instance.albumPrivacy,
      'pro_expiration': instance.proExpiration,
      'accepted_gallery_terms': instance.acceptedGalleryTerms,
      'active_emails': instance.activeEmails,
      'messaging_enabled': instance.messagingEnabled,
      'blocked_users': baseModelListToJson(instance.blockedUsers),
      'show_mature': instance.showMature,
      'first_party': instance.firstParty,
    };

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return Album(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    datetime: _dateTimeFromTimestamp(json['datetime'] as int),
    cover: json['cover'] as String,
    coverWidth: json['coverWidth'] as int,
    coverHeight: json['cover_height'] as int,
    accountUrl: json['account_url'] as String,
    accountId: json['account_id'] as int,
    privacy: json['privacy'] as String,
    layout: json['layout'] as String,
    views: json['views'] as int,
    link: json['link'] as String,
    favorite: json['favorite'] as bool,
    nsfw: json['nsfw'] as bool,
    section: json['section'] as String,
    order: json['order'] as int,
    imagesCount: json['images_count'] as int,
    images: (json['images'] as List)
        ?.map(
            (e) => e == null ? null : Image.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    inGallery: json['in_gallery'] as bool,
    deleteHash: json['deletehash'] as String,
  );
}

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'datetime': _dateTimeToTimestamp(instance.datetime),
      'cover': instance.cover,
      'coverWidth': instance.coverWidth,
      'cover_height': instance.coverHeight,
      'account_url': instance.accountUrl,
      'account_id': instance.accountId,
      'privacy': instance.privacy,
      'layout': instance.layout,
      'views': instance.views,
      'link': instance.link,
      'favorite': instance.favorite,
      'nsfw': instance.nsfw,
      'section': instance.section,
      'order': instance.order,
      'images_count': instance.imagesCount,
      'images': baseModelListToJson(instance.images),
      'in_gallery': instance.inGallery,
      'deletehash': instance.deleteHash,
    };

AssociateImage _$AssociateImageFromJson(Map<String, dynamic> json) {
  return AssociateImage(
    imagesUpdated: json['images_updated'] as int,
  );
}

Map<String, dynamic> _$AssociateImageToJson(AssociateImage instance) =>
    <String, dynamic>{
      'images_updated': instance.imagesUpdated,
    };

Avatar _$AvatarFromJson(Map<String, dynamic> json) {
  return Avatar(
    name: json['name'] as String,
    location: json['location'] as String,
  );
}

Map<String, dynamic> _$AvatarToJson(Avatar instance) => <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
    };

AvatarData _$AvatarDataFromJson(Map<String, dynamic> json) {
  return AvatarData(
    name: json['avatar_name'] as String,
    location: json['avatar'] as String,
  );
}

Map<String, dynamic> _$AvatarDataToJson(AvatarData instance) =>
    <String, dynamic>{
      'avatar_name': instance.name,
      'avatar': instance.location,
    };

AvatarListData _$AvatarListDataFromJson(Map<String, dynamic> json) {
  return AvatarListData(
    availableAvatars: (json['available_avatars'] as List)
        ?.map((e) =>
            e == null ? null : Avatar.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    availableAvatarsCount: json['available_avatars_count'] as int,
    avatarsAreDefault: json['avatars_are_default'] as bool,
  );
}

Map<String, dynamic> _$AvatarListDataToJson(AvatarListData instance) =>
    <String, dynamic>{
      'available_avatars': baseModelListToJson(instance.availableAvatars),
      'available_avatars_count': instance.availableAvatarsCount,
      'avatars_are_default': instance.avatarsAreDefault,
    };

BlockedUser _$BlockedUserFromJson(Map<String, dynamic> json) {
  return BlockedUser(
    id: json['blocked_id'] as String,
    url: json['blocked_url'] as String,
  );
}

Map<String, dynamic> _$BlockedUserToJson(BlockedUser instance) =>
    <String, dynamic>{
      'blocked_id': instance.id,
      'blocked_url': instance.url,
    };

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    id: json['id'] as int,
    comment: json['comment'] as String,
    albumCover: json['album_cover'] as String,
    imageId: json['image_id'] as String,
    onAlbum: json['on_album'] as bool,
    ups: json['ups'] as int,
    downs: json['downs'] as int,
    points: (json['points'] as num)?.toDouble(),
    datetime: _dateTimeFromTimestamp(json['datetime'] as int),
    author: json['author'] as String,
    authorId: json['author_id'] as int,
    parentId: json['parent_id'] as int,
    deleted: json['deleted'] as bool,
    vote: stringToVote(json['vote'] as String),
    children: (json['children'] as List)
        ?.map((e) =>
            e == null ? null : Comment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'image_id': instance.imageId,
      'comment': instance.comment,
      'author': instance.author,
      'author_id': instance.authorId,
      'on_album': instance.onAlbum,
      'album_cover': instance.albumCover,
      'ups': instance.ups,
      'downs': instance.downs,
      'points': instance.points,
      'datetime': _dateTimeToTimestamp(instance.datetime),
      'parent_id': instance.parentId,
      'deleted': instance.deleted,
      'vote': voteToString(instance.vote),
      'children': baseModelListToJson(instance.children),
    };

Conversation _$ConversationFromJson(Map<String, dynamic> json) {
  return Conversation(
    id: json['id'] as int,
    lastMessagePreview: json['last_message_preview'] as String,
    datetime: _dateTimeFromTimestamp(json['datetime'] as int),
    withAccountId: json['with_account_id'] as int,
    withAccount: json['with_account'] as String,
    messageCount: json['message_count'] as int,
    messages: (json['messages'] as List)
        ?.map((e) =>
            e == null ? null : Message.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    done: json['done'] as bool,
    page: json['page'] as int,
  );
}

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'last_message_preview': instance.lastMessagePreview,
      'datetime': _dateTimeToTimestamp(instance.datetime),
      'with_account_id': instance.withAccountId,
      'with_account': instance.withAccount,
      'message_count': instance.messageCount,
      'messages': instance.messages,
      'done': instance.done,
      'page': instance.page,
    };

CustomGallery _$CustomGalleryFromJson(Map<String, dynamic> json) {
  return CustomGallery(
    accountUrl: json['account_url'] as String,
    link: json['link'] as String,
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    itemCount: json['item_count'] as int,
    items: json['items'] as List,
  );
}

Map<String, dynamic> _$CustomGalleryToJson(CustomGallery instance) =>
    <String, dynamic>{
      'account_url': instance.accountUrl,
      'link': instance.link,
      'tags': instance.tags,
      'item_count': instance.itemCount,
      'items': instance.items,
    };

GalleryAlbum _$GalleryAlbumFromJson(Map<String, dynamic> json) {
  return GalleryAlbum(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    datetime: _dateTimeFromTimestamp(json['datetime'] as int),
    cover: json['cover'] as String,
    coverWidth: json['cover_width'] as int,
    coverHeight: json['cover_height'] as int,
    accountUrl: json['account_url'] as String,
    accountId: json['account_id'] as int,
    privacy: json['privacy'] as String,
    layout: json['layout'] as String,
    views: json['views'] as int,
    link: json['link'] as String,
    ups: json['ups'] as int,
    downs: json['downs'] as int,
    points: json['points'] as int,
    score: json['score'] as int,
    isAlbum: json['is_album'] as bool,
    vote: stringToVote(json['vote'] as String),
    favorite: json['favorite'] as bool,
    nsfw: json['nsfw'] as bool,
    commentCount: json['comment_count'] as int,
    topic: json['topic'] as String,
    topicId: json['topic_id'],
    imagesCount: json['images_count'] as int,
    images: (json['images'] as List)
        ?.map(
            (e) => e == null ? null : Image.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    inMostViral: json['in_most_viral'],
    favoriteCount: json['favorite_count'] as int,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GalleryAlbumToJson(GalleryAlbum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'datetime': _dateTimeToTimestamp(instance.datetime),
      'cover': instance.cover,
      'cover_width': instance.coverWidth,
      'cover_height': instance.coverHeight,
      'account_url': instance.accountUrl,
      'account_id': instance.accountId,
      'privacy': instance.privacy,
      'layout': instance.layout,
      'views': instance.views,
      'link': instance.link,
      'ups': instance.ups,
      'downs': instance.downs,
      'points': instance.points,
      'score': instance.score,
      'is_album': instance.isAlbum,
      'vote': voteToString(instance.vote),
      'favorite_count': instance.favoriteCount,
      'tags': baseModelListToJson(instance.tags),
      'favorite': instance.favorite,
      'nsfw': instance.nsfw,
      'comment_count': instance.commentCount,
      'topic': instance.topic,
      'topic_id': instance.topicId,
      'images_count': instance.imagesCount,
      'images': baseModelListToJson(instance.images),
      'in_most_viral': instance.inMostViral,
    };

GalleryAlbumImage _$GalleryAlbumImageFromJson(Map<String, dynamic> json) {
  return GalleryAlbumImage(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    datetime: _dateTimeFromTimestamp(json['datetime'] as int),
    cover: json['cover'] as String,
    coverWidth: json['cover_width'] as int,
    coverHeight: json['cover_height'] as int,
    accountUrl: json['account_url'] as String,
    accountId: json['account_id'] as int,
    privacy: json['privacy'] as String,
    layout: json['layout'] as String,
    views: json['views'] as int,
    favoriteCount: json['favorite_count'] as int,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hasSound: json['has_sound'] as bool,
    link: json['link'] as String,
    ups: json['ups'] as int,
    downs: json['downs'] as int,
    points: json['points'] as int,
    score: json['score'] as int,
    isAlbum: json['is_album'] as bool,
    vote: stringToVote(json['vote'] as String),
    favorite: json['favorite'] as bool,
    nsfw: json['nsfw'] as bool,
    commentCount: json['comment_count'] as int,
    topic: json['topic'] as String,
    topicId: json['topic_id'],
    imagesCount: json['images_count'] as int,
    images: (json['images'] as List)
        ?.map(
            (e) => e == null ? null : Image.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    inMostViral: json['in_most_viral'],
    type: json['type'] as String,
    animated: json['animated'] as bool,
    width: json['width'] as int,
    height: json['height'] as int,
    size: json['size'] as int,
    bandwidth: json['bandwidth'] as int,
    deletehash: json['deletehash'] as String,
    gifv: json['gifv'] as String,
    mp4: json['mp4'] as String,
    mp4Size: json['mp4_size'] as int,
    looping: json['looping'] as bool,
  );
}

Map<String, dynamic> _$GalleryAlbumImageToJson(GalleryAlbumImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'datetime': _dateTimeToTimestamp(instance.datetime),
      'cover': instance.cover,
      'cover_width': instance.coverWidth,
      'cover_height': instance.coverHeight,
      'account_url': instance.accountUrl,
      'account_id': instance.accountId,
      'privacy': instance.privacy,
      'layout': instance.layout,
      'views': instance.views,
      'link': instance.link,
      'ups': instance.ups,
      'downs': instance.downs,
      'points': instance.points,
      'score': instance.score,
      'is_album': instance.isAlbum,
      'vote': voteToString(instance.vote),
      'favorite_count': instance.favoriteCount,
      'tags': baseModelListToJson(instance.tags),
      'has_sound': instance.hasSound,
      'favorite': instance.favorite,
      'nsfw': instance.nsfw,
      'comment_count': instance.commentCount,
      'topic': instance.topic,
      'topic_id': instance.topicId,
      'images_count': instance.imagesCount,
      'images': baseModelListToJson(instance.images),
      'in_most_viral': instance.inMostViral,
      'type': instance.type,
      'animated': instance.animated,
      'width': instance.width,
      'height': instance.height,
      'size': instance.size,
      'bandwidth': instance.bandwidth,
      'deletehash': instance.deletehash,
      'gifv': instance.gifv,
      'mp4': instance.mp4,
      'mp4_size': instance.mp4Size,
      'looping': instance.looping,
    };

GalleryImage _$GalleryImageFromJson(Map<String, dynamic> json) {
  return GalleryImage(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    datetime: _dateTimeFromTimestamp(json['datetime'] as int),
    type: json['type'] as String,
    animated: json['animated'] as bool,
    width: json['width'] as int,
    height: json['height'] as int,
    size: json['size'] as int,
    views: json['views'] as int,
    bandwidth: json['bandwidth'] as int,
    deleteHash: json['deleteHash'] as String,
    link: json['link'] as String,
    gifv: json['gifv'] as String,
    mp4: json['mp4'] as String,
    mp4Size: json['mp4_size'] as int,
    looping: json['looping'] as bool,
    vote: stringToVote(json['vote'] as String),
    favorite: json['favorite'] as bool,
    favoriteCount: json['favorite_count'] as int,
    hasSound: json['has_sound'] as bool,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nsfw: json['nsfw'] as bool,
    commentCount: json['comment_count'] as int,
    topic: json['topic'] as String,
    topicId: json['topic_id'],
    section: json['section'] as String,
    accountUrl: json['account_url'] as String,
    accountId: json['account_id'] as int,
    ups: json['ups'] as int,
    downs: json['downs'] as int,
    points: json['points'] as int,
    score: json['score'] as int,
    isAlbum: json['is_album'] as bool,
    inMostViral: json['in_most_viral'],
  );
}

Map<String, dynamic> _$GalleryImageToJson(GalleryImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'datetime': _dateTimeToTimestamp(instance.datetime),
      'type': instance.type,
      'animated': instance.animated,
      'width': instance.width,
      'height': instance.height,
      'size': instance.size,
      'views': instance.views,
      'bandwidth': instance.bandwidth,
      'deleteHash': instance.deleteHash,
      'link': instance.link,
      'gifv': instance.gifv,
      'mp4': instance.mp4,
      'mp4_size': instance.mp4Size,
      'looping': instance.looping,
      'vote': voteToString(instance.vote),
      'favorite': instance.favorite,
      'nsfw': instance.nsfw,
      'comment_count': instance.commentCount,
      'topic': instance.topic,
      'topic_id': instance.topicId,
      'section': instance.section,
      'account_url': instance.accountUrl,
      'favorite_count': instance.favoriteCount,
      'tags': baseModelListToJson(instance.tags),
      'has_sound': instance.hasSound,
      'account_id': instance.accountId,
      'ups': instance.ups,
      'downs': instance.downs,
      'points': instance.points,
      'score': instance.score,
      'is_album': instance.isAlbum,
      'in_most_viral': instance.inMostViral,
    };

GalleryProfile _$GalleryProfileFromJson(Map<String, dynamic> json) {
  return GalleryProfile(
    totalGalleryComments: json['total_gallery_comments'] as int,
    totalGalleryFavorites: json['total_gallery_favorites'] as int,
    totalGallerySubmissions: json['total_gallery_submissions'] as int,
    trophies: (json['trophies'] as List)
        ?.map((e) =>
            e == null ? null : Trophy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GalleryProfileToJson(GalleryProfile instance) =>
    <String, dynamic>{
      'total_gallery_comments': instance.totalGalleryComments,
      'total_gallery_favorites': instance.totalGalleryFavorites,
      'total_gallery_submissions': instance.totalGallerySubmissions,
      'trophies': baseModelListToJson(instance.trophies),
    };

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    datetime: _dateTimeFromTimestamp(json['datetime'] as int),
    type: json['type'] as String,
    animated: json['animated'] as bool,
    width: json['width'] as int,
    height: json['height'] as int,
    size: json['size'] as int,
    views: json['views'] as int,
    bandwidth: json['bandwidth'] as int,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    link: json['link'] as String,
    vote: stringToVote(json['vote'] as String),
    favorite: json['favorite'] as bool,
    favoriteCount: json['favorite_count'] as int,
    nsfw: json['nsfw'] as bool,
    hasSound: json['has_sound'] as bool,
    commentCount: json['comment_count'] as int,
    topic: json['topic'] as String,
    topicId: json['topic_id'],
    section: json['section'] as String,
    accountUrl: json['account_url'] as String,
    accountId: json['account_id'] as int,
    ups: json['ups'] as int,
    downs: json['downs'] as int,
    points: json['points'] as int,
    score: json['score'] as int,
    isAlbum: json['is_album'] as bool,
    inMostViral: json['in_most_viral'],
    deleteHash: json['deleteHash'] as String,
    gifv: json['gifv'] as String,
    mp4: json['mp4'] as String,
    mp4Size: json['mp4Size'] as int,
    looping: json['looping'] as bool,
  );
}

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'datetime': _dateTimeToTimestamp(instance.datetime),
      'favorite_count': instance.favoriteCount,
      'tags': baseModelListToJson(instance.tags),
      'has_sound': instance.hasSound,
      'type': instance.type,
      'animated': instance.animated,
      'width': instance.width,
      'height': instance.height,
      'size': instance.size,
      'views': instance.views,
      'bandwidth': instance.bandwidth,
      'link': instance.link,
      'vote': voteToString(instance.vote),
      'favorite': instance.favorite,
      'nsfw': instance.nsfw,
      'comment_count': instance.commentCount,
      'topic': instance.topic,
      'topic_id': instance.topicId,
      'section': instance.section,
      'account_url': instance.accountUrl,
      'account_id': instance.accountId,
      'ups': instance.ups,
      'downs': instance.downs,
      'points': instance.points,
      'score': instance.score,
      'is_album': instance.isAlbum,
      'in_most_viral': instance.inMostViral,
      'deleteHash': instance.deleteHash,
      'gifv': instance.gifv,
      'mp4': instance.mp4,
      'mp4Size': instance.mp4Size,
      'looping': instance.looping,
    };

MemeMetadata _$MemeMetadataFromJson(Map<String, dynamic> json) {
  return MemeMetadata(
    name: json['meme_name'] as String,
    topText: json['top_text'] as String,
    bottomText: json['bottom_text'] as String,
    bgImage: json['bg_image'] as String,
  );
}

Map<String, dynamic> _$MemeMetadataToJson(MemeMetadata instance) =>
    <String, dynamic>{
      'meme_name': instance.name,
      'top_text': instance.topText,
      'bottom_text': instance.bottomText,
      'bg_image': instance.bgImage,
    };

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    id: json['id'] as int,
    from: json['from'] as String,
    accountId: json['account_id'] as int,
    senderId: json['sender_id'] as int,
    body: json['body'] as String,
    conversationId: json['conversation_id'] as int,
    datetime: _dateTimeFromTimestamp(json['datetime'] as int),
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'account_id': instance.accountId,
      'sender_id': instance.senderId,
      'body': instance.body,
      'conversation_id': instance.conversationId,
      'datetime': _dateTimeToTimestamp(instance.datetime),
    };

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return Notification(
    id: json['id'] as int,
    accountId: json['account_id'] as int,
    viewed: json['viewed'] as bool,
    content: json['content'],
  );
}

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account_id': instance.accountId,
      'viewed': instance.viewed,
      'content': instance.content,
    };

RawId _$RawIdFromJson(Map<String, dynamic> json) {
  return RawId(
    id: json['id'],
  );
}

Map<String, dynamic> _$RawIdToJson(RawId instance) => <String, dynamic>{
      'id': instance.id,
    };

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    name: json['name'] as String,
    followers: json['followers'] as int,
    totalItems: json['total_items'] as int,
    following: json['following'] as bool,
    items: json['items'] as List,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'name': instance.name,
      'followers': instance.followers,
      'total_items': instance.totalItems,
      'following': instance.following,
      'items': instance.items,
    };

TagVote _$TagVoteFromJson(Map<String, dynamic> json) {
  return TagVote(
    ups: json['ups'] as int,
    downs: json['downs'] as int,
    name: json['name'] as String,
    author: json['author'] as String,
  );
}

Map<String, dynamic> _$TagVoteToJson(TagVote instance) => <String, dynamic>{
      'ups': instance.ups,
      'downs': instance.downs,
      'name': instance.name,
      'author': instance.author,
    };

Topic _$TopicFromJson(Map<String, dynamic> json) {
  return Topic(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    css: json['css'] as String,
    ephemeral: json['ephemeral'] as bool,
    topPost: json['topPost'],
    heroImage: json['heroImage'] == null
        ? null
        : Image.fromJson(json['heroImage'] as Map<String, dynamic>),
    isHero: json['isHero'] as bool,
  );
}

Map<String, dynamic> _$TopicToJson(Topic instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'css': instance.css,
      'ephemeral': instance.ephemeral,
      'topPost': instance.topPost,
      'heroImage': instance.heroImage,
      'isHero': instance.isHero,
    };

Trophy _$TrophyFromJson(Map<String, dynamic> json) {
  return Trophy(
    id: json['id'] as int,
    name: json['name'] as String,
    nameClean: json['name_clean'] as String,
    description: json['description'] as String,
    data: json['data'] as String,
    dataLink: json['data_link'] as String,
    datetime: _dateTimeFromTimestamp(json['datetime'] as int),
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$TrophyToJson(Trophy instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_clean': instance.nameClean,
      'description': instance.description,
      'data': instance.data,
      'data_link': instance.dataLink,
      'datetime': _dateTimeToTimestamp(instance.datetime),
      'image': instance.image,
    };

Vote _$VoteFromJson(Map<String, dynamic> json) {
  return Vote(
    ups: json['ups'] as int,
    downs: json['downs'] as int,
  );
}

Map<String, dynamic> _$VoteToJson(Vote instance) => <String, dynamic>{
      'ups': instance.ups,
      'downs': instance.downs,
    };
