class FormatText {
  static String formatLevelcode(String level) {
    const List<Map> statusMap = [
      {
        "value": [0, 9],
        "text": "初学乍练"
      },
      {
        "value": [10, 29],
        "text": "登堂入室"
      },
      {
        "value": [30, 59],
        "text": "游刃有余"
      },
      {
        "value": [60, 99],
        "text": "炉火纯青"
      },
      {
        "value": [100, 999999],
        "text": "才华横溢"
      },
    ];

    Map filterMap = statusMap.firstWhere(
        (item) => (int.parse(level) >= item["value"][0] && int.parse(level) <= item["value"][1]),
        orElse: () => {});

    return filterMap["text"];
  }
}
