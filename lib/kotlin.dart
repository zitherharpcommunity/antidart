/// [**Kotlin Standard Library**](https://kotlinlang.org/api/latest/jvm/stdlib/#kotlin-standard-library)
///
/// The **Kotlin Standard Library** provides living essentials for everyday work with Kotlin.
/// These include:
///
/// * Higher-order functions implementing idiomatic patterns
/// ([let](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin/let.html),
/// [apply](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin/apply.html),
/// [use](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin/use.html),
/// [synchronized](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin/apply.html), etc).
/// * Extension functions providing querying operations for collections (eager) and sequences (lazy).
/// * Various utilities for working with strings and char sequences.
/// * Extensions for JDK classes making it convenient to work with files, IO, and threading.
///
/// See examples at [here](https://play.kotlinlang.org/byExample/overview).
library kotlin.stdlib;

export '/src/kotlin.dart' if (dart.library.html) '/src/kotlinx.dart';
