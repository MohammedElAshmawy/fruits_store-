import '../../domain/entities/address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? phone;
  String? address;
  String? city;
  String? email;
  String? floor;

  ShippingAddressModel({
    this.name,
    this.phone,
    this.address,
    this.city,
    this.email,
    this.floor,
  });

  factory ShippingAddressModel.fromEntity({required AddressEntity entity}) {
    return ShippingAddressModel(
      name: entity.fullName,
      phone: entity.phone,
      address: entity.address,
      city: entity.city,
      email: entity.email,
      floor: entity.addressDetails,
    );
  }

  toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'city': city,
      'email': email,
      'floor': floor,
    };
  }
}
