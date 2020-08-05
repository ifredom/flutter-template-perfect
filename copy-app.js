// test.js
var { exec } = require("child_process");
const fs = require("fs");
const path = require("path");

var targetPath = "build/app/outputs/apk/release";
var cli = "cd " + targetPath;
var APP_NAME = "app-release.apk";
exec(cli, { encoding: "utf8" }, function (err, stdout, stderr) {
  if (err) {
    console.log(err);
    return;
  }
  copyFile(resolvePath(targetPath, APP_NAME), resolvePath("./", APP_NAME));
});

function resolvePath(filePath, fileName) {
  return path.resolve(filePath, fileName);
}
function copyFile(source, target) {
  fs.writeFileSync(target, fs.readFileSync(source));
}
