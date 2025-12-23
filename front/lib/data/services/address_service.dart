import 'package:code_initial/domain/models/address_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AddressService {
  static const String _addressesKey = 'user_addresses';
  
  // Récupérer toutes les adresses
  Future<List<Address>> getAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    final addressesJson = prefs.getStringList(_addressesKey) ?? [];
    
    return addressesJson
        .map((json) => Address.fromJson(jsonDecode(json)))
        .toList();
  }
  
  // Ajouter ou mettre à jour une adresse
  Future<void> saveAddress(Address address) async {
    final prefs = await SharedPreferences.getInstance();
    final addresses = await getAddresses();
    
    // Si l'adresse existe déjà, on la met à jour
    final existingIndex = addresses.indexWhere((a) => a.id == address.id);
    if (existingIndex >= 0) {
      addresses[existingIndex] = address;
    } else {
      // Sinon on l'ajoute
      addresses.add(address);
    }
    
    // Si c'est l'adresse par défaut, on enlève le statut par défaut des autres
    if (address.isDefault) {
      for (var addr in addresses) {
        if (addr.id != address.id) {
          addr = Address(
            id: addr.id,
            fullName: addr.fullName,
            addressLine1: addr.addressLine1,
            addressLine2: addr.addressLine2,
            city: addr.city,
            state: addr.state,
            postalCode: addr.postalCode,
            country: addr.country,
            phoneNumber: addr.phoneNumber,
            email: addr.email,
            isDefault: false,
          );
        }
      }
    }
    
    // Sauvegarder la liste mise à jour
    await prefs.setStringList(
      _addressesKey,
      addresses.map((a) => jsonEncode(a.toJson())).toList(),
    );
  }
  
  // Supprimer une adresse
  Future<void> deleteAddress(String addressId) async {
    final prefs = await SharedPreferences.getInstance();
    final addresses = await getAddresses();
    addresses.removeWhere((a) => a.id == addressId);
    
    await prefs.setStringList(
      _addressesKey,
      addresses.map((a) => jsonEncode(a.toJson())).toList(),
    );
  }
  
  // Récupérer l'adresse par défaut
  Future<Address?> getDefaultAddress() async {
    final addresses = await getAddresses();
    try {
      return addresses.firstWhere((a) => a.isDefault);
    } catch (e) {
      return addresses.isNotEmpty ? addresses.first : null;
    }
  }
}
