class SingleThing {
  int? id;
  String? name;
  String? thumbnail;
  String? url;
  String? publicUrl;
  Creator? creator;
  String? added;
  String? modified;
  int? isPublished;
  int? isWip;
  bool? isFeatured;
  bool? isNsfw;
  int? likeCount;
  bool? isLiked;
  int? collectCount;
  bool? isCollected;
  int? commentCount;
  bool? isWatched;
  DefaultImage? defaultImage;
  String? description;
  String? instructions;
  String? descriptionHtml;
  String? instructionsHtml;
  String? details;
  List<DetailsParts>? detailsParts;
  String? eduDetails;
  String? license;
  bool? allowsDerivatives;
  String? filesUrl;
  String? imagesUrl;
  String? likesUrl;
  String? ancestorsUrl;
  String? derivativesUrl;
  String? categoriesUrl;
  int? fileCount;
  int? layoutCount;
  String? layoutsUrl;
  int? isPrivate;
  int? isPurchased;
  bool? inLibrary;
  int? printHistoryCount;
  int? appId;
  int? downloadCount;
  int? viewCount;
  int? remixCount;
  int? makeCount;
  int? appCount;
  int? rootCommentCount;
  String? moderation;
  bool? isDerivative;
  List<Ancestors>? ancestors;
  bool? canComment;
  String? typeName;

  SingleThing(
      {this.id,
      this.name,
      this.thumbnail,
      this.url,
      this.publicUrl,
      this.creator,
      this.added,
      this.modified,
      this.isPublished,
      this.isWip,
      this.isFeatured,
      this.isNsfw,
      this.likeCount,
      this.isLiked,
      this.collectCount,
      this.isCollected,
      this.commentCount,
      this.isWatched,
      this.defaultImage,
      this.description,
      this.instructions,
      this.descriptionHtml,
      this.instructionsHtml,
      this.details,
      this.detailsParts,
      this.eduDetails,
      this.license,
      this.allowsDerivatives,
      this.filesUrl,
      this.imagesUrl,
      this.likesUrl,
      this.ancestorsUrl,
      this.derivativesUrl,
      this.categoriesUrl,
      this.fileCount,
      this.layoutCount,
      this.layoutsUrl,
      this.isPrivate,
      this.isPurchased,
      this.inLibrary,
      this.printHistoryCount,
      this.appId,
      this.downloadCount,
      this.viewCount,
      this.remixCount,
      this.makeCount,
      this.appCount,
      this.rootCommentCount,
      this.moderation,
      this.isDerivative,
      this.ancestors,
      this.canComment,
      this.typeName});

  SingleThing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    thumbnail = json['thumbnail'];
    url = json['url'];
    publicUrl = json['public_url'];
    creator =
        json['creator'] != null ? Creator.fromJson(json['creator']) : null;
    added = json['added'];
    modified = json['modified'];
    isPublished = json['is_published'];
    isWip = json['is_wip'];
    isFeatured = json['is_featured'];
    isNsfw = json['is_nsfw'];
    likeCount = json['like_count'];
    isLiked = json['is_liked'];
    collectCount = json['collect_count'];
    isCollected = json['is_collected'];
    commentCount = json['comment_count'];
    isWatched = json['is_watched'];
    defaultImage = json['default_image'] != null
        ? DefaultImage.fromJson(json['default_image'])
        : null;
    description = json['description'];
    instructions = json['instructions'];
    descriptionHtml = json['description_html'];
    instructionsHtml = json['instructions_html'];
    details = json['details'];
    if (json['details_parts'] != null) {
      detailsParts = <DetailsParts>[];
      json['details_parts'].forEach((v) {
        detailsParts!.add(DetailsParts.fromJson(v));
      });
    }
    eduDetails = json['edu_details'];
    license = json['license'];
    allowsDerivatives = json['allows_derivatives'];
    filesUrl = json['files_url'];
    imagesUrl = json['images_url'];
    likesUrl = json['likes_url'];
    ancestorsUrl = json['ancestors_url'];
    derivativesUrl = json['derivatives_url'];
    categoriesUrl = json['categories_url'];
    fileCount = json['file_count'];
    layoutCount = json['layout_count'];
    layoutsUrl = json['layouts_url'];
    isPrivate = json['is_private'];
    isPurchased = json['is_purchased'];
    inLibrary = json['in_library'];
    printHistoryCount = json['print_history_count'];
    appId = json['app_id'];
    downloadCount = json['download_count'];
    viewCount = json['view_count'];
    remixCount = json['remix_count'];
    makeCount = json['make_count'];
    appCount = json['app_count'];
    rootCommentCount = json['root_comment_count'];
    moderation = json['moderation'];
    isDerivative = json['is_derivative'];
    if (json['ancestors'] != null) {
      ancestors = <Ancestors>[];
      json['ancestors'].forEach((v) {
        ancestors!.add(Ancestors.fromJson(v));
      });
    }
    canComment = json['can_comment'];
    typeName = json['type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['thumbnail'] = thumbnail;
    data['url'] = url;
    data['public_url'] = publicUrl;
    if (creator != null) {
      data['creator'] = creator!.toJson();
    }
    data['added'] = added;
    data['modified'] = modified;
    data['is_published'] = isPublished;
    data['is_wip'] = isWip;
    data['is_featured'] = isFeatured;
    data['is_nsfw'] = isNsfw;
    data['like_count'] = likeCount;
    data['is_liked'] = isLiked;
    data['collect_count'] = collectCount;
    data['is_collected'] = isCollected;
    data['comment_count'] = commentCount;
    data['is_watched'] = isWatched;
    if (defaultImage != null) {
      data['default_image'] = defaultImage!.toJson();
    }
    data['description'] = description;
    data['instructions'] = instructions;
    data['description_html'] = descriptionHtml;
    data['instructions_html'] = instructionsHtml;
    data['details'] = details;
    if (detailsParts != null) {
      data['details_parts'] = detailsParts!.map((v) => v.toJson()).toList();
    }
    data['edu_details'] = eduDetails;
    data['license'] = license;
    data['allows_derivatives'] = allowsDerivatives;
    data['files_url'] = filesUrl;
    data['images_url'] = imagesUrl;
    data['likes_url'] = likesUrl;
    data['ancestors_url'] = ancestorsUrl;
    data['derivatives_url'] = derivativesUrl;
    data['categories_url'] = categoriesUrl;
    data['file_count'] = fileCount;
    data['layout_count'] = layoutCount;
    data['layouts_url'] = layoutsUrl;
    data['is_private'] = isPrivate;
    data['is_purchased'] = isPurchased;
    data['in_library'] = inLibrary;
    data['print_history_count'] = printHistoryCount;
    data['app_id'] = appId;
    data['download_count'] = downloadCount;
    data['view_count'] = viewCount;
    data['remix_count'] = remixCount;
    data['make_count'] = makeCount;
    data['app_count'] = appCount;
    data['root_comment_count'] = rootCommentCount;
    data['moderation'] = moderation;
    data['is_derivative'] = isDerivative;
    if (ancestors != null) {
      data['ancestors'] = ancestors!.map((v) => v.toJson()).toList();
    }
    data['can_comment'] = canComment;
    data['type_name'] = typeName;
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
    data['id'] = id;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['url'] = url;
    data['public_url'] = publicUrl;
    data['thumbnail'] = thumbnail;
    data['count_of_followers'] = countOfFollowers;
    data['count_of_following'] = countOfFollowing;
    data['count_of_designs'] = countOfDesigns;
    data['accepts_tips'] = acceptsTips;
    data['is_following'] = isFollowing;
    data['location'] = location;
    data['cover'] = cover;
    return data;
  }
}

class DefaultImage {
  int? id;
  String? url;
  String? name;
  List<Sizes>? sizes;
  String? added;

  DefaultImage({this.id, this.url, this.name, this.sizes, this.added});

  DefaultImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(Sizes.fromJson(v));
      });
    }
    added = json['added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['url'] = url;
    data['name'] = name;
    if (sizes != null) {
      data['sizes'] = sizes!.map((v) => v.toJson()).toList();
    }
    data['added'] = added;
    return data;
  }
}

class Sizes {
  String? type;
  String? size;
  String? url;

  Sizes({this.type, this.size, this.url});

  Sizes.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    size = json['size'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['size'] = size;
    data['url'] = url;
    return data;
  }
}

class DetailsParts {
  String? type;
  String? name;
  String? required;
  List<Data>? data;

  DetailsParts({this.type, this.name, this.required, this.data});

  DetailsParts.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    required = json['required'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['name'] = name;
    data['required'] = required;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? content;

  Data({this.content});

  Data.fromJson(Map<String, dynamic> json) {
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['content'] = content;
    return data;
  }
}

class Ancestors {
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
  bool? isNsfw;

  Ancestors(
      {this.id,
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
      this.isNsfw});

  Ancestors.fromJson(Map<String, dynamic> json) {
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
    isNsfw = json['is_nsfw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['public_url'] = publicUrl;
    data['created_at'] = createdAt;
    data['thumbnail'] = thumbnail;
    data['preview_image'] = previewImage;
    if (creator != null) {
      data['creator'] = creator!.toJson();
    }
    data['is_private'] = isPrivate;
    data['is_purchased'] = isPurchased;
    data['is_published'] = isPublished;
    data['comment_count'] = commentCount;
    data['make_count'] = makeCount;
    data['like_count'] = likeCount;
    data['is_nsfw'] = isNsfw;
    return data;
  }
}
