class EventModel {
  final String idEvent;
  final String nameEvent;
  final double priceSale;

  EventModel({
    required this.idEvent,
    required this.nameEvent,
    required this.priceSale,
  });

  Map<String, dynamic> toMap() {
    return {
      'idEvent': idEvent,
      'nameEvent': nameEvent,
      'priceSale': priceSale,
    };
  }
}
