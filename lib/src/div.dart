part of static_dom.dom;

class Div implements DomItem {
  String id;

  final classes = new Set<String>();

  final children = <DomItem>[];

  final Style style;

  Div(
      {List<DomItem> child,
      this.id,
      List<String> classes,
      Style styles,
      this.onclick})
      : style = styles ?? new Style() {
    if (child != null && child.length > 0) {
      children.addAll(child);
    }
    if (classes != null && classes.length > 0) {
      this.classes.addAll(classes);
    }
  }

  Function onclick;

  Div onClick(Function func) {
    onclick = func;
    return this;
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

  Div addD({List<DomItem> child, String id, List<String> classes}) {
    Div item = d(child: child, id: id, classes: classes);
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
    Image item = i(src, id: id, classes: classes, width: width, height: height);
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
      String value,
      Function onclick}) {
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
    for (DomItem child in children) {
      sb.write(child.render());
    }
    sb.write(r'</div>');
    return sb.toString();
  }
}
