part of static_dom.dom;

abstract class DomBacked implements Dom {
  Dom get dom;

  @override
  String render() => dom.render();
}

class DomList implements Dom {
  final List<Dom> doms = <Dom>[];

  DomList(List<Dom> doms) {
    this.doms.addAll(doms);
  }

  String render() {
    final sb = new StringBuffer();
    doms.forEach((Dom d) => sb.writeln(d.render()));
    return sb.toString();
  }
}

typedef ForListMaker<T, D extends Dom> = D Function(int i, T data);

List<D> forList<T, D extends Dom>(List<T> data, ForListMaker<T, D> maker) {
  final ret = <D>[];
  for(int i = 0; i < data.length; i++) {
    final d = maker(i, data[i]);
    if(d is Dom) ret.add(d);
  }
  return ret;
}

typedef ForMapMaker<K, V, D extends Dom> = D Function(K key, V val);

List<D> forMap<K, V, D extends Dom>(Map<K, V> data, ForMapMaker<K, V, D> maker) {
  final ret = <D>[];
  for(K key in data.keys) {
    final d = maker(key, data[key]);
    if(d is Dom) ret.add(d);
  }
  return ret;
}

class NullDom implements Dom {
  String render() => '';
}