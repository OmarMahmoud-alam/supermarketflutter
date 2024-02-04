class AddressModel {
  final int id;
  final String name;
  final int userId;
  final String streetAddress;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final String? latitude; // Change to nullable String
  final String? longitude; // Change to nullable String
  final int isDefault;
  final DateTime? createdAt; // Change to nullable DateTime
  final DateTime? updatedAt; // Change to nullable DateTime

  AddressModel({
    required this.id,
    required this.name,
    required this.userId,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.latitude,
    this.longitude,
    required this.isDefault,
    this.createdAt,
    this.updatedAt,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      name: json['name'],
      userId: json['user_id'],
      streetAddress: json['street_address'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postal_code'],
      country: json['country'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      isDefault: json['is_default'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'user_id': userId,
      'street_address': streetAddress,
      'city': city,
      'state': state,
      'postal_code': postalCode,
      'country': country,
      'latitude': latitude,
      'longitude': longitude,
      'is_default': isDefault,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
