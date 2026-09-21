cask "chromium-gost" do
  arch arm: "arm64", intel: "amd64"

  on_monterey :or_older do
    version "150.0.7871.224"
    sha256 arm:   "a0da4b01daea8f45bdedf6ec085cc03205113c9f635a69b74f7fd8d62aaa9a79",
           intel: "c992a36f1059bec4305db3880ebbdf1b4327c1477f3e2389f3662418133fa2ad"
    livecheck do
      skip "Legacy version"
    end
  end
  on_ventura :or_newer do
    version "152.0.7977.134"
    sha256 arm:   "a0da4b01daea8f45bdedf6ec085cc03205113c9f635a69b74f7fd8d62aaa9a79",
           intel: "c992a36f1059bec4305db3880ebbdf1b4327c1477f3e2389f3662418133fa2ad"
    livecheck do
      url :url
      strategy :github_latest
    end
  end

  url "https://github.com/deemru/Chromium-Gost/releases/download/#{version}/chromium-gost-#{version}-macos-#{arch}.tar.bz2"
  name "Chromium-Gost"
  desc "Browser based on Chromium with support for GOST cryptographic algorithms"
  homepage "https://github.com/deemru/Chromium-Gost"

  depends_on macos: :monterey

  app "Chromium-Gost.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  zap trash: [
    "~/Library/Application Support/Chromium",
    "~/Library/Caches/Chromium",
    "~/Library/Preferences/ru.cryptopro.chromium-gost.plist",
  ]
end
