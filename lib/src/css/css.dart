library static_dom.css;

class Style {
  Map<String, String> get items {
    final ret = <String, String>{};

    ret.addAll(_styles);

    if(_backgroundColor is String) {
      ret['background-color'] = _backgroundColor;
    }

    if(_color is String) {
      ret['color'] = _color;
    }

    if(_backgroundImage is String) {
      ret['background-image'] = 'url($_backgroundImage)';
    }

    if(_transitions.length > 0) {
      ret['transition'] = _transitions.join(', ');
    }

    if(_width is String) {
      ret['width'] = _width;
    }

    if(_height is String) {
      ret['height'] = _height;
    }

    if(_backgroundRepeat is String) {
      ret['background-repeat'] = _backgroundRepeat;
    }

    if(_backgroundPosition is String) {
      ret['background-position'] = _backgroundPosition;
    }

    return ret;
  }

  operator []=(String key, String value) => _styles[key] = value;

  final _styles = <String, String>{};

  String _backgroundColor;

  set backgroundColor(String value) {
    _backgroundColor = value;
  }

  String get backgroundColor => _backgroundColor;

  String _color;

  set color(String value) {
    _color = value;
  }

  String get color => _color;

  String _backgroundImage;

  set backgroundImage(String value) => _backgroundImage = value;

  String get backgroundImage => _backgroundImage;

  String _backgroundRepeat;

  set backgroundRepeat(String value) => _backgroundRepeat = value;

  String get backgroundRepeat => _backgroundRepeat;

  String _backgroundPosition;

  set backgroundPosition(String value) => _backgroundPosition = value;

  String get backgroundPosition => _backgroundPosition;



  String _width;

  set width(String value) => _width = value;

  set widthPx(int value) => width = '${value}px';

  String get width => _width;

  String _height;

  set height(String value) => _height = value;

  set heightPx(int value) => _height = '${value}px';

  String get height => _height;

  setSize(int widthPx, int heightPx) {
    this.widthPx = widthPx;
    this.heightPx = heightPx;
  }

  final _transitions = <String>[];

  void addTransition(String property, num duration, {num delay, String timing}) {
    StringBuffer sb = new StringBuffer();
    sb.write('$property ${duration}s');
    if(timing is String) {
      sb.write(' $timing');
    }
    if(delay is num) {
      sb.write(' ${delay}s');
    }
    _transitions.add(sb.toString());
  }

  void add(String key, String value) {
    if(key is! String || key.isEmpty) return;
    _styles[key] = value;
  }

  void addAll(Map<String, String> values) {
    values.forEach(add);
  }

  String styleCss() {
    StringBuffer sb = new StringBuffer();
    final css = items;
    for(String style in css.keys) {
      sb.write(style);
      sb.write(': ');
      sb.write(css[style]);
      sb.write(';');
    }
    return sb.toString();
  }
}

class CssItem extends Object with Style {
  String selector;

  CssItem(this.selector, [Map<String, String> styles = const {}]) {
    addAll(styles);
  }

  CssItem.hover(this.selector, [Map<String, String> styles = const {}]) {
    selector += ':hover';
    addAll(styles);
  }

  CssItem.active(this.selector, [Map<String, String> styles = const {}]) {
    selector += ':active';
    addAll(styles);
  }

  CssItem.focus(this.selector, [Map<String, String> styles = const {}]) {
    selector += ':focus';
    addAll(styles);
  }

  String render() {
    StringBuffer sb = new StringBuffer();
    sb.write(selector + ' ');
    sb.writeln('{');
    sb.writeln(styleCss());
    sb.writeln('}');
    return sb.toString();
  }
}