import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_initial/domain/models/order_model.dart';
import 'package:code_initial/presentation/pages/checkout/checkout_controller.dart';

class CheckoutPage extends GetView<CheckoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passer la commande'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.orderPlaced.value) {
          return _buildOrderConfirmation();
        }
        return SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Adresse de livraison'),
              _buildAddressForm(),
              SizedBox(height: 24),
              _buildSectionTitle('Méthode de paiement'),
              _buildPaymentMethods(),
              SizedBox(height: 24),
              _buildOrderSummary(),
              SizedBox(height: 32),
              _buildPlaceOrderButton(),
              SizedBox(height: 16),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAddressForm() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField(
              label: 'Nom complet',
              onChanged: (value) => controller.updateShippingAddress(fullName: value),
            ),
            SizedBox(height: 12),
            _buildTextField(
              label: 'Adresse ligne 1',
              onChanged: (value) => controller.updateShippingAddress(addressLine1: value),
            ),
            SizedBox(height: 12),
            _buildTextField(
              label: 'Adresse ligne 2 (optionnel)',
              onChanged: (value) => controller.updateShippingAddress(addressLine2: value),
              optional: true,
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    label: 'Ville',
                    onChanged: (value) => controller.updateShippingAddress(city: value),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _buildTextField(
                    label: 'Région',
                    onChanged: (value) => controller.updateShippingAddress(state: value),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    label: 'Code postal',
                    keyboardType: TextInputType.number,
                    onChanged: (value) => controller.updateShippingAddress(postalCode: value),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _buildTextField(
                    label: 'Pays',
                    initialValue: 'Côte d\'Ivoire',
                    readOnly: true,
                    onChanged: (value) => controller.updateShippingAddress(country: value),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            _buildTextField(
              label: 'Téléphone',
              keyboardType: TextInputType.phone,
              onChanged: (value) => controller.updateShippingAddress(phoneNumber: value),
            ),
            SizedBox(height: 12),
            _buildTextField(
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => controller.updateShippingAddress(email: value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required Function(String) onChanged,
    TextInputType keyboardType = TextInputType.text,
    bool readOnly = false,
    bool optional = false,
    String? initialValue,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: '$label${optional ? ' (optionnel)' : ''}',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
      keyboardType: keyboardType,
      readOnly: readOnly,
      onChanged: onChanged,
    );
  }

  Widget _buildPaymentMethods() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPaymentMethodTile(
              'Paiement à la livraison',
              'on_delivery',
              Icons.local_shipping,
            ),
            Divider(),
            _buildPaymentMethodTile(
              'Carte de crédit',
              'credit_card',
              Icons.credit_card,
            ),
            Divider(),
            _buildPaymentMethodTile(
              'Orange Money',
              'orange_money',
              Icons.phone_android,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodTile(String title, String value, IconData icon) {
    return Obx(
      () => RadioListTile<String>(
        title: Row(
          children: [
            Icon(icon, color: Colors.blue),
            SizedBox(width: 12),
            Text(title),
          ],
        ),
        value: value,
        groupValue: controller.selectedPaymentMethod.value,
        onChanged: (String? newValue) {
          if (newValue != null) {
            controller.selectPaymentMethod(newValue);
          }
        },
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Résumé de la commande'),
            SizedBox(height: 12),
            _buildPriceRow('Sous-total', controller.subtotal),
            _buildPriceRow('Frais de livraison', controller.shippingCost),
            Divider(),
            _buildPriceRow(
              'Total',
              controller.total,
              isBold: true,
              textColor: Theme.of(Get.context!).primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(String label, double amount, {bool isBold = false, Color? textColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            '${amount.toStringAsFixed(2)} FCFA',
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceOrderButton() {
    return Obx(() => SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: controller.isProcessing.value ? null : () => controller.placeOrder(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(Get.context!).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: controller.isProcessing.value
                ? CircularProgressIndicator(color: Colors.white)
                : Text(
                    'Passer la commande',
                    style: TextStyle(fontSize: 16),
                  ),
          ),
        ));
  }

  Widget _buildOrderConfirmation() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 24),
            Text(
              'Commande confirmée!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Votre commande a été passée avec succès. Vous recevrez bientôt un email de confirmation.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Get.until((route) => route.isFirst);
              },
              child: Text('Retour à l\'accueil'),
            ),
          ],
        ),
      ),
    );
  }
}
