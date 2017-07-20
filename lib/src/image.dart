part of static_dom.dom;

class Image implements DomItem {
  String id;

  final classes = new Set<String>();

  final Style style;

  String src;

  int width;

  int height;

  Image(this.src,
      {this.id,
      List<String> classes,
      Style styles,
      this.width,
      this.height,
      this.onclick})
      : style = styles ?? new Style() {
    if (classes != null && classes.length > 0) {
      this.classes.addAll(classes);
    }
  }

  Function onclick;

  Image onClick(Function func) {
    onclick = func;
    return this;
  }

  @override
  String render() {
    StringBuffer sb = new StringBuffer();
    sb.write(_makeTag('img', id, classes, style));
    sb.write(' src="$src"');
    if (width is int) sb.write(' width="$width"');
    if (height is int) sb.write(' height="$height"');
    sb.write('/>');
    return sb.toString();
  }
}
