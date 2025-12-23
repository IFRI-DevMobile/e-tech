class OrderModel {
  final String id;
  final String userId;
  final List<OrderItem> items;
  final double subtotal;
  final double shippingCost;
  final double total;
  final DateTime orderDate;
  final String status;
  final ShippingAddress shippingAddress;
  final PaymentMethod paymentMethod;

  OrderModel({
    required this.id,
    required this.userId,
    required this.items,
    required this.subtotal,
    required this.shippingCost,
    required this.total,
    required this.orderDate,
    this.status = 'En attente',
    required this.shippingAddress,
    required this.paymentMethod,
  });

  // Convertir en Map pour le stockage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'items': items.map((item) => item.toJson()).toList(),
      'subtotal': subtotal,
      'shippingCost': shippingCost,
      'total': total,
      'orderDate': orderDate.toIso8601String(),
      'status': status,
      'shippingAddress': shippingAddress.toJson(),
      'paymentMethod': paymentMethod.toJson(),
    };
  }

  // Créer un OrderModel à partir d'un Map
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      userId: json['userId'],
      items: (json['items'] as List)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
      subtotal: (json['subtotal'] as num).toDouble(),
      shippingCost: (json['shippingCost'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      orderDate: DateTime.parse(json['orderDate']),
      status: json['status'],
      shippingAddress: ShippingAddress.fromJson(json['shippingAddress']),
      paymentMethod: PaymentMethod.fromJson(json['paymentMethod']),
    );
  }
}

class OrderItem {
  final String productId;
  final String name;
  final double price;
  final int quantity;
  final String? imageUrl;

  OrderItem({
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'name': name,
      'price': price,
      'quantity': quantity,
      'imageUrl': imageUrl,
    };
  }

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['productId'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
      imageUrl: json['imageUrl'],
    );
  }
}

class ShippingAddress {
  final String fullName;
  final String addressLine1;
  final String? addressLine2;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final String phoneNumber;
  final String email;

  ShippingAddress({
    required this.fullName,
    required this.addressLine1,
    this.addressLine2,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.phoneNumber,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }

  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    return ShippingAddress(
      fullName: json['fullName'],
      addressLine1: json['addressLine1'],
      addressLine2: json['addressLine2'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postalCode'],
      country: json['country'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
    );
  }
}

class PaymentMethod {
  final String type; // 'credit_card', 'paypal', 'on_delivery', etc.
  final String? cardNumber; // Derniers 4 chiffres
  final String? cardHolderName;
  final String? expirationDate;

  PaymentMethod({
    required this.type,
    this.cardNumber,
    this.cardHolderName,
    this.expirationDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'cardNumber': cardNumber,
      'cardHolderName': cardHolderName,
      'expirationDate': expirationDate,
    };
  }

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      type: json['type'],
      cardNumber: json['cardNumber'],
      cardHolderName: json['cardHolderName'],
      expirationDate: json['expirationDate'],
    );
  }
}
