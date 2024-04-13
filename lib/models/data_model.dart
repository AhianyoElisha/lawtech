
class VideoData {
  String videoId;
  String title;
  String description;
  bool public;
  bool panoramic;
  bool mp4Support;
  String publishedAt;
  String createdAt;
  String updatedAt;
  List<dynamic> tags;
  List<dynamic> metadata;
  Source source;
  Assets assets;

  VideoData({
    required this.videoId,
    required this.title,
    required this.description,
    required this.public,
    required this.panoramic,
    required this.mp4Support,
    required this.publishedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.tags,
    required this.metadata,
    required this.source,
    required this.assets,
  });

  factory VideoData.fromJson(Map<String, dynamic> json) {
    return VideoData(
      videoId: json["videoId"],
      title: json["title"],
      description: json["description"],
      public: json["public"],
      panoramic: json["panoramic"],
      mp4Support: json["mp4Support"],
      publishedAt: json["publishedAt"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      tags: json["tags"],
      metadata: json["metadata"],
      source: Source.fromJson(json["source"]),
      assets: Assets.fromJson(json["assets"]),
    );
  }
}

class Source {
  String type;
  String uri;

  Source({
    required this.type,
    required this.uri,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      type: json["type"],
      uri: json["uri"],
    );
  }
}

class Assets {
  String iframe;
  String player;
  String hls;
  String thumbnail;
  String mp4;

  Assets({
    required this.iframe,
    required this.player,
    required this.hls,
    required this.thumbnail,
    required this.mp4,
  });

  factory Assets.fromJson(Map<String, dynamic> json) {
    return Assets(
      iframe: json["iframe"],
      player: json["player"],
      hls: json["hls"],
      thumbnail: json["thumbnail"],
      mp4: json["mp4"],
    );
  }
}



class Books {
  String id;
  String title;
  String subtitle;
  String authors;
  String image;
  String url;

  Books({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.image,
    required this.url,
  });

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(
      id: json["id"],
      title: json["title"],
      subtitle: json["subtitle"],
      authors: json["authors"],
      image: json["image"],
      url: json["url"],
    );
  }
}