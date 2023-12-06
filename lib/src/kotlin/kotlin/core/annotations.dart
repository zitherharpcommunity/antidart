part of kotlin.core;

/// This annotation marks the standard library API that is considered experimental
/// and is not subject to the [general compatibility guarantees](https://kotlinlang.org/docs/components-stability.html)
/// given for the standard library: the behavior of such API may be changed
/// or the API may be removed completely in any further release.
///
/// Beware using the annotated API especially if you're developing a library,
/// since your library might become binary incompatible with the future versions of the standard library.
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
final class ExperimentalStdlibApi {
  const ExperimentalStdlibApi();
}

/// This annotation marks the standard library API that is considered experimental
/// and is not subject to the [general compatibility guarantees](https://kotlinlang.org/docs/components-stability.html)
/// given for the standard library: the behavior of such API may be changed
/// or the API may be removed completely in any further release.
const experimentalStdlibApi = ExperimentalStdlibApi();

/// Marks the annotated declaration as deprecated.
///
/// In contrast to [Deprecated], severity of the reported diagnostic is not a constant value,
/// but differs depending on the API version of the usage
/// (the value of the `-api-version` argument when compiling the module where the usage is located).
///
/// If the API version is greater or equal than [hiddenSince],
/// the declaration will not be accessible from the code
/// (as if it was deprecated with level [DeprecationLevel.HIDDEN]),
/// otherwise if the API version is greater or equal than [errorSince],
/// the usage will be marked as an error (as with [DeprecationLevel.ERROR]),
/// otherwise if the API version is greater or equal than [warningSince],
/// the usage will be marked as a warning (as with [DeprecationLevel.WARNING]),
/// otherwise the annotation is ignored.
@Target([
  AnnotationTarget.CLASS,
  AnnotationTarget.FUNCTION,
  AnnotationTarget.PROPERTY,
  AnnotationTarget.ANNOTATION_CLASS,
  AnnotationTarget.CONSTRUCTOR,
  AnnotationTarget.PROPERTY_SETTER,
  AnnotationTarget.PROPERTY_GETTER,
  AnnotationTarget.TYPEALIAS,
])
@mustBeDocumented
final class DeprecatedSinceKotlin {
  /// The version, since which this deprecation should be reported as a error.
  final String errorSince;

  /// The version, since which the annotated declaration should not be available in code.
  final String hiddenSince;

  /// The version, since which this deprecation should be reported as a warning.
  final String warningSince;

  /// Marks the annotated declaration as deprecated.
  ///
  /// In contrast to [Deprecated], severity of the reported diagnostic is not a constant value,
  /// but differs depending on the API version of the usage
  /// (the value of the `-api-version` argument when compiling the module where the usage is located).
  ///
  /// If the API version is greater or equal than [hiddenSince],
  /// the declaration will not be accessible from the code
  /// (as if it was deprecated with level [DeprecationLevel.HIDDEN]),
  /// otherwise if the API version is greater or equal than [errorSince],
  /// the usage will be marked as an error (as with [DeprecationLevel.ERROR]),
  /// otherwise if the API version is greater or equal than [warningSince],
  /// the usage will be marked as a warning (as with [DeprecationLevel.WARNING]),
  /// otherwise the annotation is ignored.
  const DeprecatedSinceKotlin([
    this.errorSince = '',
    this.hiddenSince = '',
    this.warningSince = '',
  ]);
}
