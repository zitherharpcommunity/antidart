/// Runtime API for [Kotlin reflection](https://kotlinlang.org/docs/reference/reflection.html).
library kotlin.reflect;

import 'core.dart';

/// Casts the given [value] to the class represented by this [T] object.
///
/// Throws an exception if the value is `null` or if it is not an instance of this class.
T cast<T>(Any value) => value as T;

/// If [T] is an @AssociatedObjectKey-annotated annotation class 
/// and this class is annotated with @T (S::class), returns object [S].
Any findAssociatedObject<T>() => throw UnimplementedError('findAssociatedObject');

/// Casts the given [value] to the class represented by this [T] object.
///
/// Returns `null` if the value is `null` or if it is not an instance of this class.
T? safeCast<T>(Any value) => value as T?;

/// Returns a runtime representation of the given reified type [T] as an instance of [Type].
Type typeOf<T>(T value) => value.runtimeType;
