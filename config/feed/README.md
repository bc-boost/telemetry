Place all `*.app` files in this folder, that should be published as dependencies on the build process. Usually this are all Apps/extensions not provided by **LABs**. You must reference this folder as **Folder Package Provider** on the `build.json` file, otherwise the build process doesn't find the Apps.

Do this in the following way on `build.json` file:

``` JSON
        "packageProvider": "folder/config/feed",
```
