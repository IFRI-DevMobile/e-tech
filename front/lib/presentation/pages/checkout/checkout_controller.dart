import 'dart:math';
import 'package:get/get.dart';
import 'package:code_initial/domain/models/order_model.dart';
import 'package:code_initial/presentation/pages/panier/panier_controller.dart';
import 'package:code_initial/presentation/pages/panier/panier_page_model.dart';

class CheckoutController extends GetxController {
  final shippingAddress = ShippingAddress(
    fullName: '',
    addressLine1: '',
    city: '',
    state: '',
    postalCode: '',
    country: 'Côte d\'Ivoire',
    phoneNumber: '',
    email: '',
  ).obs;

  final selectedPaymentMethod = 'on_delivery'.obs;
  final isProcessing = false.obs;
  final orderPlaced = false.obs;
  String orderId = '';

  // Getters pour les totaux
  double get subtotal => Get.find<PanierController>().prixTotal;
  List<PanierPageModel> get cartItems =>
      Get.find<PanierController>().panierpage;
  double get shippingCost => 50.0;
  double get total => subtotal + shippingCost;

  void updateShippingAddress({
    String? fullName,
    String? addressLine1,
    String? addressLine2,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    String? phoneNumber,
    String? email,
  }) {
    final currentAddress = shippingAddress.value;
    shippingAddress.value = ShippingAddress(
      fullName: fullName ?? currentAddress.fullName,
      addressLine1: addressLine1 ?? currentAddress.addressLine1,
      addressLine2: addressLine2 ?? currentAddress.addressLine2,
      city: city ?? currentAddress.city,
      state: state ?? currentAddress.state,
      postalCode: postalCode ?? currentAddress.postalCode,
      country: country ?? currentAddress.country,
      phoneNumber: phoneNumber ?? currentAddress.phoneNumber,
      email: email ?? currentAddress.email,
    );
  }

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }

  Future<void> placeOrder() async {
    if (_validateForm()) {
      try {
        isProcessing.value = true;

        // Générer un ID de commande aléatoire
        orderId =
            'CMD${DateTime.now().millisecondsSinceEpoch.toString().substring(5)}';

        // Simuler un délai de traitement
        await Future.delayed(Duration(seconds: 2));

        final order = _createOrder();
        orderPlaced.value = true;

        // Rediriger vers la page de confirmation
        Get.offNamed(
          '/order-confirmation',
          arguments: {
            'orderId': orderId,
            'total': total,
          },
        );

        // Vider le panier après la redirection
        Get.find<PanierController>().panierpage.clear();
      } catch (e) {
        Get.snackbar(
          'Erreur',
          'Une erreur est survenue lors de la commande: $e',
          snackPosition: SnackPosition.BOTTOM,
        );
      } finally {
        isProcessing.value = false;
      }
    }
  }

  bool _validateForm() {
    if (shippingAddress.value.fullName.isEmpty ||
        shippingAddress.value.addressLine1.isEmpty ||
        shippingAddress.value.city.isEmpty ||
        shippingAddress.value.state.isEmpty ||
        shippingAddress.value.postalCode.isEmpty ||
        shippingAddress.value.phoneNumber.isEmpty ||
        shippingAddress.value.email.isEmpty) {
      Get.snackbar(
        'Champs manquants',
        'Veuillez remplir tous les champs obligatoires',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    if (!GetUtils.isEmail(shippingAddress.value.email)) {
      Get.snackbar(
        'Email invalide',
        'Veuillez entrer une adresse email valide',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    return true;
  }

  OrderModel _createOrder() {
    final now = DateTime.now();

    // Convertir les articles du panier en OrderItems
    final orderItems = cartItems
        .map((item) => OrderItem(
              productId: '${item.hashCode}',
              name: item.nom,
              quantity: item.quantite,
              price: item.prix,
            ))
        .toList();

    return OrderModel(
      id: orderId,
      userId:
          'current_user_id', // À remplacer par l'ID de l'utilisateur connecté
      items: orderItems,
      subtotal: subtotal,
      shippingCost: shippingCost,
      total: total,
      orderDate: now,
      status: 'En attente',
      shippingAddress: shippingAddress.value,
      paymentMethod: PaymentMethod(type: selectedPaymentMethod.value),
    );
  }
}

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(() => CheckoutController());
  }
}
