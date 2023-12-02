library kotlin.io.path;

import '/src/kotlin.dart';

/// This annotation marks the experimental API for [Path] and decoding
/// between binary data and printable ASCII character sequences.
const ExperimentalPathApi = _ExperimentalPathApi();

/// The result of the `copyAction` function passed to [Path.copyToRecursively]
/// that specifies further actions when copying an entry.
@ExperimentalPathApi
enum CopyActionResult {
  /// Continue with the next entry in the traversal order.
  CONTINUE,

  /// Skip the directory content, continue with the next entry outside the directory
  /// in the traversal order. For files this option is equivalent to [CONTINUE].
  SKIP_SUBTREE,

  /// Stop the recursive copy function.
  /// The function will return without throwing exception.
  TERMINATE,
}

/// The result of the `onError` function passed to [Path.copyToRecursively]
/// that specifies further actions when an exception occurs.
@ExperimentalPathApi
enum OnErrorResult {
  /// If the entry that caused the error is a directory, skip the directory and its content,
  /// and continue with the next entry outside this directory in the traversal order.
  /// Otherwise, skip this entry and continue with the next entry in the traversal order.
  SKIP_SUBTREE,

  /// Stop the recursive copy function.
  /// The function will return without throwing exception.
  /// To terminate the function with an exception rethrow instead.
  TERMINATE,
}

/// An enumeration to provide walk options for Path.walk function.
/// The options can be combined to form the walk order and behavior needed.
///
/// Note that this enumeration is not exhaustive and new cases might be added in the future.
@ExperimentalPathApi
enum PathWalkOption {
  /// Visits directories as well.
  INCLUDE_DIRECTORIES,

  /// Walks in breadth-first order.
  BREADTH_FIRST,

  /// Follows symbolic links to the directories they point to.
  FOLLOW_LINKS,
}

/// This annotation marks the extensions and top-level functions
/// for working with `java.nio.file.Path` considered experimental.
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
class _ExperimentalPathApi {
  const _ExperimentalPathApi();
}
