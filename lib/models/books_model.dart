class BooksModel {
  String? kind;
  int? totalItems;
  List<Items>? items;

  BooksModel({
    this.kind,
    this.totalItems,
    this.items,
  });

  BooksModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'] as String?;
    totalItems = json['totalItems'] as int?;
    items = (json['items'] as List?)?.map((dynamic e) => Items.fromJson(e as Map<String, dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['kind'] = kind;
    json['totalItems'] = totalItems;
    json['items'] = items?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Items {
  String? id;
  VolumeInfo? volumeInfo;

  Items({
    this.id,
    this.volumeInfo,
  });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    volumeInfo = (json['volumeInfo'] as Map<String, dynamic>?) != null
        ? VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['volumeInfo'] = volumeInfo?.toJson();
    return json;
  }
}

class VolumeInfo {
  String? title;
  String? subtitle;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  int? pageCount;
  List<String>? categories;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;
  String? id;

  VolumeInfo({
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.pageCount,
    this.categories,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
    this.id,
  });

  VolumeInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String?;
    subtitle = json['subtitle'] as String?;
    authors = (json['authors'] as List?)?.map((dynamic e) => e as String).toList();
    publisher = json['publisher'] as String?;
    publishedDate = json['publishedDate'] as String?;
    description = json['description'] as String?;
    pageCount = json['pageCount'] as int?;
    categories = (json['categories'] as List?)?.map((dynamic e) => e as String).toList();
    imageLinks = (json['imageLinks'] as Map<String, dynamic>?) != null
        ? ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>)
        : null;
    language = json['language'] as String?;
    previewLink = json['previewLink'] as String?;
    infoLink = json['infoLink'] as String?;
    canonicalVolumeLink = json['canonicalVolumeLink'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['title'] = title;
    json['subtitle'] = subtitle;
    json['authors'] = authors;
    json['publisher'] = publisher;
    json['publishedDate'] = publishedDate;
    json['description'] = description;
    json['pageCount'] = pageCount;
    json['categories'] = categories;
    json['imageLinks'] = imageLinks?.toJson();
    json['language'] = language;
    json['previewLink'] = previewLink;
    json['infoLink'] = infoLink;
    json['canonicalVolumeLink'] = canonicalVolumeLink;
    return json;
  }
}

class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;

  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  ImageLinks.fromJson(Map<String, dynamic> json) {
    smallThumbnail = json['smallThumbnail'] as String?;
    thumbnail = json['thumbnail'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['smallThumbnail'] = smallThumbnail;
    json['thumbnail'] = thumbnail;
    return json;
  }
}
