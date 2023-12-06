// ignore_for_file: non_constant_identifier_names

/// Kotlin JavaScript wrappers for the [Navigation Timing API](https://www.w3.org/TR/navigation-timing).
library org.w3c.performance;

import '/src/kotlin/kotlin.dart';
import '/src/kotlin/org.w3c.dart';

abstract interface class GlobalPerformance {
  const GlobalPerformance();

  external Performance get performance;
}

/// Exposes the JavaScript [Performance](https://developer.mozilla.org/en-US/docs/Web/API/Performance) to Kotlin
abstract class Performance extends EventTarget {
  const Performance();

  external PerformanceNavigation get navigation;

  external PerformanceTiming get timing;

  external Double now();
}

abstract class PerformanceNavigation {
  external static Short get TYPE_BACK_FORWARD;

  external static Short get TYPE_NAVIGATE;

  external static Short get TYPE_RELOAD;

  external static Short get TYPE_RESERVED;

  const PerformanceNavigation();

  external Short get redirectCount;

  external Short get type;
}

abstract class PerformanceTiming {
  const PerformanceTiming();

  external Number get connectEnd;

  external Number get connectStart;

  external Number get domainLookupEnd;

  external Number get domainLookupStart;

  external Number get domComplete;

  external Number get domContentLoadedEventEnd;

  external Number get domContentLoadedEventStart;

  external Number get domInteractive;

  external Number get domLoading;

  external Number get fetchStart;

  external Number get loadEventEnd;

  external Number get loadEventStart;

  external Number get navigationStart;

  external Number get redirectEnd;

  external Number get redirectStart;

  external Number get requestStart;

  external Number get responseEnd;

  external Number get responseStart;

  external Number get secureConnectionStart;

  external Number get unloadEventEnd;

  external Number get unloadEventStart;
}
