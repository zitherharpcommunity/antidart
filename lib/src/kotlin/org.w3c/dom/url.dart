/// Kotlin JavaScript wrappers for the DOM URL API.
library org.w3c.dom.url;

import '/src/kotlin/kotlin.dart';
import '../../org.w3c.dart';

/// Exposes the JavaScript [URL](https://developer.mozilla.org/en-US/docs/Web/API/URL) to Kotlin
class URL {
  late String hash;

  late String host;

  late String hostname;

  late String href;

  late String pathname;

  late String port;

  late String protocol;

  late String search;

  late String password;

  late String username;

  late final String origin;

  late final URLSearchParams searchParams;

  final String url;

  final String base;

  URL({
    required this.url,
    required this.base,
  });

  external static String createFor(Blob blob);

  external static String createObjectURLFromBlob(Blob blob);

  external static String createObjectURLFromMediaSource(
      MediaSource mediaSource);

  external static String domainToASCII(String domain);

  external static String domainToUnicode(String domain);

  external static String revokeObjectURL(String url);
}

/// Exposes the JavaScript [URLSearchParams](https://developer.mozilla.org/en-US/docs/Web/API/URLSearchParams) to Kotlin
class URLSearchParams {
  final dynamic init;

  const URLSearchParams(this.init);

  external fun append(String name, String value);

  external fun delete(String name);

  external String? get(String name);

  external Array<String> getAll(String name);

  external Boolean has(String name);

  external fun set(String name, String value);
}
