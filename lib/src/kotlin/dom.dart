/// Utility functions for working with the browser DOM.
library kotlin.dom;

import 'dart:html';

import '/src/kotlin.dart';

extension DomElementExtension on Element {
  /// Adds CSS class to element.
  ///
  /// Has no effect if all specified classes are already in class attribute of the element.
  Boolean addClass(String cssClass) => classes.add(cssClass);

  /// Appends a newly created element with the specified [name] to this element.
  Element appendElement({
    required String name,
    required Unit Function() init,
  }) {
    return this..append(Element.tag(name));
  }

  /// Creates text node and append it to the element.
  Element appendText(String text) => this..appendText(text);

  /// Creates a new element with the specified [name].
  Element createElement({
    required String name,
    required Unit Function() init,
  }) {
    return this..append(Element.tag(name));
  }

  /// Returns true if the element has the given CSS class style in its `class` attribute.
  Boolean hasClass(String cssClass) => hasAttribute(cssClass);

  /// Removes the [cssClass] from element.
  ///
  /// Has no effect if the specified class are missing in class attribute of the element.
  Boolean removeClass(String cssClass) => classes.remove(cssClass);

  /// Removes all [cssClasses] from element.
  ///
  /// Has no effect if all specified class are missing in class attribute of the element.
  Unit removeClasses(Array<String> cssClasses) => classes.removeAll(cssClasses);
}

extension DomNodeExtension on Node {
  /// Gets a value indicating whether this node is an [Element].
  Boolean get isElement => this is Element;

  /// Gets a value indicating whether this node is a [TEXT_NODE] or a [CDATA_SECTION_NODE].
  Boolean get isText => this is Text;

  /// Removes all the children from this node.
  Unit clear() => childNodes.clear();
}
