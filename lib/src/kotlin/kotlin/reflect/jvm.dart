/// Runtime API for interoperability between [Kotlin reflection](https://kotlinlang.org/docs/reflection.html)
/// and Java reflection provided by kotlin-reflect library.
library kotlin.reflect.jvm;

import '/src/kotlin/kotlin.dart';

/// This annotation marks the experimental kotlin-reflect API
/// that allows to approximate a Kotlin lambda
/// or a function expression instance to a KFunction instance.
///
/// The behavior of this API may be changed
/// or the API may be removed completely in any further release.
const experimentalReflectionOnLambdas = ExperimentalReflectionOnLambdas();

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
final class ExperimentalReflectionOnLambdas {
  const ExperimentalReflectionOnLambdas();
}
