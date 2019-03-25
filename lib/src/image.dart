part of static_dom.dom;

class Image extends DomMixin {
  String src;

  int width;

  int height;

  Image(this.src,
      {String id,
      Iterable<String> classes,
      Iterable<StyleItem> styles,
      this.width,
      this.height})
      : super(id: id, classes: classes, styles: styles);

  @override
  String render() {
    StringBuffer sb = new StringBuffer();
    sb.write(_makeTag('img', id, classes, styles));
    sb.write(' src="$src"');
    if (width is int) sb.write(' width="$width"');
    if (height is int) sb.write(' height="$height"');
    sb.write('/>');
    return sb.toString();
  }
}
