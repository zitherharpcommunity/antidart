// ignore_for_file: non_constant_identifier_names

library org.w3c.dom.pointerevents;

import 'dart:html';

import '/src/kotlin/kotlin.dart';
import '../../org.w3c.dart';

/// Exposes the JavaScript [PointerEvent](https//developer.mozilla.org/en-US/docs/Web/API/PointerEvent) to Kotlin
class PointerEvent extends MouseEvent {
  external Double get height;

  external Boolean get isPrimary;

  external Int get pointerId;

  external String get pointerType;

  external Float get pressure;

  external Float get tangentialPressure;

  external Int get tiltX;

  external Int get tiltY;

  external Int get twist;

  external Double get width;

  external static Short get AT_TARGET;

  external static Short get BUBBLING_PHASE;

  external static Short get CAPTURING_PHASE;

  external static Short get NONE;
}

abstract interface class PointerEventInit implements MouseEventInit {
  external Double get height;

  external Boolean get isPrimary;

  external Int get pointerId;

  external String get pointerType;

  external Float get pressure;

  external Float get tangentialPressure;

  external Int get tiltX;

  external Int get tiltY;

  external Int get twist;

  external Double get width;
}

external PointerEventInit pointerEventInit({
  Int? pointerId = 0,
  Double? width = 1.0,
  Double? height = 1.0,
  Float? pressure = 0,
  Float? tangentialPressure = 0,
  Int? tiltX = 0,
  Int? tiltY = 0,
  Int? twist = 0,
  String? pointerType = '',
  Boolean? isPrimary = false,
  Int? screenX = 0,
  Int? screenY = 0,
  Int? clientX = 0,
  Int? clientY = 0,
  Short? button = 0,
  Short? buttons = 0,
  EventTarget? relatedTarget,
  String? region,
  Boolean? ctrlKey = false,
  Boolean? shiftKey = false,
  Boolean? altKey = false,
  Boolean? metaKey = false,
  Boolean? modifierAltGraph = false,
  Boolean? modifierCapsLock = false,
  Boolean? modifierFn = false,
  Boolean? modifierFnLock = false,
  Boolean? modifierHyper = false,
  Boolean? modifierNumLock = false,
  Boolean? modifierScrollLock = false,
  Boolean? modifierSuper = false,
  Boolean? modifierSymbol = false,
  Boolean? modifierSymbolLock = false,
  Window? view,
  Int? detail = 0,
  Boolean? bubbles = false,
  Boolean? cancelable = false,
  Boolean? composed = false,
});
