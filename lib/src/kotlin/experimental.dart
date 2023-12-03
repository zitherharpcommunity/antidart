/// Experimental APIs, subject to change in future versions of Kotlin.
library kotlin.experimental;

import '/kotlin.dart';

/// This annotation marks the Kotlin/Native-only standard library API
/// that is considered experimental and is not subject to the
/// [general compatibility guarantees](https://kotlinlang.org/docs/components-stability.html#github-badges-for-kotlin-components)
/// given for the standard library: the behavior of such API may be changed
/// or the API may be removed completely in any further release.
const experimentalNativeApi = ExperimentalNativeApi();

/// This annotation marks the experimental [ObjCName] annotation.
const experimentalObjCName = ExperimentalObjCName();

/// This annotation marks the experimental Objective-C export refinement annotations.
const experimentalObjCRefinement = ExperimentalObjCRefinement();

/// The experimental marker for type inference augmenting annotations.
const experimentalTypeInference = ExperimentalTypeInference();

/// This annotation marks the Kotlin/Native-only standard library API
/// that is considered experimental and is not subject
/// to the general compatibility guarantees given for the standard library:
/// the behavior of such API may be changed
/// or the API may be removed completely in any further release.
///
/// Beware using the annotated API especially if you're developing a library,
/// since your library might become binary incompatible
/// with the future versions of the standard library.
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
class ExperimentalNativeApi {
  const ExperimentalNativeApi();
}

@Target([
  AnnotationTarget.ANNOTATION_CLASS,
])
class ExperimentalObjCName {
  const ExperimentalObjCName();
}

@Target([
  AnnotationTarget.ANNOTATION_CLASS,
])
class ExperimentalObjCRefinement {
  const ExperimentalObjCRefinement();
}

@Target([
  AnnotationTarget.ANNOTATION_CLASS,
])
class ExperimentalTypeInference {
  const ExperimentalTypeInference();
}
