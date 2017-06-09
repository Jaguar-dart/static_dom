// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:convert' show HtmlEscape;

final _sanitizer = const HtmlEscape();

typedef DomItem ItemMaker<T>(T data);

abstract class DomItem {
  String get id;

  Set<String> get classes;

  String render();
}

class TextBlock implements DomItem {
  String id;

  final classes = new Set<String>();

  String text;

  TextBlock(this.text, {this.id, List<String> classes}) {
    if (classes != null && classes.length > 0) {
      this.classes.addAll(classes);
    }
  }

  String render() {
    StringBuffer sb = new StringBuffer();
    sb.write(r'<div');
    if (id is String) sb.write(' id="$id"');
    if (classes != null && classes.length > 0)
      sb.write(' class="${classes.join(' ')}"');
    sb.write('>');
    sb.write(_sanitizer.convert(text));
    sb.write(r'</div>');
    return sb.toString();
  }
}

class Div implements DomItem {
  String id;

  final classes = new Set<String>();

  final children = <DomItem>[];

  Div({List<DomItem> child, this.id, List<String> classes}) {
    if (child != null && child.length > 0) {
      children.addAll(child);
    }
    if (classes != null && classes.length > 0) {
      this.classes.addAll(classes);
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

  String render() {
    StringBuffer sb = new StringBuffer();
    sb.write(r'<div');
    if (id is String) sb.write(' id="$id"');
    if (classes != null && classes.length > 0)
      sb.write(' class="${classes.join(' ')}"');
    sb.write('>');
    for (DomItem child in children) {
      sb.write(child.render());
    }
    sb.write(r'</div>');
    return sb.toString();
  }
}

class Image implements DomItem {
  String id;

  final classes = new Set<String>();

  String src;

  String width;

  String height;

  Image(this.src, {this.id, List<String> classes, this.width, this.height}) {
    if (classes != null && classes.length > 0) {
      this.classes.addAll(classes);
    }
  }

  String render() {
    StringBuffer sb = new StringBuffer();
    sb.write(r'<img');
    if (id is String) sb.write(' id="$id"');
    if (classes != null && classes.length > 0)
      sb.write(' class="${classes.join(' ')}"');
    sb.write(' src="$src"');
    if (width is String && width.isNotEmpty) sb.write(' width="$width"');
    if (height is String && height.isNotEmpty) sb.write(' height="$height"');
    sb.write('>');
    return sb.toString();
  }
}

Div d({List<DomItem> child, String id, List<String> classes}) =>
    new Div(child: child, id: id, classes: classes);

TextBlock t(String text, {String id, List<String> classes}) =>
    new TextBlock(text, id: id, classes: classes);

List<TextBlock> tIter(List<String> texts, {List<String> classes}) =>
    texts.map((String text) => t(text, classes: classes)).toList();

Image i(String src,
        {String id, List<String> classes, String width, String height}) =>
    new Image(src, id: id, classes: classes, width: width, height: height);

List<Image> iIter(List<String> srcs,
        {List<String> classes, String width, String height}) =>
    srcs
        .map((String src) =>
            i(src, classes: classes, width: width, height: height))
        .toList();
