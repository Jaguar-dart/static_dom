// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library static_dom.dom;

import 'dart:convert' show HtmlEscape;
import 'package:static_dom/src/css/css.dart';

part 'input/checkbox.dart';

part 'package:static_dom/src/table.dart';

part 'div.dart';
part 'image.dart';
part 'text.dart';
part 'outer.dart';
part 'heading.dart';
part 'dom_backed.dart';

final _sanitizer = const HtmlEscape();

typedef Dom ItemMaker<T>(T data);

class Render {
  Render(this.html, [List<CssItem> css]) : css = css ?? new List();

  String html;

  List<CssItem> css;
}

abstract class Dom {
  String render();
}

abstract class DomMixin implements Dom {
  final String id;

  final Set<String> classes = new Set<String>();

  final List<StyleItem> styles = <StyleItem>[];

  DomMixin({this.id, Iterable<String> classes, Iterable<StyleItem> styles}) {
    if (classes != null) {
      this.classes.addAll(classes);
    }

    if (styles != null) {
      this.styles.addAll(styles);
    }
  }
}

Html html(Head head, Body body,
        {List<Dom> children,
        String id,
        Iterable<String> classes,
        Iterable<StyleItem> styles}) =>
    new Html(head, body,
        children: children, id: id, classes: classes, styles: styles);

Head head(
    {List<Dom> children,
    List<String> css: const [],
    String id,
    Iterable<String> classes,
    Iterable<StyleItem> styles}) {
  final List<Dom> c = [];
  if (children != null) c.addAll(children);
  css.map(styleLink).forEach(c.add);
  return new Head(children: c, id: id, classes: classes, styles: styles);
}

Body body(
        {List<Dom> children,
        String id,
        Iterable<String> classes,
        Iterable<StyleItem> styles}) =>
    new Body(children: children, id: id, classes: classes, styles: styles);

Div div(
    {List<Dom> children,
    String id,
    Iterable<String> classes,
    String clazz,
    Iterable<StyleItem> styles}) {
  if (clazz != null && classes != null) {
    throw new Exception('Only one of clazz or classes is allowed!');
  }
  List<String> c = [];
  if (clazz != null) c.add(clazz);
  if (classes != null) c.addAll(classes);
  return new Div(children: children, id: id, classes: c, styles: styles);
}

TextBlock t(String text,
        {String id, Iterable<String> classes, Iterable<StyleItem> styles}) =>
    new TextBlock(text, id: id, classes: classes, styles: styles);

List<TextBlock> tIter(List<String> texts,
        {Iterable<String> classes, Iterable<StyleItem> styles}) =>
    texts
        .map((String text) => t(text, classes: classes, styles: styles))
        .toList();

Text text(text) => new Text(text.toString());

Image img(String src,
        {String id,
        Iterable<String> classes,
        Iterable<StyleItem> styles,
        int width,
        int height}) =>
    new Image(src,
        id: id, classes: classes, styles: styles, width: width, height: height);

List<Image> imgIter(List<String> srcs,
        {Iterable<String> classes,
        Iterable<StyleItem> styles,
        int width,
        int height}) =>
    srcs
        .map((String src) => img(src,
            classes: classes, styles: styles, width: width, height: height))
        .toList();

Checkbox c(
        {String id,
        Iterable<String> classes,
        Iterable<StyleItem> styles,
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
        styles: styles,
        autofocus: autofocus,
        checked: checked,
        disabled: disabled,
        indeterminate: indeterminate,
        name: name,
        required: required,
        value: value);

Heading h1(
    {title,
    List<Dom> children,
    String id,
    Iterable<String> classes,
    Iterable<StyleItem> styles}) {
  if (title != null && children != null) {
    throw new Exception('Only one of title or children is allowed!');
  }
  final List<Dom> c = [];
  if (title != null) c.add(text(title));
  if (children != null) c.addAll(children);
  return new Heading(children: c, id: id, classes: classes, styles: styles);
}

Heading h2(
    {title,
    List<Dom> children,
    String id,
    Iterable<String> classes,
    Iterable<StyleItem> styles}) {
  if (title != null && children != null) {
    throw new Exception('Only one of title or children is allowed!');
  }
  final List<Dom> c = [];
  if (title != null) c.add(text(title));
  if (children != null) c.addAll(children);
  return new Heading(
      children: c, id: id, level: 2, classes: classes, styles: styles);
}

Heading h3(
    {title,
    List<Dom> children,
    String id,
    Iterable<String> classes,
    Iterable<StyleItem> styles}) {
  if (title != null && children != null) {
    throw new Exception('Only one of title or children is allowed!');
  }
  final List<Dom> c = [];
  if (title != null) c.add(text(title));
  if (children != null) c.addAll(children);
  return new Heading(
      children: c, id: id, level: 3, classes: classes, styles: styles);
}

Heading h4(
    {title,
    List<Dom> children,
    String id,
    Iterable<String> classes,
    Iterable<StyleItem> styles}) {
  if (title != null && children != null) {
    throw new Exception('Only one of title or children is allowed!');
  }
  final List<Dom> c = [];
  if (title != null) c.add(text(title));
  if (children != null) c.addAll(children);
  return new Heading(
      children: c, id: id, level: 4, classes: classes, styles: styles);
}

Heading h5(
    {title,
    List<Dom> children,
    String id,
    Iterable<String> classes,
    Iterable<StyleItem> styles}) {
  if (title != null && children != null) {
    throw new Exception('Only one of title or children is allowed!');
  }
  final List<Dom> c = [];
  if (title != null) c.add(text(title));
  if (children != null) c.addAll(children);
  return new Heading(
      children: c, id: id, level: 5, classes: classes, styles: styles);
}

Heading h6(
    {title,
    List<Dom> children,
    String id,
    Iterable<String> classes,
    Iterable<StyleItem> styles}) {
  if (title != null && children != null) {
    throw new Exception('Only one of title or children is allowed!');
  }
  final List<Dom> c = [];
  if (title != null) c.add(text(title));
  if (children != null) c.addAll(children);
  return new Heading(
      children: c, id: id, level: 6, classes: classes, styles: styles);
}

Table table(List<Tr> children,
        {String id, Iterable<String> classes, Iterable<StyleItem> styles}) =>
    new Table(children: children, id: id, classes: classes, styles: styles);

Table tableIter(List<Tr> rows,
    {Tr header,
    String id,
    Iterable<String> classes,
    Iterable<StyleItem> styles}) {
  final List<Tr> children = [];
  if (header != null) children.add(header);
  children.addAll(rows);
  return new Table(
      children: children, id: id, classes: classes, styles: styles);
}

Tr tr(
        {List<TrChild> children,
        String id,
        Iterable<String> classes,
        Iterable<StyleItem> styles}) =>
    new Tr(children: children, id: id, classes: classes, styles: styles);

Th th(Dom child,
        {String id, Iterable<String> classes, Iterable<StyleItem> styles}) =>
    new Th(child, id: id, classes: classes, styles: styles);

Td td(Dom child,
    {String id,
    Iterable<String> classes,
    Iterable<StyleItem> styles,
    Map<String, bool> classIf}) {
  final Set<String> cs = new Set<String>();
  if (classes != null) cs.addAll(classes);
  if (classIf != null)
    classIf.forEach((String c, bool t) {
      if (t) cs.add(c);
    });
  return new Td(child, id: id, classes: cs, styles: styles);
}

String _makeTag(String tag, String id, Iterable<String> classes,
    Iterable<StyleItem> style) {
  StringBuffer sb = new StringBuffer();
  sb.write('<$tag');
  if (id is String) sb.write(' id="$id"');
  if (classes != null && classes.length > 0)
    sb.write(' class="${classes.join(' ')}"');
  if (style != null && style.length > 0) {
    sb.write(' style="');
    style.forEach((StyleItem item) => sb.write(item.render()));
    sb.write('"');
  }
  return sb.toString();
}

Style style(List<CssItem> children, {String id, Iterable<String> classes}) =>
    new Style(children, id: id, classes: classes);

StyleText styleText(String text, {String id, Iterable<String> classes}) =>
    new StyleText(text, id: id, classes: classes);

Link styleLink(String href) =>
    new Link(href, type: 'text/css', rel: 'stylesheet');

A a(String href,
    {List<Dom> children,
    Target target,
    String id,
    Iterable<String> classes,
    Iterable<StyleItem> styles,
    Map<String, bool> classIf}) {
  final Set<String> cs = new Set<String>();
  if (classes != null) cs.addAll(classes);
  if (classIf != null)
    classIf.forEach((String c, bool t) {
      if (t) cs.add(c);
    });
  return new A(
      href: href,
      target: target,
      children: children,
      id: id,
      classes: cs,
      styles: styles);
}

A hyperlink(String href, content,
    {Target target,
    String id,
    Iterable<String> classes,
    Iterable<StyleItem> styles,
    Map<String, bool> classIf}) {
  final Set<String> cs = new Set<String>();
  if (classes != null) cs.addAll(classes);
  if (classIf != null)
    classIf.forEach((String c, bool t) {
      if (t) cs.add(c);
    });
  return new A(
      href: href,
      target: target,
      children: [text(content)],
      id: id,
      classes: cs,
      styles: styles);
}
