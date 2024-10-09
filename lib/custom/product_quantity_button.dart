import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart/cart_base.dart';
import '../models/entities/product.dart';

class ProductQuantityButton extends StatefulWidget {
  final Product product;

  const ProductQuantityButton({super.key, required this.product});

  @override
  State<ProductQuantityButton> createState() => _ProductQuantityButtonState();
}

class _ProductQuantityButtonState extends State<ProductQuantityButton> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    // Get initial quantity from the cart if the product is already in the cart, else set to 0.
    quantity = context.read<CartModel>().productsInCart[widget.product.id] ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final cartModel = context.watch<CartModel>();
    final currentCartQuantity = cartModel.productsInCart[widget.product.id] ?? 0;

    // Detect if there are changes in the quantity.
    var hasChanges = quantity != currentCartQuantity;
    var canDecrease = quantity > 0;
    var canIncrease = quantity < 100;

    // Text for the action button based on the current and selected quantity.
    String actionText() {
      if (quantity == 0 && currentCartQuantity == 0) return 'Add'; // Case: not in cart, show Add
      if (quantity == 0) return 'Remove';
      if (quantity < currentCartQuantity) return 'Change qty';
      if (quantity > currentCartQuantity) return (currentCartQuantity == 0) ? 'Add' : 'Change qty';
      return 'In Cart';
    }

    // Color of the action button: Primary color for actions, grey when no action.
    Color actionButtonColor() {
      return hasChanges || (quantity == 0 && currentCartQuantity == 0)
          ? Theme.of(context).primaryColor
          : Colors.grey;
    }

    // Perform the action when the button is tapped.
    void handleAction() {
      if (!hasChanges && !(quantity == 0 && currentCartQuantity == 0)) {
        return; // No action to take
      }

      if (quantity == 0 && currentCartQuantity > 0) {
        // If quantity is 0 and the product is in the cart, remove it.
        cartModel.removeItemFromCart(widget.product.id);
      } else if (currentCartQuantity == 0) {
        // If product is not in the cart, add it with at least a quantity of 1.
        var qtyToAdd = quantity > 0 ? quantity : 1;
        cartModel.addProductToCart(product: widget.product,quantity: qtyToAdd);
        setState(() {
          quantity = context.read<CartModel>().productsInCart[widget.product.id] ?? 0;
        });
      } else {
        // Otherwise, update the cart with the new quantity.
        cartModel.updateQuantity(widget.product, widget.product.id, quantity);
      }
    }

    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: MediaQuery.sizeOf(context).width * .4,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.05),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: canDecrease
                          ? () => setState(() => quantity--)
                          : null,
                      icon: Icon(
                        quantity == 1 ? CupertinoIcons.delete : Icons.remove,
                        color: canDecrease ? Colors.black : Colors.grey,
                      ),
                    ),
                    Text('$quantity', style: const TextStyle(fontSize: 18)),
                    IconButton(
                      onPressed: canIncrease
                          ? () => setState(() => quantity++)
                          : null,
                      icon: Icon(
                        Icons.add,
                        color: canIncrease ? Colors.green : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: handleAction,
                child: Container(
                  height: 50,
                  width: MediaQuery.sizeOf(context).width * .4,
                  decoration: BoxDecoration(
                    color: actionButtonColor(),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      actionText(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../models/cart/cart_base.dart';
// import '../models/entities/product.dart';
//
// class ProductQuantityButton extends StatefulWidget {
//   final Product product;
//
//   const ProductQuantityButton(
//       {super.key, required this.product,});
//
//   @override
//   State<ProductQuantityButton> createState() => _ProductQuantityButtonState();
// }
//
// class _ProductQuantityButtonState extends State<ProductQuantityButton> {
//   late int quantity;
//
//   @override
//   void initState() {
//     super.initState();
//
//     ///Entry Cart Quantity
//     quantity = context
//         .read<CartModel>()
//         .productsInCart[widget.product.id] ?? 0;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var currentCartQuantity = context
//         .watch<CartModel>()
//         .productsInCart[widget.product.id] ?? 0;
//     return Container(
//       color: Theme
//           .of(context)
//           .colorScheme
//           .background,
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: SafeArea(
//         top: false,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               Container(color: Colors.black.withOpacity(.1),
//                 height: 50,
//                 width: 150,
//                 margin: const EdgeInsets.all(10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                         onPressed: () {
//
//                           if(quantity > 0)
//                           {
//                             setState(() {
//                               quantity--;
//                             });
//                           }
//                           else
//                           {
//                             print('WILL NOT REDUCE ');
//                           }
//                         }, icon: (quantity == 1) ? const Icon(Icons.clear) : const Icon(Icons.remove)),
//                     Text('$quantity'),
//                     IconButton(onPressed: () {
//
//
//                       ///as if  100 is the max to add
//                       if(quantity < 100)
//                       {
//                         setState(() {
//                           quantity++;
//                         });
//                       }
//
//                     }, icon: const Icon(Icons.add)),
//                   ],
//                 ),
//               ),
//               const Spacer(),
//               GestureDetector(child: Container(color: Theme
//                   .of(context)
//                   .primaryColor, height: 50, width: 150,
//
//                 child: Center(child: Builder(
//                     builder: (context) {
//                       if (quantity == currentCartQuantity) {
//                         return Text('no action as same quantoty of enter', style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold),);
//
//                       }
//                       else if (quantity < currentCartQuantity && quantity != 0) {
//                         return Text('update cart by reduce', style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold),);
//                       }
//                       else if (quantity > currentCartQuantity)
//                       {
//                         return Text('update cart by add', style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold),);
//                       }
//                       else
//                       {
//                         return Text('remove', style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold),);
//                       }
//
//                     }
//                 ),
//
//                 ),
//
//
//               ),
//                 onTap: (){
//                   var cartModel = context.read<CartModel>();
//                   if (quantity == currentCartQuantity) {
//                     print('no action as same quantoty of enter');
//                     return;
//                   }
//                   else if (quantity < currentCartQuantity && quantity != 0) {
//
//                     if(currentCartQuantity == 0)
//                     {
//                       print('no redue will happen ');
//                     }
//                     else
//                     {
//                       print('update cart by reduce');
//                       cartModel.updateQuantity(widget.product,widget.product.id,quantity);
//                     }
//
//
//                     return;
//
//                   }
//                   else if (quantity > currentCartQuantity )
//                   {
//                     print('update cart by add');
//                     cartModel.updateQuantity(widget.product,widget.product.id,quantity);
//
//                     return;
//
//
//                   }
//                   else
//                   {
//                     print('REMOVE');
//                     cartModel.removeItemFromCart(widget.product.id);
//                     return;
//
//
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
// }

