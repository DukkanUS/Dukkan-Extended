import 'package:collection/collection.dart';
import 'package:inspireui/widgets/coupon_card.dart';
import '../../models/cart/cart_base.dart';

import '../../models/entities/coupon.dart';
import '../custom_constants.dart';
import '../custom_entities/auto_apply_coupons/custom_coupon_entity.dart';
import '../custom_services/custom_services.dart';

class AutoApplyCouponController {

  //region methods

  static Future<List<Discount>> _getDiscountsList(
      {required CartModel cartModel, required List<String?> codes}) async {
    try {
      if (CustomConstants.useFirstAutoAppliedCoupon) {
        var discount = await Coupons.getDiscount(
            cartModel: cartModel, couponCode: codes.first);
        if (discount == null) {
          throw Exception('');
        }
        return [discount];
      } else {
        var oList = await Coupons.getDiscountList(
            cartModel: cartModel, couponCodes: codes);
        if (oList == null) {
          throw Exception('');
        }
        return oList;
      }
    } catch (ex) {
      return List<Discount>.empty();
    }
  }

  //endregion

  static Coupons? autoApplyCoupons;

  static Future<void> initialize() async {
    try {
      var response = await CustomServices.getAutoApplyCoupons();
      autoApplyCoupons = response;
      autoApplyCoupons?.coupons.removeWhere((element) => element.isExpired);
    } catch (_) {
      autoApplyCoupons = null;
    }
  }

  static List<Coupon>? toApplyCoupons;

  static Future<CustomCouponDetailsEntity?> getAutoApplyCouponsDetails(
       CartModel cartModel) async {

    ///reset to use the latest value in order.ToJson()
    toApplyCoupons = null;


    if (autoApplyCoupons == null) {
      return null;
    }


    var totalDiscount = 0.0;
    var isFreeShipping = false;

    var validCoupons = Coupons.getListCoupons([]);

    var discountsList = await _getDiscountsList(
        cartModel: cartModel,
        codes: autoApplyCoupons!.coupons.map((e) => e.code).toList());

    for (var coupon in autoApplyCoupons!.coupons) {
      try {
        if (cartModel.couponObj?.code == coupon.code) {
          throw Exception('The User Already Use/(Apply) The Coupon');
        }

        var discount = discountsList
            .where((d) => d.coupon?.code == coupon.code)
            .firstOrNull;

        totalDiscount += (discount?.discountValue ?? 0.0);
        if ((discount?.coupon?.freeShipping ?? false) &&
            isFreeShipping == false) {
          isFreeShipping = true;
        }

        if (discount != null &&
            discount.coupon != null &&
            !(discount.coupon?.isExpired ?? false)) {
          validCoupons.coupons.add(discount.coupon!);
        }
      } catch (_) {}
    }

    toApplyCoupons = validCoupons.coupons.map((e) => e).toList();

    return CustomCouponDetailsEntity(
        coupons: validCoupons,
        totalDiscount: totalDiscount,
        isFreeShipping: isFreeShipping);
  }
}
