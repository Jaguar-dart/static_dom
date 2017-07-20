part of static_dom.dom;

class TextBlock implements DomItem {
  String id;

  final classes = new Set<String>();

  final Style style;

  String text;

  TextBlock(this.text,
      {this.id, List<String> classes, Style styles})
      : style = styles ?? new Style() {
    if (classes != null && classes.length > 0) {
      this.classes.addAll(classes);
    }
  }

  @override
  String render() {
    StringBuffer sb = new StringBuffer();
    sb.write(_makeTag('div', id, classes, style));
    sb.write('>');
    sb.write(_sanitizer.convert(text));
    sb.write(r'</div>');
    return sb.toString();
  }
}
