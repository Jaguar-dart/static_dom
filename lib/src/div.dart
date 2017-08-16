part of static_dom.dom;

class Div extends DomMixin {
  final List<Dom> children = <Dom>[];

  final List<StyleItem> style = <StyleItem>[];

  Div(
      {List<Dom> children,
      String id,
      Iterable<String> classes,
      Iterable<StyleItem> styles})
      : super(id: id, classes: classes, styles: styles) {
    if (children != null && children.length > 0) {
      this.children.addAll(children);
    }
  }

  Div add(child) {
    children.add(child);
    return this;
  }

  Div forEach<T>(Iterable<T> iterable, ItemMaker<T> maker) {
    for (T x in iterable) {
      children.add(maker(x));
    }
    return this;
  }

  Div addD({List<Dom> child, String id, List<String> classes}) {
    Div item = div(children: child, id: id, classes: classes);
    add(item);
    return item;
  }

  TextBlock addT(String text, {String id, List<String> classes}) {
    TextBlock item = t(text, id: id, classes: classes);
    add(item);
    return item;
  }

  Image addI(String src,
      {String id, List<String> classes, int width, int height}) {
    Image item =
        img(src, id: id, classes: classes, width: width, height: height);
    add(item);
    return item;
  }

  Checkbox addC(
      {String id,
      List<String> classes,
      bool autofocus: false,
      bool checked: false,
      bool disabled: false,
      bool indeterminate: false,
      String name,
      bool required: false,
      String value}) {
    Checkbox item = c(
        id: id,
        classes: classes,
        autofocus: autofocus,
        checked: checked,
        disabled: disabled,
        indeterminate: indeterminate,
        name: name,
        required: required,
        value: value);
    add(item);
    return item;
  }

  @override
  String render() {
    StringBuffer sb = new StringBuffer();
    sb.write(_makeTag('div', id, classes, style));
    sb.write('>');
    for (Dom child in children) {
      sb.write(child.render());
    }
    sb.write(r'</div>');
    return sb.toString();
  }
}
