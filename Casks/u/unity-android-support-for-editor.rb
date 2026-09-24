cask "unity-android-support-for-editor" do
  version "6000.6.3f1,45d8eee7de74"
  sha256 "da8ffdd3fa702c7df8c57d9f0888b00ee8190f0f1bac220ddbeb6ebe93b8aaad"

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
