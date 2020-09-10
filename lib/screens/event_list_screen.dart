import 'package:flutter/material.dart';

class EventListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventListBloc = EventListBloc(
      eventListRepository: FirestoreEventListRepository()
    );
    eventListBloc.dispatch(EventListLoad());

    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
      ),
      body: BlocBuilder<EventListBloc, EventListState>(
        bloc: eventListBloc,
        builder: (context, state) {

          if (state is EventListInProgressInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is EventListSuccess) {
            return StreamBuilder(
              stream: state.eventList,
              builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {

                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Failure")
                      ],
                    )
                  );
                }

                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    final event = snapshot.data[index];
                    return Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              event.title,
                              style: TextStyle(fontWeight: FontWeight.bold)
                            ),
                            subtitle:Text(event.date.toIso8601String()),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Image.network(
                                  event.imageUrl,
                                  fit: BoxFit.none,
                                  height: 128,
                                )
                              )
                            ],
                          ),
                          Text(event.description)
                        ]
                      )
                    );
                  },
                  itemCount: snapshot.data.length,
                );
              },
            );
          }

          if (state is EventListFailure) {
            return Center(
              child: Text("Failure"),
            );
          }

          return Container();
        },
      ),
    );
  }
}