/// Standard implementations of delegates for
/// [delegated properties](https://kotlinlang.org/docs/delegated-properties.html)
/// and helper functions for implementing custom delegates.
library kotlin.properties;

import 'package:antidart/kotlin.dart';

/// Standard property delegates.
sealed class Delegates {}

/// Implements the core logic of a property delegate
/// for a read/write property that calls callback functions when changed.
abstract class ObservableProperty<V> extends ReadWriteProperty<Any?, V> {
  /// The initial value of the property.
  final V initialValue;

  /// Implements the core logic of a property delegate
  /// for a read/write property that calls callback functions when changed.
  const ObservableProperty(this.initialValue);

  /// The callback which is called after the change of the property is made.
  ///
  /// The value of the property has already been changed when this callback is invoked.
  external fun afterChange(
    KProperty<Any> property,
    V oldValue,
    V newValue,
  );

  /// The callback which is called before a change to the property value is attempted.
  ///
  /// The value of the property hasn't been changed yet, when this callback is invoked.
  ///
  /// If the callback returns `true` the value of the property is being set to the new value,
  /// and if the callback returns `false` the new value is discarded and the property remains its old value.
  external Boolean beforeChange(
    KProperty<Any> property,
    V oldValue,
    V newValue,
  );

  @override
  external V getValue(
    Any? thisRef,
    KProperty<Any> property,
  );

  /// Sets the value of the property for the given object.
  @override
  external fun setValue(
    Any? thisRef,
    KProperty<Any> property,
    V value,
  );

  @override
  external String toString();
}

/// Base interface that can be used for implementing property delegate providers.
///
/// This is provided only for convenience.
/// You don't have to extend this interface
/// as long as your delegate provider has a method with the same signature.
///
/// **Parameters**:
/// * [T] - the type of object which owns the delegated property.
///
/// * [D] - the type of property delegates this provider provides.
abstract interface class PropertyDelegateProvider<T, D> {
  const PropertyDelegateProvider();

  /// Returns the delegate of the property for the given object.
  external D provideDelegate(
    T thisRef,
    KProperty<Any> property,
  );
}

/// Base interface that can be used for
/// implementing property delegates of read-only properties.
///
/// This is provided only for convenience.
///
/// You don't have to extend this interface
/// as long as your property delegate has methods with the same signatures.
///
/// **Parameters**:
/// * [T] - the type of object which owns the delegated property.
///
/// * [V] - the type of the property value.
abstract interface class ReadOnlyProperty<T, V> {
  const ReadOnlyProperty();

  /// Returns the value of the property for the given object.
  V getValue(
    T thisRef,
    KProperty<Any> property,
  );
}

/// Base interface that can be used for
/// implementing property delegates of read-write properties.
///
/// This is provided only for convenience.
/// You don't have to extend this interface
/// as long as your property delegate has methods with the same signatures.
///
/// **Parameters**:
/// * [T] - the type of object which owns the delegated property.
///
/// * [V] - the type of the property value.
abstract interface class ReadWriteProperty<T, V>
    extends ReadOnlyProperty<T, V> {
  const ReadWriteProperty();

  /// Returns the value of the property for the given object.
  @override
  V getValue(
    T thisRef,
    KProperty<Any> property,
  );

  /// Sets the value of the property for the given object.
  fun setValue(
    T thisRef,
    KProperty<Any> property,
    V value,
  );
}
