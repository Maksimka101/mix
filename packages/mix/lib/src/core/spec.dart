import 'package:flutter/foundation.dart';

import '../attributes/animated/animated_data.dart';
import '../attributes/animated/animated_data_dto.dart';
import '../attributes/scalars/scalar_util.dart';
import '../internal/compare_mixin.dart';
import 'attribute.dart';
import 'factory/mix_data.dart';

@immutable
abstract class Spec<T extends Spec<T>> with EqualityMixin {
  final AnimatedData? animated;

  const Spec({this.animated});

  Type get type => T;

  bool get isAnimated => animated != null;

  /// Creates a copy of this spec with the given fields
  /// replaced by the non-null parameter values.
  T copyWith();

  /// Linearly interpolate with another [Spec] object.
  T lerp(covariant T? other, double t);
}

/// An abstract class representing a resolvable attribute.
///
/// This class extends the [StyledAttribute] class and provides a generic type [Self] and [Value].
/// The [Self] type represents the concrete implementation of the attribute, while the [Value] type represents the resolvable value.
abstract base class SpecAttribute<Value> extends StyledAttribute {
  final AnimatedDataDto? animated;

  const SpecAttribute({this.animated});

  Value resolve(MixData mix);

  @override
  SpecAttribute<Value> merge(covariant SpecAttribute<Value>? other);
}

abstract base class SpecUtility<Attr extends Attribute,
    Value extends SpecAttribute> implements MixUtility<Attr, Value> {
  @override
  final Attr Function(Value) builder;
  const SpecUtility(this.builder);

  Attr only();
}
