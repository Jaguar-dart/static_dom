library static_dom.css;

abstract class StyleItem {
  String get style;

  String get value;

  String render() => '$style: $value;';
}

class RawStyle extends StyleItem {
  final String style;

  final String value;

  RawStyle(this.style, this.value);
}

RawStyle rawStyle(String style, String value) => new RawStyle(style, value);

class BackgroundColor extends StyleItem {
  final String color;

  BackgroundColor(this.color);

  factory BackgroundColor.rgb(int r, int g, int b) =>
      new BackgroundColor('rgb($r, $g, $b)');

  factory BackgroundColor.rgba(int r, int g, int b, num a) =>
      new BackgroundColor('rgba($r, $g, $b, $a)');

  String get style => 'background-color';

  String get value => color;
}

BackgroundColor backgroundColor(String color) => new BackgroundColor(color);

BackgroundColor backgroundColorRGB(int r, int g, int b) =>
    new BackgroundColor.rgb(r, g, b);

BackgroundColor backgroundColorRGBA(int r, int g, int b, num a) =>
    new BackgroundColor.rgba(r, g, b, a);

class Color extends StyleItem {
  final String color;

  Color(this.color);

  factory Color.rgb(int r, int g, int b) => new Color('rgb($r, $g, $b)');

  factory Color.rgba(int r, int g, int b, num a) =>
      new Color('rgba($r, $g, $b, $a)');

  String get style => 'color';

  String get value => color;
}

Color color(String color) => new Color(color);

Color colorRGB(int r, int g, int b) => new Color.rgb(r, g, b);

Color colorRGBA(int r, int g, int b, num a) => new Color.rgba(r, g, b, a);

class BackgroundImage extends StyleItem {
  final String image;

  BackgroundImage(this.image);

  String get style => 'background-image';

  String get value => image;
}

BackgroundImage backgroundImage(String image) => new BackgroundImage(image);

BackgroundImage backgroundImageUrl(String image) =>
    new BackgroundImage('url($image)');

class Width extends StyleItem {
  final num width;

  final String unit;

  Width(this.width, [this.unit]);

  String get style => 'width';

  String get value {
    String ret = width.toString();
    if (unit is String) ret += unit;
    return ret;
  }
}

Width width(num width, [String unit]) => new Width(width, unit);

class Height extends StyleItem {
  final num height;

  final String unit;

  Height(this.height, [this.unit]);

  String get style => 'height';

  String get value {
    String ret = height.toString();
    if (unit is String) ret += unit;
    return ret;
  }
}

Height height(num height, [String unit]) => new Height(height, unit);

class CssItem {
  String selector;

  final List<StyleItem> items = <StyleItem>[];

  void addAll(List<StyleItem> styles) => items.addAll(styles);

  CssItem(this.selector, {List<StyleItem> styles: const []}) {
    addAll(styles);
  }

  String render() {
    StringBuffer sb = new StringBuffer();
    sb.writeln(selector + ' {');
    items.forEach((StyleItem item) => sb.writeln(item.render()));
    sb.writeln('}');
    return sb.toString();
  }
}
