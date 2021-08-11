/// 枚举: 支持的语言种类
enum SupportLocale { FOLLOW_SYSTEM, SIMPLIFIED_CHINESE, TRADITIONAL_CHINESE_TW, TRADITIONAL_CHINESE_HK, ENGLISH }

enum BackImageMode { light, black }

enum ConnectivityStatus { Cellular, WiFi, Offline, Init }

enum SexEnum { man, women }

enum UserinfoType { username, sex, age, address, description }

enum DialogType {
  Basic,
  Generic,
  CUSTOM_INPUT,
  CUSTOM_ARRAY_SIZE,
  ABOUT_APP,
}
