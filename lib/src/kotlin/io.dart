/// IO API for working with files and streams.
library kotlin.io;

import 'dart:convert';
import 'dart:io';

import '../../kotlin.dart';

export '/src/kotlin/io/encoding.dart';
export '/src/kotlin/io/path.dart';

/// Returns the default buffer size when working with buffered streams.
const int DEFAULT_BUFFER_SIZE = 8 * 1024;

/// Creates an empty directory in the specified [directory],
/// using the given [prefix] and [suffix] to generate its name.
@Deprecated(
  'Avoid creating temporary directories in the default temp location '
  'with this function due to too wide permissions on the newly created directory. '
  'Use kotlin.io.path.createTempDirectory instead.',
)
Directory createTempDir({
  String prefix = 'tmp',
  String? suffix,
  File? directory,
}) {
  return Directory.systemTemp.createTempSync(
    '${directory?.path ?? ''}/$prefix${suffix ?? ''}',
  );
}

/// Creates a new empty file in the specified [directory],
/// using the given [prefix] and [suffix] to generate its name.
@Deprecated(
  'Avoid creating temporary files in the default temp location '
  'with this function due to too wide permissions on the newly created file. '
  'Use kotlin.io.path.createTempFile instead or resort to java.io.File.createTempFile.',
)
File createTempFile({
  String prefix = 'tmp',
  String? suffix,
  File? directory,
}) {
  return File(
    '${directory?.path ?? ''}/$prefix${suffix ?? ''}',
  );
}

/// Prints the given [message] to the standard output stream.
Unit print(Any message) => print(message);

/// Prints the given [message] and the line separator to the standard output stream.
Unit println(Any message) => print(message);

/// Reads a line of input from the standard input stream.
///
/// Return the line read or `null` if the input stream
/// is redirected to a file and the end of file has been reached.
String? readline() => stdin.readLineSync(encoding: utf8);

/// Reads a line of input from the standard input stream and returns it,
/// or throws a [RuntimeException] if EOF has already been reached when [readln] is called.
String readln() => readline() ?? '';

/// Reads a line of input from the standard input stream and returns it,
/// or return `null` if EOF has already been reached when [readlnOrNull] is called.
String? readlnOrNull() => readline();

/// An exception class which is used when we have not enough access for some operation.
typedef AccessDeniedException = PathAccessException;

/// An exception class which is used when some file to create or copy to already exists.
typedef FileAlreadyExistsException = PathExistsException;

/// An exception class which is used when file to copy does not exist.
typedef NoSuchFileException = PathNotFoundException;
