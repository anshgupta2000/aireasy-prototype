class Request {
  final String id;
  final String userId;
  final String flightId;
  final String itemId;
  final String seatNumber;
  final DateTime timestamp;

  Request({
    required this.id,
    required this.userId,
    required this.flightId,
    required this.itemId,
    required this.seatNumber,
    required this.timestamp,
  });

  // Method to convert a Request object into a map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'flightId': flightId,
      'itemId': itemId,
      'seatNumber': seatNumber,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  // Method to convert a map object into a Request object
  static Request fromMap(Map<String, dynamic> map) {
    return Request(
      id: map['id'],
      userId: map['userId'],
      flightId: map['flightId'],
      itemId: map['itemId'],
      seatNumber: map['seatNumber'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
