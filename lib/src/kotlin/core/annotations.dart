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
