// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:static_dom/static_dom.dart';

main() {
  final data = <String>['messi.jpg', 'neymar.jpg'];
  Div divEl = div().forEach<String>(
      data,
      (String text) => div(classes: ['item'])
        ..add(img('/data/img/$text', classes: ["item-img"]))
        ..add(t(text, classes: ["item-txt"])));
  print(divEl.render());
}
