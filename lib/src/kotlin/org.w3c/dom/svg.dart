// ignore_for_file: non_constant_identifier_names

library org.w3c.dom.svg;

import '/src/kotlin/kotlin.dart';

/// Exposes the JavaScript [SVGUnitTypes](https://developer.mozilla.org/en-US/docs/Web/API/SVGUnitTypes) to Kotlin.
abstract interface class SVGUnitTypes {
  external static final Short SVG_UNIT_TYPE_OBJECTBOUNDINGBOX;

  external static final Short SVG_UNIT_TYPE_UNKNOWN;

  external static final Short SVG_UNIT_TYPE_USERSPACEONUSE;
}

/// Exposes the JavaScript [SVGElement](https://developer.mozilla.org/en-US/docs/Web/API/SVGElement) to Kotlin.
abstract class SVGElement {
  const SVGElement();
}

/// Exposes the JavaScript [SVGAnimatedEnumeration](https://developer.mozilla.org/en-US/docs/Web/API/SVGAnimatedEnumeration) to Kotlin.
abstract class SVGAnimatedEnumeration {
  const SVGAnimatedEnumeration();

  external final Short animVal;

  external final Short baseVal;
}

/// Exposes the JavaScript [SVGAnimatedTransformList](https://developer.mozilla.org/en-US/docs/Web/API/SVGAnimatedTransformList) to Kotlin.
abstract class SVGAnimatedTransformList {
  const SVGAnimatedTransformList();

  external final Short animVal;

  external final Short baseVal;
}

/// Exposes the JavaScript [SVGAnimatedLength](https://developer.mozilla.org/en-US/docs/Web/API/SVGAnimatedLength) to Kotlin.
abstract class SVGAnimatedLength {
  const SVGAnimatedLength();

  external final Short animVal;

  external final Short baseVal;
}
