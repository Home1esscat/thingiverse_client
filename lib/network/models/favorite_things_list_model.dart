class FavoriteThingsCatalog {
  int? id;
  String? name;
  String? url;
  String? publicUrl;
  String? createdAt;
  String? thumbnail;
  String? previewImage;
  Creator? creator;
  int? isPrivate;
  int? isPurchased;
  int? isPublished;
  int? commentCount;
  int? makeCount;
  int? likeCount;
  List<Tags>? tags;

  FavoriteThingsCatalog({
    this.id,
    this.name,
    this.url,
    this.publicUrl,
    this.createdAt,
    this.thumbnail,
    this.previewImage,
    this.creator,
    this.isPrivate,
    this.isPurchased,
    this.isPublished,
    this.commentCount,
    this.makeCount,
    this.likeCount,
    this.tags,
  });

  FavoriteThingsCatalog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    publicUrl = json['public_url'];
    createdAt = json['created_at'];
    thumbnail = json['thumbnail'];
    previewImage = json['preview_image'];
    creator =
        json['creator'] != null ? Creator.fromJson(json['creator']) : null;
    isPrivate = json['is_private'];
    isPurchased = json['is_purchased'];
    isPublished = json['is_published'];
    commentCount = json['comment_count'];
    makeCount = json['make_count'];
    likeCount = json['like_count'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['public_url'] = this.publicUrl;
    data['created_at'] = this.createdAt;
    data['thumbnail'] = this.thumbnail;
    data['preview_image'] = this.previewImage;
    if (this.creator != null) {
      data['creator'] = this.creator!.toJson();
    }
    data['is_private'] = this.isPrivate;
    data['is_purchased'] = this.isPurchased;
    data['is_published'] = this.isPublished;
    data['comment_count'] = this.commentCount;
    data['make_count'] = this.makeCount;
    data['like_count'] = this.likeCount;
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Creator {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? url;
  String? publicUrl;
  String? thumbnail;
  int? countOfFollowers;
  int? countOfFollowing;
  int? countOfDesigns;
  bool? acceptsTips;
  bool? isFollowing;
  String? location;
  String? cover;

  Creator(
      {this.id,
      this.name,
      this.firstName,
      this.lastName,
      this.url,
      this.publicUrl,
      this.thumbnail,
      this.countOfFollowers,
      this.countOfFollowing,
      this.countOfDesigns,
      this.acceptsTips,
      this.isFollowing,
      this.location,
      this.cover});

  Creator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    url = json['url'];
    publicUrl = json['public_url'];
    thumbnail = json['thumbnail'];
    countOfFollowers = json['count_of_followers'];
    countOfFollowing = json['count_of_following'];
    countOfDesigns = json['count_of_designs'];
    acceptsTips = json['accepts_tips'];
    isFollowing = json['is_following'];
    location = json['location'];
    cover = json['cover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['url'] = this.url;
    data['public_url'] = this.publicUrl;
    data['thumbnail'] = this.thumbnail;
    data['count_of_followers'] = this.countOfFollowers;
    data['count_of_following'] = this.countOfFollowing;
    data['count_of_designs'] = this.countOfDesigns;
    data['accepts_tips'] = this.acceptsTips;
    data['is_following'] = this.isFollowing;
    data['location'] = this.location;
    data['cover'] = this.cover;
    return data;
  }
}

class Tags {
  String? name;
  String? tag;
  String? url;
  int? count;
  String? thingsUrl;
  String? absoluteUrl;

  Tags(
      {this.name,
      this.tag,
      this.url,
      this.count,
      this.thingsUrl,
      this.absoluteUrl});

  Tags.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    tag = json['tag'];
    url = json['url'];
    count = json['count'];
    thingsUrl = json['things_url'];
    absoluteUrl = json['absolute_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['tag'] = this.tag;
    data['url'] = this.url;
    data['count'] = this.count;
    data['things_url'] = this.thingsUrl;
    data['absolute_url'] = this.absoluteUrl;
    return data;
  }
}
