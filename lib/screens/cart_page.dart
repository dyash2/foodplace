import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  static const routeName = "/cartpage";
  
 @override
Widget build(BuildContext context) {
  final itemInCart = ModalRoute.of(context)!.settings.arguments as String?;
  
  // Check if itemInCart is null and handle it gracefully
  if (itemInCart == null) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Text('Item not found in cart'),
      ),
    );
  }

  // Use the itemInCart variable in your CartPage UI
  return Scaffold(
    appBar: AppBar(
      title: Text('Cart'),
    ),
    body: Center(
      child: Text(itemInCart),
    ),
  );
}
}
