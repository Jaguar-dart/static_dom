// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:static_dom/static_dom.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('First Test', () {
      final data = <String>['messi.jpg', 'neymar.jpg'];
      Div div = d().forEach<String>(
          data,
          (String text) => d(classes: ['item'])
            ..add(i('/data/img/$text', classes: ["item-img"]))
            ..add(t(text, classes: ["item-txt"])));
      expect(div.render(),
          r'''<div><div class="item"><img class="item-img" src="/data/img/messi.jpg"><div class="item-txt">messi.jpg</div></div><div class="item"><img class="item-img" src="/data/img/neymar.jpg"><div class="item-txt">neymar.jpg</div></div></div>''');
    });
  });
}
