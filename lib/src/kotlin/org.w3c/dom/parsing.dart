/// Kotlin JavaScript wrappers for the DOM parsing API.
library org.w3c.dom.parsing;

import 'dart:html';

/// Exposes the JavaScript [DOMParser](https://developer.mozilla.org/en-US/docs/Web/API/DOMParser) to Kotlin.
class DOMParser {
  const DOMParser();

  external Document parseFromString(
    String str,
    dynamic type,
  );
}

/// Exposes the JavaScript [DOMParser](https://developer.mozilla.org/en-US/docs/Web/API/DOMParser) to Kotlin.
class XMLSerializer {
  const XMLSerializer();

  external String serializeToString(Node root);
}
