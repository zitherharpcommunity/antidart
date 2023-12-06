/// Functions and annotations specific to the Java platform.
library kotlin.jvm;

import '/src/kotlin/kotlin.dart';

/// Makes the annotation class repeatable in Java and Kotlin.
///
/// A repeatable annotation can be applied more than once on the same element.
typedef JvmRepeatable = Repeatable;

/// Specifies the [name] for the Java class or method which is generated from this element.
///
/// See the [Kotlin language documentation](https://kotlinlang.org/docs/java-to-kotlin-interop.html#handling-signature-clashes-with-jvmname) for more information.
@Target([
  AnnotationTarget.FILE,
  AnnotationTarget.FUNCTION,
  AnnotationTarget.PROPERTY_GETTER,
  AnnotationTarget.PROPERTY_SETTER,
])
final class JvmName {
  /// The name of the element.
  final String name;

  /// Specifies the [name] for the Java class or method which is generated from this element.
  const JvmName(this.name);
}

final class KotlinReflectionNotSupportedError extends Error {
  final String? message;

  final Throwable? cause;

  KotlinReflectionNotSupportedError({this.message, this.cause});
}

/// Marks the JVM backing field of the annotated property as transient,
/// meaning that it is not part of the default serialized form of the object.
@Target([
  AnnotationTarget.FIELD,
])
final class Transient {
  const Transient();
}

/// Marks the JVM backing field of the annotated property as transient,
/// meaning that it is not part of the default serialized form of the object.
const transient = Transient();

/// Instructs compiler to mark the class as a record and generate relevant `toString/equals/hashCode` methods.
@Target([
  AnnotationTarget.CLASS,
])
final class JvmRecord {
  const JvmRecord();
}

/// Instructs compiler to mark the class as a record and generate relevant `toString/equals/hashCode` methods.
const jvmRecord = JvmRecord();

/// Instructs the Kotlin compiler to generate overloads for this function that substitute default parameter values.
///
/// If a method has `N` parameters and `M` of which have default values,
/// `M` overloads are generated: the first one takes `N-1` parameters
/// (all but the last one that takes a default value),
/// the second takes `N-2` parameters, and so on.
@Target([
  AnnotationTarget.FUNCTION,
  AnnotationTarget.CONSTRUCTOR,
])
final class JvmOverload {
  const JvmOverload();
}

/// Instructs the Kotlin compiler to generate overloads for this function that substitute default parameter values.
const jvmOverload = JvmOverload();

/// Specifies that an additional static method needs to be generated from this element if it's a function.
///
/// If this element is a property, additional static getter/setter methods should be generated.
///
/// See the [Kotlin language documentation](https://kotlinlang.org/docs/java-to-kotlin-interop.html#static-methods) for more information.
@Target([
  AnnotationTarget.FUNCTION,
  AnnotationTarget.PROPERTY,
  AnnotationTarget.PROPERTY_GETTER,
  AnnotationTarget.PROPERTY_SETTER,
])
final class JvmStatic {
  const JvmStatic();
}

/// Specifies that an additional static method needs to be generated from this element if it's a function.
///
/// If this element is a property, additional static getter/setter methods should be generated.
const jvmStatic = JvmStatic();

/// This annotation indicates what exceptions should be declared by a function when compiled to a JVM method.
///
/// Example:
///
/// ```kotlin
/// @Throws(IOException::class)
/// fun readFile(name: String): String {...}
/// ```
/// will be translated to:
/// ```kotlin
/// String readFile(String name) throws IOException {...}
/// ```
@Target([
  AnnotationTarget.FUNCTION,
  AnnotationTarget.PROPERTY_GETTER,
  AnnotationTarget.PROPERTY_SETTER,
  AnnotationTarget.CONSTRUCTOR,
])
final class Throws {
  final Array<KClass<Throwable>> exceptionClasses;

  /// This annotation indicates what exceptions should be declared by a function when compiled to a JVM method.
  const Throws(this.exceptionClasses);
}
