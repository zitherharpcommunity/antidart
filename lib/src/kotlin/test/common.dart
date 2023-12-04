/// Annotations to mark test functions and top-level functions for performing assertions in tests.
library kotlin.test.common;

import 'package:test/test.dart' as t;

import '/kotlin.dart';

/// Marks a function to be executed after a suite.
///
/// Not supported in Kotlin/Common.
const afterClass = AfterClass();

/// Marks a function to be invoked after each test.
const afterTest = AfterTest();

/// Marks a function to be executed before a suite.
///
/// Not supported in Kotlin/Common.
const beforeClass = BeforeClass();

/// Marks a function to be invoked before each test.
const beforeTest = BeforeTest();

/// Marks a test or a suite as ignored.
const ignore = Ignore();

/// Marks a function as a test.
const test = Test();

/// Current adapter providing assertion implementations.
external Asserter get asserter;

external KotlinTestNamespace get kotlinTestNamespace;

/// Asserts that the [iterable] contains the specified [element], with an optional [message].
Unit assertContains<T>(
  Iterable<T> iterable,
  T element, {
  String? message,
}) {}

/// Asserts that the expected iterable is structurally equal to the actual iterable,
/// i.e. contains the same number of the same elements in the same order, with an optional message.
///
/// The elements are compared for equality with the equals function.
///
/// For floating point numbers it means that `NaN` is equal to itself and `-0.0` is not equal to `0.0`.
Unit assertContentEquals<T>({
  Iterable<T>? expected,
  Iterable<T>? actual,
  String? message,
}) {}

/// Asserts that the difference between the [actual] and the [expected]
/// is within an [absoluteTolerance], with an optional [message].
Unit assertEquals<T>(
  T expected,
  T actual, {
  String? message,
  Double absoluteTolerance = 0,
}) {
  asserter.assertEquals(message, expected, actual);
}

/// Asserts that given function block fails by throwing an exception.
///
/// If the assertion fails, the specified message is used
/// unless it is null as a prefix for the failure message.
///
/// Return an exception that was expected to be thrown and was successfully caught.
///
/// The returned exception can be inspected further, for example by asserting its property values.
Throwable assertFails(
  Unit Function() block, [
  String? message,
]) {
  asserter.fail(message);
}

/// Asserts that a block fails with a specific exception of type [T] being thrown.
///
/// If the assertion fails, the specified message
/// is used unless it is `null` as a prefix for the failure [message].
///
/// Return an exception of the expected exception type [T] that successfully caught.
///
/// The returned exception can be inspected further, for example by asserting its property values.
T assertFailsWith<T>(
  Unit Function() block, {
  String? message,
}) =>
    throw NotImplementedError(message);

/// Asserts that the given [block] returns `false` with an optional message.
Unit assertFalse({
  String? message,
  Boolean? actual,
  Boolean Function()? block,
}) {}

@JvmName("assertFalse")
@Deprecated('Provided for binary compatibility')
Unit assertFalseNoInline({
  String? message,
  required Boolean Function() block,
}) {}

/// Asserts that value is of type [T], with an optional [message].
///
/// Note that due to type erasure the type check may be partial
/// (e.g. `assertIs<List<String>>(value)` only checks for the class being [List]
/// and not the type of its elements because it's erased).
T assertIs<T>(
  Any? value, [
  String? message,
]) {
  t.expect(value, T, reason: message);
  return value as T;
}

/// Asserts that value is not of type [T], with an optional [message].
///
/// Note that due to type erasure the type check may be partial
/// (e.g. `assertIsNot<List<String>>(value)` only checks for the class being [List]
/// and not the type of its elements because it's erased).
Unit assertIsNot<T>(
  Any? value, [
  String? message,
]) {
  return t.expect(value, T, reason: message);
}

/// Asserts that the difference between the [actual] and the [illegal]
/// is not within an [absoluteTolerance], with an optional [message].
Unit assertNotEquals<T>(
  T illegal,
  T actual, {
  String? message,
  Double absoluteTolerance = 0,
}) {
  return asserter.assertNotEquals(message, illegal, actual);
}

/// Asserts that the [actual] value is not `null`, with an optional [message].
T assertNotNull<T extends Any, R>(
  T? actual, {
  String? message,
}) {
  return actual as T;
}

/// Asserts that [actual] is not the same instance as [illegal], with an optional [message].
Unit assertNotSame<T>(
  T illegal,
  T actual, {
  String? message,
}) {
  return asserter.assertNotSame(message, illegal, actual);
}

/// Returns an array of stack trace elements, each representing one stack frame. 
/// 
/// The first element of the array (assuming the array is not empty) represents the top of the stack, 
/// which is the place where [currentStackTrace] function was called from.
external Array<StackTrace> currentStackTrace();

/// Asserts that the [actual] value is not `null`,
/// with an optional [message] and a function [block] to process the not-null value.
@JvmName("assertNotNull")
@Deprecated('Provided for binary compatibility')
Unit assertNotNullNoInline<T extends Any, R>(
  T? actual, {
  String? message,
  R Function(T)? block,
}) {
  return asserter.assertNotNull(message, actual);
}

/// Asserts that given function [block] returns the given [expected] value and use the given [message] if it fails.
Unit expect<T>(
  T expected,
  Unit Function() block, {
  String? message,
}) {
  t.test(message, block);
}

/// Takes the given [block] of test code and doesn't execute it.
///
/// This keeps the code under test referenced, but doesn't actually test it until it is implemented.
Unit todo(Unit Function() block) => println('TODO at $block');

/// Abstracts the logic for performing assertions.
///
/// Specific implementations of
/// [Asserter](https://kotlinlang.org/api/latest/kotlin.test/kotlin.test/-asserter/)
/// can use `JUnit` or `TestNG` assertion facilities.
abstract interface class Asserter {
  /// Asserts that the specified values are equal.
  ///
  /// - [message] - the message to report if the assertion fails.
  external Unit assertEquals(
    String? message,
    Any? expected,
    Any? actual,
  );

  /// Asserts that the specified values are not equal.
  ///
  /// - [message] - the message to report if the assertion fails.
  external Unit assertNotEquals(
    String? message,
    Any? illegal,
    Any? actual,
  );

  /// Asserts that the specified value is not `null`.
  ///
  /// - [message] - the message to report if the assertion fails.
  external Unit assertNotNull(
    String? message,
    Any? actual,
  );

  /// Asserts that the specified values are not the same instance.
  ///
  /// - [message] - the message to report if the assertion fails.
  external Unit assertNotSame(
    String? message,
    Any? illegal,
    Any? actual,
  );

  /// Asserts that the specified value is `null`.
  ///
  /// - [message] - the message to report if the assertion fails.
  external Unit assertNull(
    String? message,
    Any? actual,
  );

  /// Asserts that the specified values are the same instance.
  ///
  /// - [message] - the message to report if the assertion fails.
  external Unit assertSame(
    String? message,
    Any? illegal,
    Any? actual,
  );

  /// Asserts that the specified value is `true`.
  ///
  /// - [message] - the message to report if the assertion fails.
  /// - [lazyMessage] - the function to return a message to report if the assertion fails.
  external Unit assertTrue(
    Boolean actual, {
    String? message,
    String? Function() lazyMessage,
  });

  /// Fails the current test with the specified message (and cause exception).
  ///
  /// - [message] - the message to report.
  ///
  /// - [cause] - the exception to set as the root cause of the reported failure.
  Nothing fail(
    String? message, [
    Throwable? cause,
  ]);
}

/// Checks applicability and provides [Asserter] instance
abstract interface class AsserterContributor {
  const AsserterContributor();

  /// Provides [Asserter] instance or null depends on the current context.
  external Asserter? contribute();
}

/// Describes the result of an assertion execution.
abstract interface class AsserterResult {
  Any? get actual;

  Any? get expected;

  String? Function() get lazyMessage;

  Boolean get result;
}

/// Default [Asserter] implementation to avoid dependency on JUnit or TestNG.
sealed class DefaultAsserter implements Asserter {
  Nothing fail(
    String? message, [
    Throwable? cause,
  ]);
}

/// Serves as a bridge to a testing framework.
///
/// The tests structure is defined using internal functions suite and test,
/// which delegate to corresponding functions of a FrameworkAdapter. Sample test layout:
///
/// ```dart
/// suite('a suite', false, () {
///  suite('a subsuite', false, () {
///    test('a test', false, () {...});
///    test('an ignored/pending test', true, () {...});
///  });
///  suite('an ignored/pending test', true, () {...});
/// });
/// ```
abstract interface class FrameworkAdapter {
  /// Declares a test suite.
  ///
  /// - [name] - name of the test suite, e.g. a class name.
  /// - [ignored] - whether the test suite is ignored, e.g. marked with [Ignore] annotation.
  /// - [suiteFn] - defines nested suites by calling `kotlin.test.suite` and tests by calling `kotlin.test.test`.
  Unit suite(
    String name,
    Boolean ignored,
    Unit Function() suiteFn,
  );

  /// Declares a test.
  ///
  /// - [name] - the test name.
  ///
  /// - [ignored] - whether the test is ignored.
  ///
  /// - [testFn] - contains test body invocation.
  Unit test(
    String name,
    Boolean ignored,
    Unit Function() testFn,
  );
}

abstract interface class KotlinTestNamespace {
  FrameworkAdapter Function(FrameworkAdapter)? get adapterTransformer;
}

/// Marks a function to be executed after a suite.
///
/// Not supported in Kotlin/Common.
@Target([
  AnnotationTarget.ANNOTATION_CLASS,
])
final class AfterClass {
  const AfterClass();
}

/// Marks a function to be invoked before each test.
@Target([
  AnnotationTarget.FUNCTION,
])
final class AfterTest {
  const AfterTest();
}

/// Marks a function to be executed after a suite.
///
/// Not supported in Kotlin/Common.
@Target([
  AnnotationTarget.ANNOTATION_CLASS,
])
final class BeforeClass {
  const BeforeClass();
}

/// Marks a function to be invoked before each test.
@Target([
  AnnotationTarget.FUNCTION,
])
final class BeforeTest {
  const BeforeTest();
}

/// Marks a test or a suite as ignored.
@Target([
  AnnotationTarget.CLASS,
  AnnotationTarget.FUNCTION,
])
final class Ignore {
  const Ignore();
}

/// Marks a function as a test.
@Target([
  AnnotationTarget.FUNCTION,
])
final class Test {
  const Test();
}
