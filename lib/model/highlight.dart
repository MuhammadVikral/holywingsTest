class Highlight {
  final int idhighlight;
  final String type;
  final int idtype;
  final News news;
  final String event;
  final String promo;
  final int ordernum;

  Highlight(
      {required this.idhighlight,
      required this.type,
      required this.idtype,
      required this.news,
      required this.event,
      required this.promo,
      required this.ordernum});

  factory Highlight.fromJson(Map<String, dynamic> json) {
    var highlight = Highlight(
      idhighlight: json['idhighlight'],
      type: json['type'],
      idtype: json['idtype'],
      news: (json['news'] != null ? News.fromJson(json['news']) : null)!,
      event: json['event'],
      promo: json['promo'],
      ordernum: json['ordernum'],
    );
    return highlight;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['idhighlight'] = idhighlight;
    data['type'] = type;
    data['idtype'] = idtype;
    if (news != null) {
      data['news'] = news.toJson();
    }
    data['event'] = event;
    data['promo'] = promo;
    data['ordernum'] = ordernum;
    return data;
  }
}

class News {
  int idnews;
  String title;
  String content;
  String url;
  String image;
  String createdTimestamp;

  News({
    required this.idnews,
    required this.title,
    required this.content,
    required this.url,
    required this.image,
    required this.createdTimestamp,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    var news = News(
      idnews: json['news']['idnews'],
      title: json['news']['title'],
      content: json['news']['content'],
      url: json['news']['url'],
      image: json['news']['image'],
      createdTimestamp: json['news']['created_timestamp'],
    );
    return news;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idnews'] = idnews;
    data['title'] = title;
    data['content'] = content;
    data['url'] = url;
    data['image'] = image;
    data['created_timestamp'] = createdTimestamp;
    return data;
  }
}
