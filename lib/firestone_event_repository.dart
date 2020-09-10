class FirestoreEventListRepository extends EventListRepository {
  final Firestore _firestore;

  FirestoreEventListrepository(
    {Firestore firestore})
    : _firestore = firestore ?? Firestore.instance;

  @override
  Stream<List<Event>> fetch() {
    return _firestore.collection("events").snapShots().map((snapshot) {
      return snapshot.documents.map((docs) {

        return Event(
          id: docs.documentID,
          title: docs.data["title"] ?? "",
          description: docs.data["description"] ?? "",
          date: docs.data["data"]?.toDate() ?? DateTime.utc(2019),
          imageUrl: docs.data["image_url"] ?? "",
        );
      }).toList();
    });
  }
}