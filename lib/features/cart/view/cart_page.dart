import 'package:auto_route/auto_route.dart';
import 'package:diagnostic_app/data/model/view_cart_model.dart';
import 'package:diagnostic_app/features/cart/view/widget/cart_bottom_bar.dart';
import 'package:diagnostic_app/features/cart/view/widget/cart_item_tile.dart';
import 'package:diagnostic_app/features/cart/view/widget/cart_summary.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CartPage extends StatelessWidget {
  final List<CartData> cartItems;
  const CartPage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return CartView(
      cartItems: cartItems,
    );
  }
}

class CartView extends StatelessWidget {
  final List<CartData> cartItems;
  const CartView({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    // Sample cart data (this would come from your API)
    // final List<Map<String, dynamic>> cartItems = [
    //   {
    //     'cart_id': '1',
    //     'test_name': 'Complete Blood Count (CBC)',
    //     'quantity': 1,
    //     'test_price': 299.0,
    //   },
    //   {
    //     'cart_id': '2',
    //     'test_name': 'Thyroid Function Test',
    //     'quantity': 2,
    //     'test_price': 599.0,
    //   },
    //   {
    //     'cart_id': '3',
    //     'test_name': 'Vitamin D Test',
    //     'quantity': 1,
    //     'test_price': 799.0,
    //   },
    // ];

    // Calculate total price
    // double totalPrice =
    //     cartItems.fold(0, (sum, item) => sum + (item.unitPrice * item['quantity']));

    //caculate total price 
    double totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += double.tryParse(item.unitPrice)! * int.tryParse(item.quantity)!;
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            onPressed: () {
              // Refresh cart functionality would go here
            },
          ),
        ],
        title: const Text(
          'My Cart',
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: cartItems.isEmpty
          ? const EmptyCartView()
          : CartItemsView(cartItems: cartItems, totalPrice: totalPrice),
      bottomNavigationBar: cartItems.isEmpty ? null : CartBottomBar(totalPrice: totalPrice),
    );
  }
}

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/empty_cart.png', // Add this image to your assets
            height: 150,
            width: 150,
          ),
          const SizedBox(height: 20),
          const Text(
            'Your cart is empty',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Add tests to your cart to proceed',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Navigate to home/tests page
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E88E5),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text(
              'Browse Tests',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemsView extends StatelessWidget {
  final List<CartData> cartItems;
  final double totalPrice;

  const CartItemsView({
    super.key,
    required this.cartItems,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartHeader(itemCount: cartItems.length),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: cartItems.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return CartItemTile(
                cartId: item.cartId,
                testName: item.testName,
                quantity: int.tryParse(item.quantity)!,
                price: double.tryParse(item.unitPrice)!,
              );
            },
          ),
        ),
        const Divider(height: 1),
        CartSummary(totalPrice: totalPrice),
      ],
    );
  }
}

class CartHeader extends StatelessWidget {
  final int itemCount;

  const CartHeader({
    super.key,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      color: const Color(0xFF1E88E5).withOpacity(0.1),
      child: Row(
        children: [
          const Icon(
            Icons.shopping_cart,
            color: Color(0xFF1E88E5),
          ),
          const SizedBox(width: 10),
          Text(
            '$itemCount ${itemCount == 1 ? 'item' : 'items'} in your cart',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
