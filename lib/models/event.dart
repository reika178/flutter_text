import 'package:meta/meta.dart';

@immutable
class Event {
  final String id;
  final String title;
  final String description;
  final DateTime date ;
  final String imageUrl;

  Event(
    {@required this.id,
    @required this.title,
    @required this.description,
    @required this.date,
    @required this.imageUrl,
    })
    : assert(id != null),
      assert(title != null),
      assert(description != null),
      assert(date != null),
      assert(imageUrl != null);

  static Event fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      // いらないかも下の一行
      date: json['date'],
      imageUrl: json['image_Url'],
    );
  }
}