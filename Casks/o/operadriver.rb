cask "operadriver" do
  version "152.0.7977.120"
  sha256 "69364e27c6b19b51644258686aaadd6c684963c7f873e3470500728b0e998eb0"

  url "https://github.com/operasoftware/operachromiumdriver/releases/download/v.#{version}/operadriver_mac64.zip"
  name "OperaChromiumDriver"
  desc "Driver for Chromium-based Opera releases"
  homepage "https://github.com/operasoftware/operachromiumdriver"

  livecheck do
    url :url
    regex(/^v?\.?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :macos

  binary "operadriver_mac64/operadriver"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  # No zap stanza required

  caveats do
    requires_rosetta
  end
end
