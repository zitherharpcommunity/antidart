// ignore_for_file: non_constant_identifier_names

/// Kotlin JavaScript wrappers for the [W3C file API](https://www.w3.org/TR/FileAPI).
library org.w3c.files;

import '/src/kotlin/kotlin.dart';
import '/src/kotlin/org.khronos.dart';
import '/src/kotlin/org.w3c.dart';

external BlobPropertyBag blobPropertyBag({
  String? type = '',
});

external FilePropertyBag filePropertyBag({
  String? type = '',
  Int? lastModified,
});

class Blob {}

abstract interface class BlobPropertyBag {
  external String? type;
}

/// Exposes the JavaScript [File](https://developer.mozilla.org/en-US/docs/Web/API/File) to Kotlin
class File extends Blob {
  final Array<dynamic> fileBits;

  final String fileName;

  final FilePropertyBag options;

  File({
    required this.fileBits,
    required this.fileName,
    required this.options,
  });

  external Int get lastModified;

  external String get name;
}

/// Exposes the JavaScript [FileList](https://developer.mozilla.org/en-US/docs/Web/API/FileList) to Kotlin
abstract class FileList implements ItemArrayLike<File> {
  const FileList();

  external Int get length;

  @override
  external File? item(Int index);
}

abstract interface class FilePropertyBag extends BlobPropertyBag {
  external Int? lastModified;
}

/// Exposes the JavaScript [FileReader](https://developer.mozilla.org/en-US/docs/Web/API/FileReader) to Kotlin
class FileReader extends EventTarget {
  external static Short get DONE;

  external static Short get EMPTY;

  external static Short get LOADING;

  external dynamic Function(Event)? onabort;

  external dynamic Function(Event)? onerror;

  external dynamic Function(Event)? onload;

  external dynamic Function(Event)? onloadend;

  external dynamic Function(Event)? onloadstart;

  external dynamic Function(ProgressEvent)? onprogress;

  external dynamic get error;

  external Short get readyState;

  external dynamic get result;

  external fun abort();

  external fun readAsArrayBuffer(Blob blob);

  external fun readAsBinaryString(Blob blob);

  external fun readAsDataURL(Blob blob);

  external fun readAsText(Blob blob, String label);
}

/// Exposes the JavaScript [FileReaderSync](https://developer.mozilla.org/en-US/docs/Web/API/FileReaderSync) to Kotlin
class FileReaderSync {
  const FileReaderSync();

  external ArrayBuffer readAsArrayBuffer(Blob blob);

  external String readAsBinaryString(Blob blob);

  external String readAsDataURL(Blob blob);

  external String readAsText(Blob blob, String label);
}

extension FilesFileListExtension on FileList {
  external File? operator [](Int index);
}
