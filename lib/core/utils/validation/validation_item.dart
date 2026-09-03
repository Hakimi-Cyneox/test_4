class ValidationItem {
  String? msg;
  bool isError;

  ValidationItem({this.msg, this.isError = false});

  bool validate(List<ValidationItem> model) {
    var result = model.where((element) => element.isError).toList();
    return result.isEmpty;
  }
}
