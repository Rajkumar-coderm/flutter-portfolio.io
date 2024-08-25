import 'dart:html' as html;

void openInWindow(String uri, String name) async {
  html.window.open(uri, name);
}
