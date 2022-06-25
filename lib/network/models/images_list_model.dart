class ImagesListModel {
  late int id;
  late String name;
  late String url;
  late List<Sizes> sizes;

  ImagesListModel(
      {required this.id,
      required this.name,
      required this.url,
      required this.sizes});

  ImagesListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes.add(Sizes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['sizes'] = sizes.map((v) => v.toJson()).toList();
    return data;
  }
}

class Sizes {
  late String type;
  late String size;
  late String url;

  Sizes({required this.type, required this.size, required this.url});

  Sizes.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    size = json['size'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['size'] = size;
    data['url'] = url;
    return data;
  }
}
