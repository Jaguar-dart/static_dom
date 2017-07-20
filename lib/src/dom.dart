// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library static_dom.dom;

import 'dart:convert' show HtmlEscape;
import 'package:static_dom/src/css/css.dart';

part 'input/checkbox.dart';

part 'div.dart';
part 'image.dart';
part 'text_block.dart';

final _sanitizer = const HtmlEscape();

typedef DomItem ItemMaker<T>(T data);

class Render {
  Render(this.html, [List<CssItem> css]): css = css??new List();

  String html;

  List<CssItem> css;
}

abstract class DomItem {
  String get id;

  Set<String> get classes;

  Style get style;

  String render();
}

Div d({List<DomItem> child, String id, List<String> classes, Style styles}) =>
    new Div(child: child, id: id, classes: classes, styles: styles);

TextBlock t(String text, {String id, List<String> classes}) =>
    new TextBlock(text, id: id, classes: classes);

List<TextBlock> tIter(List<String> texts, {List<String> classes}) =>
    texts.map((String text) => t(text, classes: classes)).toList();

Image i(String src, {String id, List<String> classes, int width, int height}) =>
    new Image(src, id: id, classes: classes, width: width, height: height);

List<Image> iIter(List<String> srcs,
        {List<String> classes, int width, int height}) =>
    srcs
        .map((String src) =>
            i(src, classes: classes, width: width, height: height))
        .toList();

Checkbox c(
        {String id,
        List<String> classes,
        bool autofocus: false,
        bool checked: false,
        bool disabled: false,
        bool indeterminate: false,
        String name,
        bool required: false,
        String value}) =>
    new Checkbox(
        id: id,
        classes: classes,
        autofocus: autofocus,
        checked: checked,
        disabled: disabled,
        indeterminate: indeterminate,
        name: name,
        required: required,
        value: value);

String _makeTag(String tag, String id, Set<String> classes, Style style) {
  StringBuffer sb = new StringBuffer();
  sb.write('<$tag');
  if (id is String) sb.write(' id="$id"');
  if (classes != null && classes.length > 0)
    sb.write(' class="${classes.join(' ')}"');
  if(style.items.length > 0) {
    sb.write(' style="');
    sb.write(style.styleCss());
    sb.write('"');
  }
  return sb.toString();
}