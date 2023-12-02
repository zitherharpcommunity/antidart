/// API for measuring time intervals and calculating durations.
///
/// For more information, see our [Time measurement](https://kotlinlang.org/docs/time-measurement.html) guide.
library kotlin.time;

import '/src/kotlin.dart';

part 'time/funcs.dart';
part 'time/props.dart';
part 'time/types.dart';

/// This annotation marks the experimental preview of the standard library API
/// for measuring time and working with durations.
///
/// Note that this API is in a preview state
/// and has a very high chance of being changed in the future.
///
/// Do not use it if you develop a library
/// since your library will become binary incompatible
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
final class _ExperimentalTime {
  const _ExperimentalTime();
}

/// This annotation marks the experimental preview of the standard library API 
/// for measuring time and working with durations.
const ExperimentalTime = _ExperimentalTime();
