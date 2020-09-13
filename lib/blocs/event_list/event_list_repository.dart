import 'package:flutter_text/models/event.dart';

abstract class EventListRepository {
  Stream<List<Event>> fetch();
}