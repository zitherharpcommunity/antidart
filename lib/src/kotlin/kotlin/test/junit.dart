library kotlin.test.junit;

import '../test.dart';

/// Implements `kotlin.test` assertions by delegating them to `org.junit.Assert` class.
sealed class JUnitAsserter implements Asserter {}

/// Provides [JUnitAsserter] if `org.junit.Assert` is found in the classpath.
final class JUnitContributor implements AsserterContributor {
  /// Provides [JUnitAsserter] if `org.junit.Assert` is found in the classpath.
  const JUnitContributor();
  
  @override
  external Asserter? contribute();
}
