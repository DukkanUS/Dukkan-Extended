import '../../../models/entities/coupon.dart';
class CustomCouponDetailsEntity
{
  Coupons coupons;
  double totalDiscount;
  bool isFreeShipping;

  CustomCouponDetailsEntity({required this.coupons,required this.totalDiscount,required this.isFreeShipping});

}