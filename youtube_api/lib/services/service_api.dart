import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:youtube_api/models/model_channel.dart';
import 'package:youtube_api/models/vedio_model.dart';
import 'package:youtube_api/utilities/keys.dart';

class APIService {
  APIService._instantiate();
  static final APIService instance = APIService._instantiate();
  final String _baseUrl = 'www.googleapis.com';
  String _nextPageToken = '';

  Future<Channel> fetchChannel({String channelId}) async {
    Map<String, String> parameters = {
      'part': 'snippet, contentDetails, statistics',
      'id': channelId,
      'key': API_KEY,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    //Get Channel
    var res = await http.get(uri, headers: headers);
    if (res.statusCode == 200) {
      Map<String, dynamic> data = json.decode(res.body)['items'][0];
      Channel channel = Channel.fromMap(data);

      //fetch first batch of videos from uploads playlist
      channel.videos = await fetchVideoFromPlaylist(
        playlistId: channel.uploadplayListId,
      );
      return channel;
    } else {
      throw json.decode(res.body)['error']['message'];
    }
  }

  Future<List<Video>> fetchVideoFromPlaylist({String playlistId}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playlistId,
      'maxResults': '10',
      'pageToken': _nextPageToken,
      'key': API_KEY,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    //get playlist videos
    var res = await http.get(uri, headers: headers);
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      _nextPageToken = data['nextPageToken'] ?? '';
      List<dynamic> videoJson = data['items'];

      //fetch first 10 videos upload playlist
      List<Video> videos = [];
      videoJson.forEach((json) => videos.add(Video.fromMap(json['snippet'])));
      return videos;
    } else {
      throw json.decode(res.body)['error']['message'];
    }
  }
}
