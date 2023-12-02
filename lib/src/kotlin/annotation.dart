/// Library support for the Kotlin annotation facility.
library kotlin.annotation;

import '/src/kotlin.dart';

/// This meta-annotation determines that an annotation is a part of public API
/// and therefore should be included in the generated documentation
/// for the element to which the annotation is applied.
const MustBeDocumented = _MustBeDocumented();

/// This meta-annotation determines that an annotation
/// is applicable twice or more on a single code element
const Repeatable = _Repeatable();

/// Contains the list of possible annotation's retentions.
///
/// Determines how an annotation is stored in binary output.
enum AnnotationRetention {
  /// Annotation isn't stored in binary output.
  SOURCE,

  /// Annotation is stored in binary output, but invisible for reflection.
  BINARY,

  /// Annotation is stored in binary output and visible for reflection (default retention).
  RUNTIME;
}

/// Contains the list of code elements which are the possible annotation targets.
enum AnnotationTarget {
  /// Class, interface or object, annotation class is also included.
  CLASS,

  /// Annotation class only.
  ANNOTATION_CLASS,

  /// Generic type parameter.
  TYPE_PARAMETER,

  /// Property.
  PROPERTY,

  /// Field, including property's backing field.
  FIELD,

  /// Local variable.
  LOCAL_VARIABLE,

  /// Value parameter of a function or a constructor.
  VALUE_PARAMETER,

  /// Constructor only (primary or secondary).
  CONSTRUCTOR,

  /// Function (constructors are not included).
  FUNCTION,

  /// Property getter only.
  PROPERTY_GETTER,

  /// Property setter only.
  PROPERTY_SETTER,

  /// Type usage.
  TYPE,

  /// Any expression.
  EXPRESSION,

  /// File.
  FILE,

  /// Type alias.
  TYPEALIAS;
}

@Target([
  AnnotationTarget.ANNOTATION_CLASS,
])
final class Retention {
  /// The necessary annotation retention `RUNTIME`, `BINARY` or `SOURCE`.
  final AnnotationRetention value;

  /// This meta-annotation determines whether an annotation
  /// is stored in binary output and visible for reflection.
  /// By default, both are true.
  const Retention([this.value = AnnotationRetention.RUNTIME]);
}

/// This meta-annotation indicates the kinds of code elements
/// which are possible targets of an annotation.
///
/// If the target meta-annotation is not present on an annotation declaration,
/// the annotation is applicable to the following elements:
/// `CLASS`, `PROPERTY`, `FIELD`, `LOCAL_VARIABLE`, `VALUE_PARAMETER`,
/// `CONSTRUCTOR`, `FUNCTION`, `PROPERTY_GETTER`, `PROPERTY_SETTER`.
final class Target {
  /// The list of allowed annotation targets.
  final Array<AnnotationTarget> allowedTargets;

  /// This meta-annotation indicates the kinds of code elements
  /// which are possible targets of an annotation.
  const Target(this.allowedTargets);
}

/// This meta-annotation determines that an annotation is a part of public API
/// and therefore should be included in the generated documentation
/// for the element to which the annotation is applied.
@Target([
  AnnotationTarget.ANNOTATION_CLASS,
])
final class _MustBeDocumented {
  const _MustBeDocumented();
}

/// This meta-annotation determines that an annotation
/// is applicable twice or more on a single code element
@Target([
  AnnotationTarget.ANNOTATION_CLASS,
])
final class _Repeatable {
  const _Repeatable();
}
