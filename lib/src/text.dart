part of static_dom.dom;

class TextBlock extends DomMixin {
  String text;

  TextBlock(this.text,
      {String id, Iterable<String> classes, Iterable<StyleItem> styles})
      : super(id: id, classes: classes, styles: styles);

  @override
  String render() {
    StringBuffer sb = new StringBuffer();
    sb.write(_makeTag('div', id, classes, styles));
    sb.write('>');
    sb.write(_sanitizer.convert(text));
    sb.write(r'</div>');
    return sb.toString();
  }
}

class Text implements Dom {
  final String text;

  Text(this.text);

  @override
  String render() => text;
}

class Target {
  final String value;

  const Target(this.value);

  static final Target blank = new Target('_blank');

  static final Target parent = new Target('_parent');

  static final Target self = new Target('_self');

  static final Target top = new Target('_top');
}

class A extends DomMixin {
  final List<Dom> children = [];

  final String href;

  final Target target;

  A({List<Dom> children, this.href, this.target, String id, Iterable<String> classes, Iterable<StyleItem> styles})
      : super(id: id, classes: classes, styles: styles) {
    if(children != null) this.children.addAll(children);
  }

  @override
  String render() {
    StringBuffer sb = new StringBuffer();
    sb.write(_makeTag('a', id, classes, styles));
    if(href != null) sb.write(' href="$href"');
    if(target != null) sb.write(' target="${target.value}"');
    sb.write('>');
    children.map((Dom d) => d.render()).forEach(sb.writeln);
    sb.write(r'</a>');
    return sb.toString();
  }
}
