class Video {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String channelTitle;

  Video({this.id, this.title, this.thumbnailUrl, this.channelTitle});

  factory Video.fromMap(Map<String, dynamic> jsonData) {
    return Video(
      id: jsonData['resourceId']['videoId'],
      title: jsonData['title'],
      thumbnailUrl: jsonData['thumbnails']['high']['url'],
      channelTitle: jsonData['channelTitle'],
    );
  }
}
