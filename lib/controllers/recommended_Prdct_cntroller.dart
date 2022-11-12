import 'package:flutter/material.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';
import '../data/repository/recommended_prdct_repo.dart';
import '../models/cart_model.dart';
import '../utils/colors.dart';
import 'cart_controller.dart';

class RecommendedPrdctController extends GetxController{
  RecommendedPrdctRepo recommendedPrdctRepo;
  RecommendedPrdctController({required this.recommendedPrdctRepo});


  List<dynamic> _recommendedPrdctList = [];
  List<dynamic> get recommendedPrdctList => _recommendedPrdctList;
  late CartController _cart;
  Map<int, ProductModel> _items = {};

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int  _quantity = 0;
  int get quantity => _quantity;
  int _inCartItem = 0;
  int get inCartItem => _inCartItem+_quantity;
  //int hearttouch;
  bool heart=false;




  Future<void> getRecommendedPrdctList() async{
    Response response = await recommendedPrdctRepo.getRecommendedPrdctList();

    if(response.statusCode == 200) {

      _recommendedPrdctList = [];
      _recommendedPrdctList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }else{
    print("not get");
    print(response);
    }
  }


  void setQuantity(bool isIncrement){
    if(isIncrement){
      print("incremnt RP"+_quantity.toString());
      _quantity = checkQuantity(_quantity+1);
    }else{
      print("decremnt RP"+_quantity.toString());
      _quantity = checkQuantity(_quantity-1);
    }
    update();
  }
  void hearttouch(bool isTouch){
    if(isTouch){
      print("touched");
      var mincolor = Colors.greenAccent;

    }else{
    var topcolor = Colors.yellowAccent;
    }
  }








  int checkQuantity(int qty){
    if((_inCartItem+qty)<0){
      Get.snackbar("Dear user", "You can't reduce more!",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white);
      return 0;
    }else if(_inCartItem+qty>20){
      Get.snackbar("Dear user", "You can't add more!",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white);
      if(_inCartItem>0){
        _quantity = -_inCartItem;
        return _quantity;
      }
      return 20;
    }else{
      return qty;
    }
  }

  void initProduct(ProductModel product,CartController cart){
    _quantity=0;
    _inCartItem=0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    print("exist or not"+exist.toString());
    if(exist){
      _inCartItem = _cart.getQuantity(product);
    }
    print("the quantity in carts is"+_inCartItem.toString());
  }


  void addItem(ProductModel product){

    _cart.addItem(product, _quantity);

    _quantity=0;
    _inCartItem = _cart.getQuantity(product);

    _cart.items.forEach((key, value) {
      print("the id is"+value.id.toString()+" the quantity is "+value.quantity.toString());
    });
    update();

  }

  int get totalItems{
    return _cart.totalItems;
  }

  List<CartModel> get getItems{
    return _cart.getItems;
  }

  int get totalQuantity{
    return _cart.totalItems;
  }

  int get totalAmount{
    var total = 0;
    _items.forEach((key, value) {
      total += totalQuantity*value.price!;
    });

    return total;
  }

  //  void Hearttouch(bool istouch){
  //   if(istouch=true){
  //     print("touched");
  //   }
  //    print("not touch");
  // }

}