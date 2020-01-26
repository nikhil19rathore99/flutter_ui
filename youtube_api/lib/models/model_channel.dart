import 'package:youtube_api/models/vedio_model.dart';

class Channel {
  final String id;
  final String title;
  final String profilePicUrl;
  final String subscriptionCount;
  final String vedioCount;
  final String uploadplayListId;
  List<Video> videos;

  Channel(
      {this.id,
      this.title,
      this.profilePicUrl,
      this.subscriptionCount,
      this.vedioCount,
      this.uploadplayListId});

  factory Channel.fromMap(Map<String, dynamic> map) {
    return Channel(
      id: map['id'],
      title: map['snippet']['title'],
      profilePicUrl: map['snippet']['thumbnails']['default']['url'],
      subscriptionCount: map['statistics']['subscriberCount'],
      vedioCount: map['statistics']['videoCount'],
      uploadplayListId: map['contentDetails']['relatedPlaylists']['uploads'],
    );
  }
}
