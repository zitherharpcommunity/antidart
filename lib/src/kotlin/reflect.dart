// ignore_for_file: non_constant_identifier_names

/// Runtime API for [Kotlin reflection](https://kotlinlang.org/docs/reference/reflection.html).
library kotlin.reflect;

import '/src/kotlin.dart';

/// Makes the annotated annotation class an associated object key.
const AssociatedObjectKey = _AssociatedObjectKey();

/// The experimental marker for associated objects API.
const ExperimentalAssociatedObjects = _ExperimentalAssociatedObjects();

/// Casts the given [value] to the class represented by this [T] object.
///
/// Throws an exception if the value is `null` or if it is not an instance of this class.
T cast<T>(Any value) => value as T;

/// Creates a contravariant projection of a given [type],
/// denoted by the `in` modifier applied to a type.
///
/// For example, in the type `MutableList<in Number>`,
/// in [Number] is a contravariant projection of the type of class [Number].
KTypeProjection contravariant(KType type) => (type, KVariance.IN);

/// Creates a covariant projection of a given [type],
/// denoted by the `out` modifier applied to a type.
///
/// For example, in the type `Array<out Number>`, `out Number`
/// is a covariant projection of the type of class [Number].
KTypeProjection covariant(KType type) => (type, KVariance.OUT);

/// If [T] is an @AssociatedObjectKey-annotated annotation class
/// and this class is annotated with @T (S::class), returns object [S].
Any findAssociatedObject<T extends AnnotationTarget>() =>
    throw UnimplementedError('findAssociatedObject');

/// Creates an invariant projection of a given [type].
///
/// Invariant projection is just the type itself,
/// without any use-site variance modifiers applied to it.
///
/// For example, in the type `Set<String>`, [String]
/// is an invariant projection of the type represented by the class [String].
KTypeProjection invariant(KType type) => (type, KVariance.INVARIANT);

/// Star projection, denoted by the * character.
///
/// For example, in the type KClass<*>, * is the star projection.
///
/// See the [Kotlin language documentation](https://kotlinlang.org/docs/visibility-modifiers.html) for more information.
KTypeProjection get STAR => (null, null);

/// Casts the given [value] to the class represented by this [T] object.
///
/// Returns `null` if the value is `null` or if it is not an instance of this class.
T? safeCast<T>(Any value) => value as T?;

/// Returns a runtime representation of the given reified type [T] as an instance of [Type].
Type typeOf<T>(T value) => value.runtimeType;

/// Represents a function with introspection capabilities.
typedef KFunction = Function;

/// Represents a type.
///
/// Type is usually either a class with optional type arguments,
/// or a type parameter of some declaration, plus nullability.
typedef KType = Type;

/// Represents a type projection.
///
/// Type projection is usually the argument to another type in a type usage.
///
/// For example, in the type `Array<out Number>`, `out Number`
/// is the covariant projection of the type represented by the class [Number].
///
/// Type projection is either the star projection, or an entity consisting of a specific type plus optional variance.
///
/// See the [Kotlin language documentation](https://kotlinlang.org/docs/visibility-modifiers.html) for more information.
typedef KTypeProjection = (KType?, KVariance?);

/// Represents variance applied to a type parameter
/// on the declaration site *(declaration-site variance)*,
/// or to a type in a projection *(use-site variance)*.
///
/// See the [Kotlin language documentation](https://kotlinlang.org/docs/visibility-modifiers.html) for more information.
enum KVariance {
  /// The affected type parameter or type is invariant,
  /// which means it has no variance applied to it.
  INVARIANT,

  /// The affected type parameter or type is contravariant.
  ///
  /// Denoted by the in modifier in the source code.
  IN,

  /// The affected type parameter or type is covariant.
  ///
  /// Denoted by the out modifier in the source code.
  OUT,
}

/// Visibility is an aspect of a Kotlin declaration regulating
/// where that declaration is accessible in the source code.
/// Visibility can be changed with one of the following modifiers:
/// `public`, `protected`, `internal`, `private`.
///
/// Note that some Java visibilities such as package-private and protected
/// (which also gives access to items from the same package) cannot be represented in Kotlin,
/// so there's no [KVisibility] value corresponding to them.
///
/// See the [Kotlin language documentation](https://kotlinlang.org/docs/visibility-modifiers.html) for more information.
enum KVisibility {
  /// Visibility of declarations marked with the `public` modifier, or with no modifier at all.
  PUBLIC,

  /// Visibility of declarations marked with the `protected` modifier.
  PROTECTED,

  /// Visibility of declarations marked with the `internal` modifier.
  INTERNAL,

  /// Visibility of declarations marked with the `private` modifier.
  PRIVATE,
}

/// Makes the annotated annotation class an associated object key.
///
/// An associated object key annotation should have single KClass parameter.
/// When applied to a class with reference to an object declaration as an argument,
/// it binds the object to the class, making this binding discoverable at runtime
/// using [findAssociatedObject].
@Target([
  AnnotationTarget.ANNOTATION_CLASS,
])
final class _AssociatedObjectKey {
  const _AssociatedObjectKey();
}

/// The experimental marker for associated objects API.
@Target([
  AnnotationTarget.ANNOTATION_CLASS,
])
final class _ExperimentalAssociatedObjects {
  const _ExperimentalAssociatedObjects();
}

@Target([
  AnnotationTarget.CLASS,
  AnnotationTarget.ANNOTATION_CLASS,
  AnnotationTarget.PROPERTY,
  AnnotationTarget.FIELD,
  AnnotationTarget.LOCAL_VARIABLE,
  AnnotationTarget.VALUE_PARAMETER,
  AnnotationTarget.CONSTRUCTOR,
  AnnotationTarget.FUNCTION,
  AnnotationTarget.PROPERTY_GETTER,
  AnnotationTarget.PROPERTY_SETTER,
  AnnotationTarget.TYPEALIAS,
])
final class _ExperimentalReflectionOnLambdas {
  const _ExperimentalReflectionOnLambdas();
}

/// This annotation marks the experimental kotlin-reflect API 
/// that allows to approximate a Kotlin lambda 
/// or a function expression instance to a KFunction instance. 
/// 
/// The behavior of this API may be changed 
/// or the API may be removed completely in any further release.
const ExperimentalReflectionOnLambdas = _ExperimentalReflectionOnLambdas();

/// An exception that is thrown when the code tries to introspect a property of a class
/// or a package and that class or the package no longer has that property.
final class NoSuchPropertyException implements Exception {
  /// The original exception thrown by the JVM.
  final Exception? cause;

  NoSuchPropertyException({this.cause});
}

/// An exception that is thrown when `call` is invoked on a callable
/// or `get` or `set` is invoked on a property
/// and that callable is not accessible (in JVM terms) from the calling method.
final class IllegalCallableAccessException implements Exception {
  /// The original exception thrown by the JVM.
  final Exception? cause;

  IllegalCallableAccessException({this.cause});
}

/// An exception that is thrown when `getDelegate` is invoked on a [KProperty] object
/// that was not made accessible with [isAccessible].
final class IllegalPropertyDelegateAccessException implements Exception {
  /// The original exception thrown by the JVM.
  final Exception? cause;

  IllegalPropertyDelegateAccessException({this.cause});
}
