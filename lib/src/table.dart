part of static_dom.dom;

abstract class TrChild implements Dom {}

class Th extends DomMixin implements TrChild {
  final Dom child;

  Th(this.child,
      {String id, Iterable<String> classes, Iterable<StyleItem> styles})
      : super(id: id, classes: classes, styles: styles);

  @override
  String render() {
    final sb = new StringBuffer();
    sb.write(_makeTag('th', id, classes, styles));
    sb.write('>');
    sb.write(child.render());
    sb.write(r'</th>');
    return sb.toString();
  }
}

class Td extends DomMixin implements TrChild {
  final Dom child;

  Td(this.child,
      {String id, Iterable<String> classes, Iterable<StyleItem> styles})
      : super(id: id, classes: classes, styles: styles);

  @override
  String render() {
    final sb = new StringBuffer();
    sb.write(_makeTag('td', id, classes, styles));
    sb.write('>');
    sb.write(child.render());
    sb.write(r'</td>');
    return sb.toString();
  }
}

class Tr extends DomMixin {
  final children = <TrChild>[];

  Tr(
      {List<TrChild> children,
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
    final sb = new StringBuffer();
    sb.write(_makeTag('tr', id, classes, styles));
    sb.write('>');
    for (TrChild child in children) {
      sb.write(child.render());
    }
    sb.write(r'</tr>');
    return sb.toString();
  }
}

class Table extends DomMixin {
  final children = <Tr>[];

  Table(
      {List<Tr> children,
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
    final sb = new StringBuffer();
    sb.write(_makeTag('table', id, classes, styles));
    sb.write('>');
    for (Tr child in children) {
      sb.write(child.render());
    }
    sb.write(r'</table>');
    return sb.toString();
  }
}
