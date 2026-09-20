cask "unity-android-support-for-editor" do
  version "6000.6.2f1,770e33f6875c"
  sha256 "40bd06dc90ca2e7ebd8d14797c209289643fb1c9725588c7a4f90795c5b0ac54"

  url "https://download.unity3d.com/download_unity/#{version.csv.second}/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-#{version.csv.first}.pkg"
  name "Unity Android Build Support"
  desc "Android target support for Unity"
  homepage "https://unity.com/products"

  livecheck do
    cask "unity"
  end

  depends_on cask: "unity"
  depends_on :macos

  pkg "UnitySetup-Android-Support-for-Editor-#{version.csv.first}.pkg"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  uninstall pkgutil: "com.unity3d.AndroidPlayer-#{version.csv.first}"
end
