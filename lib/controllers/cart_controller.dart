
import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';
import '../models/cart_model.dart';
import '../utils/colors.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};

  Map<int,CartModel> get items=>_items;

  void addItem(ProductModel product, int quantity){
    var totalQuantitiy = 0;
    if(_items.containsKey(product.id!)){
      _items.update(product.id!, (value) {

        totalQuantitiy = value.quantity!+quantity;

        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity:value.quantity!+quantity,
            isExist: true,
            time: DateTime.now().toString(),
          product: product,
        );
      });

       if(totalQuantitiy<=0){
         _items.remove(product.id!);
       }
    }else{
    if(quantity>0){
      //  print("length of the item is "+_items.length.toString());
      _items.putIfAbsent(product.id!, () {
        print(("Adding item to the cart id "+product.id!.toString()+" quantity"+quantity.toString()));
        _items.forEach((key, value) {
          print("quantity is "+value.quantity.toString());
        });
        return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product,
        );
      });
    }else{
      Get.snackbar("Dear user", "You should add atleast on item to the cart..!",
                        backgroundColor: AppColors.mainColor,
                        colorText: Colors.white);
    }
      }
    update();
   }

   bool existInCart(ProductModel product){
    if(_items.containsKey(product.id)){
      return true;
    }
    return false;

   }

  int getQuantity(ProductModel product){
    var quantity = 0;
     if(_items.containsKey(product.id!)){
       _items.forEach((key, value) {
         if(key==product.id){
           quantity = value.quantity!;
  }
  });
  }
     return quantity;

   }

   int get totalItems{

    var totalQuantity = 0;
    _items.forEach((key, value) {
      //totalQuantity+=value.quantity!;
      totalQuantity = totalQuantity + value.quantity!;
    });
    return totalQuantity;

   }

   List<CartModel>  get getItems{
    return _items.entries.map((e) {
      return e.value;
    }).toList();
   }

   int get totalAmount{
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity!*value.price!;
    });

    return total;
}
}