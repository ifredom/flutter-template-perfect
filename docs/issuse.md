# issuse


## 1.One or more plugins require a higher Android NDK version.


change: android/app/build.gradle

```bash
android {
    # from here
    // ndkVersion = flutter.ndkVersion
    # change to
    ndkVersion = "25.2.9519653"

    ...
}
```
