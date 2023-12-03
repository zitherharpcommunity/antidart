library kotlin.test.junit5;

import '/src/kotlin/test.dart';

/// Implements `kotlin.test` assertions by delegating them to `org.junit.Assert` class.
sealed class JUnitAsserter5 implements Asserter {}

/// Provides [JUnitAsserter5] if `org.junit.Assert` is found in the classpath.
final class JUnitContributor5 implements AsserterContributor {
  /// Provides [JUnitAsserter5] if `org.junit.Assert` is found in the classpath.
  const JUnitContributor5();
  
  @override
  Asserter? contribute() => throw UnimplementedError();
}
