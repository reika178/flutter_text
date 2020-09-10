import 'package:flutter/semantics.dart';

abstract class EventListState extends Equatable {
  EventListState([List props = const []]) : super(props);
}

class EventListLoad extends EventListEvent {

  @override
  String toString() => 'EventListLoad';
}

class EventListEmpty extends EventListState {
  @override
  String toString() => 'EventListEmpty';
}

class EventListInProgress extends EventListState {
  @override
  String toString() => 'EventListInProgress';
}

class EventListSuccess extends EventListState {
  final Stream<List<Event>> eventList;

  EventListSuccess({ @required this.eventList})
    : assert(eventList != null),
      super([eventList]);

  @override
  String toString() => 'EventListSuccess';
}

class EventListFailure extends EventListState {
  final Error error;

  EventListFailure({ @required this.error})
    : assert(error != null),
      super([error]);

  @override
  String toString() => 'EventListFailure';
}

class EventListBloc extends Bloc<EventListEvent, EventListState> {

  final EventListRepository _eventListRepository;

  EventListBloc({@required EventListRepository eventListRepository})
    : assert(eventListRepository != null),
      _eventListRepository = eventListRepository;

  @override
  EventListState get initialState => EventListEmpty();

  @override
  Stream<EventListState> mapEventToState(EventListEvent event) async* {
    if (event is EventListLoad) {
      yield* _mapEventListLoadToState();
    }
  }

  Stream<EventListState> _mapEventListLoadToState() async* {
    yield EventListInProgress();
    try {
      yield EventListSuccess(
        eventList: _eventListRepository.fetch()
      );
    } catch (_) {
      yield EventListFailure(error: _);
    }
  }
}