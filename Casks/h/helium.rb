cask "helium" do
  version "1.0.0"
  sha256 "30abcdcb04e53f24948897acfd24899c7cdfca564b71b023224ae13f11365bbd"

  url "https://github.com/koush/CarbonResources/releases/download/v#{version}/carbon-mac.zip"
  name "Helium"
  homepage "https://github.com/koush/support-wiki/wiki/Helium-Desktop-Installer-and-Android-App"

  depends_on :macos

  app "Helium.app"

  uninstall quit: "com.koushikdutta.Helium"

  caveats do
    requires_rosetta
  end

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  zap trash: "~/Library/Saved Application State/com.koushikdutta.Helium.savedState"
end
