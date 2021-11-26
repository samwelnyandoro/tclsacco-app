library paymentmethod;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paymentmethod.g.dart';

abstract class PaymentMethod
    implements Built<PaymentMethod, PaymentMethodBuilder> {
  int get paymentMethodId;
  String get paymentMethod;
  String get createdAt;
  @nullable
  String get updatedAt;

  PaymentMethod._();
  factory PaymentMethod([updates(PaymentMethodBuilder paymentMethodBuilder)]) =
      _$PaymentMethod;
  static Serializer<PaymentMethod> get serializer => _$paymentMethodSerializer;
}
