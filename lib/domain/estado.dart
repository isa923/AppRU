class Estado {
  late String state;
  late String city;

  Estado({
    required this.state,
    required this.city,
  });

  Estado.fromJson(Map<String, dynamic> json) {
    state = json['state'] ?? '';
    city = json['city'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'state': state,
      'city': city,
    };
  }
}
