# static_dom

A simple static HTML DOM builder library for Dart

## Usage

A simple usage example:

```dart
Future updatePics() async {
  final JsonResponse resp = await client.getJson('/api/pics');
  print(resp.body);
  List<String> body = resp.body;
  Div divEl = div().forEach<String>(
      data,
      (String text) => div(classes: ['item'])
        ..add(img('/data/img/$text', classes: ["item-img"]))
        ..add(t(text, classes: ["item-txt"])));
  print(div.render());
  picHolder.setInnerHtml(div.render());
}
```
