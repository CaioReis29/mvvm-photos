
import 'dart:convert';

class PhotoDto {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  PhotoDto({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      "albumId": albumId,
      "id": id,
      "title": title,
      "url": url,
      "thumbnailUrl": thumbnailUrl,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory PhotoDto.fromJson(Map<String, dynamic> map) {
    return PhotoDto(
      albumId: map['albumId'] ?? 1,
      id: map['id'] ?? 1,
      title: map['title'] ?? "",
      url: map['url'] ?? "",
      thumbnailUrl: map['thumbnailUrl'] ?? "",
    );
  }
}