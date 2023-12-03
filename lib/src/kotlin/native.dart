library kotlin.native;

import '/kotlin.dart';

/// Instructs the Kotlin compiler to use a custom Objective-C and/or Swift name
/// for this class, property, parameter or function.
@Target([
  AnnotationTarget.CLASS,
  AnnotationTarget.PROPERTY,
  AnnotationTarget.VALUE_PARAMETER,
  AnnotationTarget.FUNCTION,
])
@experimentalObjCName
class ObjCName {
  /// Instructs the Kotlin compiler to use a custom Objective-C and/or Swift name 
  /// for this class, property, parameter or function.
  const ObjCName({
    this.exact = false,
    this.name = '',
    this.swiftName = '',
  });

  /// Dpecifies if the name of a class should be interpreted as the exact name.
  ///
  /// E.g. the compiler won't add a top level prefix or the outer class names to exact names.
  final Boolean exact;

  final String name;

  final String swiftName;
}
