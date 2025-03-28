// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:equatable/equatable.dart';

class CharactersResponse extends Equatable {
  int? code;
  String? attributionText;
  Data? data;

  CharactersResponse({this.code, this.attributionText, this.data});

  @override
  List<Object> get props => [];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "code": code,
      "attributionText": attributionText,
      "data": data,
    };

    return map;
  }

  static CharactersResponse fromMap(Map<String, dynamic> map) {
    CharactersResponse userModel = CharactersResponse(
      code: map['code'],
      attributionText: map['attributionText'],
      data: map['data'],
    );

    return userModel;
  }

  static CharactersResponse fromJson(String source) =>
      fromMap(json.decode(source));
}

class Data extends Equatable {
  int? offset;
  List<Results>? results;

  Data({this.offset, this.results});

  @override
  List<Object> get props => [];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "offset": offset,
      "results": results,
    };

    return map;
  }

  static Data fromMap(Map<String, dynamic> map) {
    Data userModel = Data(
      offset: map['offset'],
      results: map['results'],
    );

    return userModel;
  }

  static Data fromJson(String source) => fromMap(json.decode(source));
}

class Results extends Equatable {
  int? id;
  String? name;
  String? description;
  Thumbnail? thumbnail;

  Results({this.id, this.name, this.description, this.thumbnail});

  @override
  List<Object> get props => [];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": id,
      "name": name,
      "description": description,
      "thumbnail": thumbnail,
    };

    return map;
  }

  static Results fromMap(Map<String, dynamic> map) {
    Results userModel = Results(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      thumbnail: map['thumbnail'],
    );

    return userModel;
  }

  static Results fromJson(String source) => fromMap(json.decode(source));
}

class Thumbnail extends Equatable {
  String? path;
  String? extension;

  Thumbnail({this.path, this.extension});

  @override
  List<Object> get props => [];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "path": path,
      "extension": extension,
    };

    return map;
  }

  static Thumbnail fromMap(Map<String, dynamic> map) {
    Thumbnail userModel = Thumbnail(
      path: map['path'],
      extension: map['extension'],
    );

    return userModel;
  }

  static Thumbnail fromJson(String source) => fromMap(json.decode(source));
}
