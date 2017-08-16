part of static_dom.dom;

class Head extends DomMixin {
  final children = <Dom>[];

  Head(
      {List<Dom> children,
      String id,
      Iterable<String> classes,
      Iterable<StyleItem> styles})
      : super(id: id, classes: classes, styles: styles) {
    if (children != null && children.length > 0) {
      this.children.addAll(children);
    }
  }

  @override
  String render() {
    StringBuffer sb = new StringBuffer();
    sb.write(_makeTag('head', id, classes, styles));
    sb.write('>');
    for (Dom child in children) {
      sb.write(child.render());
    }
    sb.write(r'</head>');
    return sb.toString();
  }
}

class Html extends DomMixin {
  final Head head;

  final Body body;

  final children = <Dom>[];

  Html(this.head, this.body,
      {List<Dom> children,
      String id,
      Iterable<String> classes,
      Iterable<StyleItem> styles})
      : super(id: id, classes: classes, styles: styles) {
    if (children != null && children.length > 0) {
      this.children.addAll(children);
    }
  }

  @override
  String render() {
    StringBuffer sb = new StringBuffer();
    sb.write(_makeTag('html', id, classes, styles));
    sb.write('>');
    if (head != null) sb.write(head.render());
    if (body != null) sb.write(body.render());
    for (Dom child in children) {
      sb.write(child.render());
    }
    sb.write(r'</html>');
    return sb.toString();
  }
}

class Body extends DomMixin {
  final children = <Dom>[];

  Body(
      {List<Dom> children,
      String id,
      Iterable<String> classes,
      Iterable<StyleItem> styles})
      : super(id: id, classes: classes, styles: styles) {
    if (children != null && children.length > 0) {
      this.children.addAll(children);
    }
  }

  @override
  String render() {
    StringBuffer sb = new StringBuffer();
    sb.write(_makeTag('body', id, classes, styles));
    sb.write('>');
    for (Dom child in children) {
      sb.write(child.render());
    }
    sb.write(r'</body>');
    return sb.toString();
  }
}

/// Dom item for <style> element
class Style extends DomMixin {
  final List<CssItem> children = <CssItem>[];

  Style(List<CssItem> children, {String id, Iterable<String> classes})
      : super(id: id, classes: classes) {
    this.children.addAll(children);
  }

  @override
  String render() {
    StringBuffer sb = new StringBuffer();
    sb.write(_makeTag('style', id, classes, styles));
    sb.write('>');
    for (CssItem child in children) {
      sb.write(child.render());
    }
    sb.write(r'</style>');
    return sb.toString();
  }
}

class StyleText extends DomMixin {
  final String text;

  StyleText(this.text, {String id, Iterable<String> classes})
      : super(id: id, classes: classes);

  @override
  String render() {
    StringBuffer sb = new StringBuffer();
    sb.write(_makeTag('style', id, classes, styles));
    sb.write('>');
    sb.writeln(text);
    sb.write(r'</style>');
    return sb.toString();
  }
}

class Link extends DomMixin {
  final String href;

  final String type;

  final String rel;

  Link(this.href, {this.type, this.rel});

  @override
  String render() {
    final sb = new StringBuffer('<link');
    sb.write(' href="$href"');
    if(rel != null) sb.write(' rel="$rel"');
    if(type != null) sb.write(' type="$type"');
    sb.writeln('>');
    return sb.toString();
  }
}
