class Flight {
  final String id;
  final String airline;
  final String flightNumber;
  final DateTime departureTime;
  final DateTime arrivalTime;
  final String origin;
  final String destination;
  final List<String>
      passengerIds; //List of User IDs who are passengers on this flight
  final Map<String, bool>
      inventory; //Map of available items for in-flight service

  Flight({
    required this.id,
    required this.airline,
    required this.flightNumber,
    required this.departureTime,
    required this.arrivalTime,
    required this.origin,
    required this.destination,
    required this.passengerIds,
    required this.inventory,
  });

  // Method to convert a Flight object into a map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'airline': airline,
      'flightNumber': flightNumber,
      'departureTime': departureTime.toIso8601String(),
      'arrivalTime': arrivalTime.toIso8601String(),
      'origin': origin,
      'destination': destination,
      'passengerIds': passengerIds,
      'inventory': inventory,
    };
  }

  // Method to convert a map object into a Flight object
  static Flight fromMap(Map<String, dynamic> map) {
    return Flight(
      id: map['id'],
      airline: map['airline'],
      flightNumber: map['flightNumber'],
      departureTime: DateTime.parse(map['departureTime']),
      arrivalTime: DateTime.parse(map['arrivalTime']),
      origin: map['origin'],
      destination: map['destination'],
      passengerIds: List<String>.from(map['passengerIds']),
      inventory: Map<String, bool>.from(map['inventory']),
    );
  }
}
