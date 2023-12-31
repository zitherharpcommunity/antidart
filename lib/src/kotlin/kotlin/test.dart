/// The `kotlin.test` library provides [annotations](https://kotlinlang.org/api/latest/kotlin.test/kotlin.test/#annotations) to mark test functions
/// and a set of [utility functions](https://kotlinlang.org/api/latest/kotlin.test/kotlin.test/#functions) for performing assertions in tests,
/// independently of the test framework being used.
///
/// The test framework is abstracted through the [Asserter](https://kotlinlang.org/api/latest/kotlin.test/kotlin.test/-asserter) class.
///
/// A basic [Asserter] implementation is provided out of the box.
///
/// Note that the class is not intended to be used directly from tests,
/// use instead the top-level assertion functions which delegate to the [Asserter].
///
/// The library consists of the modules:
///
/// `kotlin-test-common` - assertions for use in common code.
///
/// `kotlin-test-annotations-common` - test annotations for use in common code.
///
/// `kotlin-test` – a JVM implementation of assertions from `kotlin-test-common`.
///
/// `kotlin-test-junit` - provides an implementation of [Asserter] on top of JUnit
/// and maps the test annotations from `kotlin-test-annotations-common` to JUnit test annotations.
///
/// `kotlin-test-junit5` - provides an implementation of [Asserter] on top of JUnit 5
/// and maps the test annotations from `kotlin-test-annotations-common` to JUnit 5 test annotations.
///
/// `kotlin-test-testng` - provides an implementation of [Asserter] on top of TestNG
/// and maps the test annotations from kotlin-test-annotations-common to TestNG test annotations.
///
/// `kotlin-test-js` - a JS implementation of common test assertions
/// and annotations with the out-of-the-box support for Jasmine, Mocha, and Jest testing frameworks,
/// and an experimental way to plug in a custom unit testing framework.
library kotlin.test;
  
export 'test/common.dart';
export 'test/junit.dart';
export 'test/junit5.dart';
export 'test/testng.dart';
