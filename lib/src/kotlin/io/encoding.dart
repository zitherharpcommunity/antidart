library kotlin.io.encoding;

import '/src/kotlin.dart';

/// This annotation marks the experimental API for encoding and decoding
/// between binary data and printable ASCII character sequences.
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
class _ExperimentalEncodingApi {
  const _ExperimentalEncodingApi();
}
/// This annotation marks the experimental API for encoding and decoding 
/// between binary data and printable ASCII character sequences.
const ExperimentalEncodingApi = _ExperimentalEncodingApi();
