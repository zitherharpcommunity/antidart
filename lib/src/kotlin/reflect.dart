// ignore_for_file: non_constant_identifier_names

/// Runtime API for [Kotlin reflection](https://kotlinlang.org/docs/reference/reflection.html).
library kotlin.reflect;

import '../../kotlin.dart';

export 'reflect/full.dart';
export 'reflect/jvm.dart';

/// Makes the annotated annotation class an associated object key.
const associatedObjectKey = AssociatedObjectKey();

/// The experimental marker for associated objects API.
const experimentalAssociatedObjects = ExperimentalAssociatedObjects();

/// Star projection, denoted by the * character.
///
/// For example, in the type KClass<*>, * is the star projection.
///
/// See the [Kotlin language documentation](https://kotlinlang.org/docs/visibility-modifiers.html) for more information.
KTypeProjection get STAR => (null, null);

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

/// Casts the given [value] to the class represented by this [T] object.
///
/// Returns `null` if the value is `null` or if it is not an instance of this class.
T? safeCast<T>(Any value) => value as T?;

/// Returns a runtime representation of the given reified type [T] as an instance of [Type].
Type typeOf<T>(T value) => value.runtimeType;

/// Represents a type projection.
///
/// Type projection is usually the argument to another type in a type usage.
///
/// For example, in the type `Array<out Number>`, `out Number`
/// is the covariant projection of the type represented by the class [Number].
///
/// Type projection is either the star projection, or an entity consisting of a specific type plus optional variance.
///
/// - [type] - The type specified in the projection, or null if this is a star projection.
/// - [variance] - The use-site variance specified in the projection, or null if this is a star projection.
///
/// See the [Kotlin language documentation](https://kotlinlang.org/docs/visibility-modifiers.html) for more information.
typedef KTypeProjection = (KType?, KVariance?);

/// Makes the annotated annotation class an associated object key.
///
/// An associated object key annotation should have single KClass parameter.
/// When applied to a class with reference to an object declaration as an argument,
/// it binds the object to the class, making this binding discoverable at runtime
/// using [findAssociatedObject].
@Target([
  AnnotationTarget.ANNOTATION_CLASS,
])
final class AssociatedObjectKey {
  const AssociatedObjectKey();
}

/// The experimental marker for associated objects API.
@Target([
  AnnotationTarget.ANNOTATION_CLASS,
])
final class ExperimentalAssociatedObjects {
  const ExperimentalAssociatedObjects();
}

/// Represents an annotated element and allows to obtain its annotations.
///
/// See the [Kotlin language documentation](https://kotlinlang.org/docs/annotations.html) for more information.
abstract interface class KAnnotatedElement {
  /// Annotations which are present on this element.
  Collection<KCallable> get members;
}

/// Represents a callable entity, such as a function or a property.
///
/// - [R] - return type of the callable.
abstract interface class KCallable<R> extends KAnnotatedElement {
  /// Returns `true` if this callable is `abstract`.
  Boolean get isAbstract;

  /// Returns `true` if this callable is `final`.
  Boolean get isFinal;

  /// Returns `true` if this callable is `open`.
  Boolean get isOpen;

  /// Returns `true` if this is a suspending function.
  Boolean get isSuspend;

  /// The name of this callable as it was declared in the source code.
  ///
  /// If the callable has no name, a special invented name is created. Nameless callables include:
  /// - constructors have the name "",
  ///
  /// - property accessors: the getter for a property named "foo" will have the name "<get-foo>",
  /// the setter, similarly, will have the name "<set-foo>".
  String get name;

  /// Parameters required to make a call to this callable.
  ///
  /// If this callable requires a `this` instance or an extension receiver parameter,
  /// they come first in the list in that order.
  List<KParameter> get parameters;

  /// The type of values returned by this callable.
  KType get returnType;

  /// The list of type parameters of this callable.
  List<KTypeParameter> get typeParameters;

  /// Visibility of this callable, or `null` if its visibility cannot be represented in Kotlin.
  KVisibility? get visibility;

  /// Calls this callable with the specified list of arguments and returns the result.
  ///
  /// Throws an exception if the number of specified arguments
  /// is not equal to the size of parameters,
  /// or if their types do not match the types of the [parameters].
  R Function() call(Array<Any?> args);

  /// Calls this callable with the specified mapping of parameters to arguments and returns the result.
  ///
  /// If a parameter is not found in the mapping and is not optional (as per [KParameter.isOptional]),
  /// or its type does not match the type of the provided value, an exception is thrown.
  R Function() callBy(Map<KParameter, Any?> args);
}

/// Represents a class and provides introspection capabilities.
///
/// Instances of this class are obtainable by the `::class` syntax.
///
/// See the [Kotlin language documentation](https://kotlinlang.org/docs/reflection.html#class-references) for more information.
abstract interface class KClass<T extends Any>
    implements KDeclarationContainer, KAnnotatedElement, KClassifier {
  /// All constructors declared in this class.
  Collection<KFunction<T>> get constructors;

  /// Returns `true` if this class is `abstract`.
  Boolean get isAbstract;

  /// Returns `true` if this class is a `companion` object.
  ///
  /// See the [Kotlin language documentation](https://kotlinlang.org/docs/object-declarations.html#companion-objects) for more information.
  Boolean get isCompanion;

  /// The simple name of the class as it was declared in the source code,
  /// or null if the class has no name (if, for example, it is a class of an anonymous object).
  String? get simpleName;

  /// The list of immediate supertypes of this class, in the order they are listed in the source code.
  List<KType> get supertypes;

  /// The list of type parameters of this class.
  ///
  /// This list does not include type parameters of outer classes.
  List<KTypeParameter> get typeParameters;

  /// Visibility of this class, or `null` if its visibility cannot be represented in Kotlin.
  KVisibility? get visibility;

  /// Returns `true` if [value] is an instance of this class on a given platform.
  Boolean isInstance(Any? value);
}

/// A classifier is either a class or a type parameter.
abstract interface class KClassifier {}

extension KClassifierExtension on KClassifier {
  /// Creates an instance of [KType] with the given classifier, substituting all its type parameters with star projections.
  ///
  /// The resulting type is not marked as nullable and does not have any annotations.
  KType get starProjectedType => runtimeType as KType;

  /// Creates a [KType] instance with the given classifier, type arguments, nullability and annotations.
  ///
  /// If the number of passed type arguments is not equal to the total number of type parameters of a classifier, an exception is thrown.
  ///
  /// If any of the arguments does not satisfy the bounds of the corresponding type parameter, an exception is thrown.
  ///
  /// For classifiers representing type parameters, the type argument list must always be empty.
  ///
  /// For classes, the type argument list should contain arguments for the type parameters of the class.
  ///
  /// If the class is inner, the list should follow with arguments for the type parameters of its outer class,
  /// and so forth until a class is not inner, or is declared on the top level.
  KType createType({
    List<KTypeProjection> arguments = const [],
    List<Annotation> annotations = const [],
    Boolean nullable = false,
  }) =>
      throw NotImplementedError();
}

abstract interface class KDeclarationContainer {
  /// Annotations which are present on this element.
  List<Annotation> get annotations;
}

/// Represents a function with introspection capabilities.
abstract interface class KFunction<R> extends KCallable<R> {
  /// Returns `true` if this function is `external`.
  ///
  /// See the [Kotlin language documentation](https://kotlinlang.org/docs/java-interop.html#using-jni-with-kotlin) for more information.
  Boolean get isExternal;

  /// Returns `true` if this function is `infix`.
  ///
  /// See the [Kotlin language documentation](https://kotlinlang.org/docs/functions.html#infix-notation) for more information.
  Boolean get isInfix;

  /// Returns `true` if this function is `inline`.
  ///
  /// See the [Kotlin language documentation](https://kotlinlang.org/docs/inline-functions.html) for more information.
  Boolean get isInline;

  /// Returns `true` if this function is `operator`.
  ///
  /// See the [Kotlin language documentation](https://kotlinlang.org/docs/java-interop.html#operators) for more information.
  Boolean get isOperator;

  /// Returns `true` if this is a suspending function.
  @override
  Boolean get isSuspend;
}

/// Represents a parameter passed to a function or a property getter/setter,
/// including `this` and extension receiver parameters.
abstract interface class KParameter extends KAnnotatedElement {
  /// 0-based index of this parameter in the parameter list of its containing callable.
  Int get index;

  /// Returns `true` if this parameter is optional
  /// and can be omitted when making a call via [KCallable.callBy], or `false` otherwise.
  Boolean get isOptional;

  /// Returns `true` if this parameter is `vararg`.
  ///
  /// See the [Kotlin language documentation](https://kotlinlang.org/docs/functions.html#variable-number-of-arguments-varargs) for more information.
  Boolean get isVararg;

  /// Kind of this parameter.
  KParameterKind get kind;

  /// Name of this parameter as it was declared in the source code,
  /// or `null` if the parameter has no name or its name is not available at runtime.
  ///
  /// Examples of nameless parameters include `this` instance for member functions,
  /// extension receiver for extension functions or properties,
  /// parameters of Java methods compiled without the debug information, and others.
  String? get name;

  /// Type of this parameter. For a `vararg` parameter,
  /// this is the type of the corresponding array, not the individual element.
  KType get type;
}

/// Kind represents a particular position of the parameter declaration in the source code,
/// such as an instance, an extension receiver parameter or a value parameter.
enum KParameterKind {
  /// Instance required to make a call to the member, or an outer class instance for an inner class constructor.
  INSTANCE,

  /// Extension receiver of an extension function or property.
  EXTENSION_RECEIVER,

  /// Ordinary named value parameter.
  VALUE,
}

/// Represents a property, such as a named `val` or `var` declaration.
///
/// Instances of this class are obtainable by the `::` operator.
///
/// See the [Kotlin language documentation](https://kotlinlang.org/docs/reflection.html) for more information.
abstract interface class KProperty<V> extends KCallable<V> {}

/// Represents a type.
///
/// Type is usually either a class with optional type arguments,
/// or a type parameter of some declaration, plus nullability.
abstract interface class KType extends KAnnotatedElement {
  /// Type arguments passed for the parameters of the classifier in this type.
  ///
  /// For example, in the type Array<out Number> the only type argument is out Number.
  ///
  /// In case this type is based on an inner class,
  /// the returned list contains the type arguments provided for the innermost class first,
  /// then its outer class, and so on.
  ///
  /// For example, in the type Outer<A, B>.Inner<C, D> the returned list is [C, D, A, B].
  List<KTypeProjection> get arguments;

  /// The declaration of the classifier used in this type.
  ///
  /// For example, in the type `List<String>` the classifier would be the [KClass] instance for List.
  KClassifier? get classifier;

  /// Returns `true` if this type was marked nullable in the source code.
  Boolean get isMarkedNullable;
}

/// Represents a declaration of a type parameter of a class or a callable.
///
/// See the [Kotlin language documentation](https://kotlinlang.org/docs/generics.html#generics) for more information.
abstract interface class KTypeParameter extends KClassifier {
  /// Returns `true` if this type parameter is reified.
  ///
  /// See the [Kotlin language documentation](https://kotlinlang.org/docs/inline-functions.html#reified-type-parameters) for more information.
  Boolean get isReified;

  /// The [name] of this type parameter as it was declared in the source code.
  String get name;

  /// Upper bounds, or generic constraints imposed on this type parameter.
  ///
  /// See the [Kotlin language documentation](https://kotlinlang.org/docs/generics.html#upper-bounds) for more information.
  List<KType> get upperBounds;

  /// Declaration-site variance of this type parameter.
  ///
  /// See the [Kotlin language documentation](https://kotlinlang.org/docs/generics.html#declaration-site-variance) for more information.
  KVariance get variance;
}

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

extension KCallableExtension on KCallable {
  /// Returns a parameter representing the extension receiver instance needed to call this callable,
  /// or `null` if this callable is not an extension.
  KParameter? get extensionReceiverParameter => parameters.singleOrNull(
      (element) => element?.kind == KParameterKind.EXTENSION_RECEIVER);

  /// Returns a parameter representing the `this` instance needed to call this callable,
  /// or `null` if this callable is not a member of a class and thus doesn't take such parameter.
  KParameter? get instanceParameter => parameters
      .singleOrNull((element) => element?.kind == KParameterKind.INSTANCE);

  /// Provides a way to suppress JVM access checks for a callable.
  Boolean get isAccessible => false;

  /// Returns parameters of this callable, excluding the `this` instance and the extension receiver parameter.
  List<KParameter> get valueParameters => parameters
      .where((element) => element.kind == KParameterKind.VALUE)
      .toList();

  /// Calls a callable in the current suspend context.
  ///
  /// If the callable is not a suspend function, behaves as [KCallable.call].
  ///
  /// Otherwise, calls the suspend function with current continuation.
  R callSuspend<R>(Array<Any?> args) => call(args) as R;

  /// Calls a callable in the current suspend context.
  ///
  /// If the callable is not a suspend function, behaves as [KCallable.call].
  ///
  /// Otherwise, calls the suspend function with current continuation.
  R callSuspendBy<R>(Map<KParameter, Any?> args) => callBy(args) as R;

  KParameter? findParameterByName(String name) {
    return parameters.singleOrNull((it) => it?.name == name);
  }
}

extension KTypeExtension on KType {
  /// Returns a Java [Type](https://docs.oracle.com/javase/8/docs/api/java/lang/reflect/Type.html)
  /// instance corresponding to the given Kotlin type.
  ///
  /// Note that one Kotlin type may correspond to different JVM types depending on where it appears.
  ///
  /// For example, [Unit] corresponds to the JVM class [Unit] when it's the type of a parameter, or to `void` when it's the return type of a function.
  Type get javaType => runtimeType;

  /// Returns the [KClass] instance representing the runtime class to which this type is erased to on JVM.
  KClass get jvmErasure => throw NotImplementedError();

  /// Returns `true` if `this` type is the same or is a subtype of [other], `false` otherwise.
  Boolean isSubtypeOf(KType other) => throw NotImplementedError();

  /// Returns `true` if `this` type is the same or is a supertype of [other], `false` otherwise.
  Boolean isSupertypeOf(KType other) => throw NotImplementedError();

  /// Returns a new type with the same classifier, arguments and annotations as the given type, and with the given nullability.
  KType withNullability(Boolean nullable) => this;
}
