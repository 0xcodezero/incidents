import 'package:equatable/equatable.dart';

abstract class BaseEnum<V> extends Equatable {
  final V value;
  const BaseEnum(this.value);

  @override
  List<Object?> get props => [value];
}

abstract class BaseEnum2<V, E extends BaseEnum2<V, E>> extends Equatable {
  final V value;
  const BaseEnum2(this.value);

  bool matchAny(List<E> list) => list.contains(this);

  @override
  List<Object?> get props => [value];
}
