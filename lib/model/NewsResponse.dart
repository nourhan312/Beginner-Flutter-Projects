import 'SourceResponse.dart';

class NewsResponse {
  NewsResponse({
      this.status, 
      this.totalResults, 
      this.articles,});

  NewsResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(News.fromJson(v));
      });
    }
  }
  String? status;
  int? totalResults;
  List<News>? articles;
  String?code;
  String?message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// source : {"id":"wired","name":"Wired"}
/// author : "Joel Khalili"
/// title : "The First Bitcoin President? Tracing Trump’s Crypto Connections"
/// description : "Crypto execs funneled millions in donations to swing this election, and now their man is in charge. Here’s how Donald Trump’s “crypto cabinet” could shape the next four years."
/// url : "https://www.wired.com/story/mapping-donald-trump-crypto-connections/"
/// urlToImage : "https://media.wired.com/photos/67815aa7ced74e457dc3a71e/191:100/w_1280,c_limit/011025_Trumps-Crypto-Cabinet.jpg"
/// publishedAt : "2025-01-16T11:00:00Z"
/// content : "President Trump has surrounded himself with crypto enthusiasts. Thats no coincidence. In 2024 the cryptocurrency industry spent millions backing friendly congressional candidates, many of whom were R… [+817 chars]"

class News {
  News({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}


