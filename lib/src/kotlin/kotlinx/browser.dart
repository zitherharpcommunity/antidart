/// Access to top-level properties (`document`, `window`, etc.) in the browser environment.
library kotlinx.browser;

import 'dart:html';

external Document get document;

external Storage get localStorage;

external Storage get sessionStorage;

external Window get window;
