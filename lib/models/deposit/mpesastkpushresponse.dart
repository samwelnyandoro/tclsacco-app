library mpesastkpushresponse;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mpesastkpushresponse.g.dart';

abstract class MpesaSTKResponse
    implements Built<MpesaSTKResponse, MpesaSTKResponseBuilder> {
  @BuiltValueField(wireName: 'MerchantRequestID')
  String get merchantRequestID;

  @BuiltValueField(wireName: 'CheckoutRequestID')
  String get checkoutRequestID;

  @BuiltValueField(wireName: 'ResponseCode')
  String get responseCode;

  @BuiltValueField(wireName: 'ResponseDescription')
  String get responseDescription;

  @BuiltValueField(wireName: 'CustomerMessage')
  String get customerMessage;

  MpesaSTKResponse._();
  factory MpesaSTKResponse(
          [updates(MpesaSTKResponseBuilder mpesaSTKResponseBuilder)]) =
      _$MpesaSTKResponse;
  static Serializer<MpesaSTKResponse> get serializer =>
      _$mpesaSTKResponseSerializer;
}
