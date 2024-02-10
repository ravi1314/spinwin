class LinkModel {
  final String link;
  final String date;
  final String newlink;
  final String id;

  LinkModel(
      {required this.id,
      required this.newlink,
      required this.date,
      required this.link});
  Map<String, dynamic> toMap() {
    return {'link': link, 'date': date};
  }

  factory LinkModel.fromMap(Map<String, dynamic> json) {
    return LinkModel(
        date: json['date'],
        link: json['link'],
        id: json['id'],
        newlink: json['newlink']);
  }
}
