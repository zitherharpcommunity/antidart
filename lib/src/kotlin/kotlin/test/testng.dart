library kotlin.test.testng;

import '../test.dart';

/// Implements `kotlin.test` assertions by delegating them to `org.testng.Assert` class.
sealed class TestNGAsserter implements Asserter {}

/// Provides [TestNGAsserter] if `org.testng.Assert` is found in the classpath.
final class TestNGContributor implements AsserterContributor {
  /// Provides [TestNGAsserter] if `org.testng.Assert` is found in the classpath.
  const TestNGContributor();

  @override
  external Asserter? contribute();
}
