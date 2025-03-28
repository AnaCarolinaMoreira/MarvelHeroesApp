import 'dart:convert';

class CharactersResponse {
  final int code;
  final String status;
  final String copyright;
  final String attributionText;
  final String attributionHtml;
  final String etag;
  final Data? data;

  CharactersResponse({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHtml,
    required this.etag,
    this.data,
  });

  factory CharactersResponse.fromJson(String str) =>
      CharactersResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CharactersResponse.fromMap(Map<String, dynamic> map) =>
      CharactersResponse(
        code: map["code"] ?? 0,
        status: map["status"] ?? '',
        copyright: map["copyright"] ?? '',
        attributionText: map["attributionText"] ?? '',
        attributionHtml: map["attributionHTML"] ?? '',
        etag: map["etag"] ?? '',
        data: Data.fromMap(map["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "etag": etag,
        "data": data?.toMap(),
      };
}

//TODO:separar classe por model
class Data {
  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<Result> results;

  Data({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  factory Data.fromMap(Map<String, dynamic> map) => Data(
        offset: map["offset"] ?? 0,
        limit: map["limit"] ?? 0,
        total: map["total"] ?? 0,
        count: map["count"] ?? 0,
        results: map["results"] != null
            ? List<Result>.from(map["results"].map((x) => Result.fromMap(x)))
            : [],
      );

  Map<String, dynamic> toMap() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
}

class Result {
  final int id;
  final String name;
  final String description;
  final String modified;
  final Thumbnail thumbnail;
  final String resourceUri;
  final Comics comics;
  final Comics series;
  final Stories stories;
  final Comics events;
  final List<Url> urls;

  Result({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
    required this.resourceUri,
    required this.comics,
    required this.series,
    required this.stories,
    required this.events,
    required this.urls,
  });

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> map) => Result(
        id: map["id"] ?? 0,
        name: map["name"] ?? '',
        description: map["description"] ?? '',
        modified: map["modified"] ?? '',
        thumbnail: Thumbnail.fromMap(map["thumbnail"]),
        resourceUri: map["resourceURI"] ?? '',
        comics: Comics.fromMap(map["comics"]),
        series: Comics.fromMap(map["series"]),
        stories: Stories.fromMap(map["stories"]),
        events: Comics.fromMap(map["events"]),
        urls: map["description"] != null
            ? List<Url>.from(map["urls"].map((x) => Url.fromMap(x)))
            : [],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "modified": modified,
        "thumbnail": thumbnail.toMap(),
        "resourceURI": resourceUri,
        "comics": comics.toMap(),
        "series": series.toMap(),
        "stories": stories.toMap(),
        "events": events.toMap(),
        "urls": List<dynamic>.from(urls.map((x) => x.toMap())),
      };
}

class Comics {
  final int available;
  final String collectionUri;
  final List<ComicsItem> items;
  final int returned;

  Comics({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  factory Comics.fromJson(String str) => Comics.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Comics.fromMap(Map<String, dynamic> map) => Comics(
        available: map["available"],
        collectionUri: map["collectionURI"],
        items: List<ComicsItem>.from(
            map["items"].map((x) => ComicsItem.fromMap(x))),
        returned: map["returned"],
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
        "returned": returned,
      };
}

//TODO:refatorar classe para apenas uma a items
class ComicsItem {
  final String resourceUri;
  final String name;

  ComicsItem({
    required this.resourceUri,
    required this.name,
  });

  factory ComicsItem.fromJson(String str) =>
      ComicsItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ComicsItem.fromMap(Map<String, dynamic> map) => ComicsItem(
        resourceUri: map["resourceURI"],
        name: map["name"],
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}

class Stories {
  final int available;
  final String collectionUri;
  final List<StoriesItem> items;
  final int returned;

  Stories({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  factory Stories.fromJson(String str) => Stories.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Stories.fromMap(Map<String, dynamic> map) => Stories(
        available: map["available"],
        collectionUri: map["collectionURI"],
        items: List<StoriesItem>.from(
            map["items"].map((x) => StoriesItem.fromMap(x))),
        returned: map["returned"],
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
        "returned": returned,
      };
}

//TODO:refatorar classe para apenas uma a items
class StoriesItem {
  final String resourceUri;
  final String name;
  final String type;

  StoriesItem({
    required this.resourceUri,
    required this.name,
    required this.type,
  });

  factory StoriesItem.fromJson(String str) =>
      StoriesItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StoriesItem.fromMap(Map<String, dynamic> map) => StoriesItem(
        resourceUri: map["resourceURI"],
        name: map["name"],
        type: map["type"],
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": type,
      };
}

class Thumbnail {
  final String path;
  final String extension;

  Thumbnail({
    required this.path,
    required this.extension,
  });

  factory Thumbnail.fromJson(String str) => Thumbnail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Thumbnail.fromMap(Map<String, dynamic> map) => Thumbnail(
        path: map["path"],
        extension: map["extension"],
      );

  Map<String, dynamic> toMap() => {
        "path": path,
        "extension": extension,
      };
}

class Url {
  final String type;
  final String url;

  Url({
    required this.type,
    required this.url,
  });

  factory Url.fromJson(String str) => Url.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Url.fromMap(Map<String, dynamic> map) => Url(
        type: map["type"],
        url: map["url"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "url": url,
      };
}
