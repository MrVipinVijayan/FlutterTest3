bool logEnabled = true;

log(dynamic data) {
  if (null == data) {
    return;
  }
  if (logEnabled) {
    print(data.toString());
  }
}
