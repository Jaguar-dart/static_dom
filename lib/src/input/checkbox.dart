part of static_dom.dom;

class Checkbox implements DomItem {
  String id;

  final classes = new Set<String>();

  final Style style;

  /// Sets whether a checkbox should automatically get focus when the page loads
  bool autofocus = false;

  /// Sets the checked state of a checkbox
  bool checked = false;

  /// Sets whether a checkbox is disabled, or not
  bool disabled = false;

  /// Sets the indeterminate state of the checkbox
  bool indeterminate = false;

  /// Sets the value of the name attribute of a checkbox
  String name;

  /// Sets whether the checkbox must be checked before submitting a form
  bool required = false;

  /// Sets the value of the value attribute of a checkbox
  String value;

  Checkbox(
      {this.id,
      List<String> classes,
      Style styles,
      this.autofocus: false,
      this.checked: false,
      this.disabled: false,
      this.indeterminate: false,
      this.name,
      this.required: false,
      this.value})
      : style = styles ?? new Style() {
    if (classes != null && classes.length > 0) {
      this.classes.addAll(classes);
    }
  }

  Checkbox setAutofocus([bool value = true]) {
    autofocus = value;
    return this;
  }

  Checkbox setChecked([bool value = true]) {
    checked = value;
    return this;
  }

  Checkbox setDisabled([bool value = true]) {
    disabled = value;
    return this;
  }

  Checkbox setIndeterminate([bool value = true]) {
    indeterminate = value;
    return this;
  }

  @override
  String render() {
    StringBuffer sb = new StringBuffer();
    sb.write(_makeTag('input', id, classes, style));
    sb.write(' type="checkbox"');
    if (autofocus) sb.write(' autofocus');
    if (checked) sb.write(' checked');
    if (disabled) sb.write(' disabled');
    if (indeterminate) sb.write(' indeterminate');
    if (name is String && name.isNotEmpty) sb.write(' name="$name"');
    if (required) sb.write(' required');
    if (value is String && value.isNotEmpty) sb.write(' value="$value"');
    sb.write('/>');
    return sb.toString();
  }
}
