checkObj(dynamic model, String val) {
  if (model == null) {
    return "";
  }
  return model.toJson()["val"];
}
