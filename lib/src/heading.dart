part of static_dom.dom;

class Heading extends DomMixin {
  final children = <Dom>[];

  final int level;

  Heading(
      {List<Dom> children,
      this.level: 1,
      String id,
      Iterable<String> classes,
      Iterable<StyleItem> styles})
      : super(id: id, classes: classes, styles: styles) {
    if (children != null && children.length > 0) {
      this.children.addAll(children);
    }
    if (level > 6) throw new Exception('Valid heading levels are [1, 6]!');
  }

  @override
  String render() {
    StringBuffer sb = new StringBuffer();
    sb.write(_makeTag('h$level', id, classes, styles));
    sb.write('>');
    for (Dom child in children) {
      sb.write(child.render());
    }
    sb.write('</h$level>');
    return sb.toString();
  }
}
