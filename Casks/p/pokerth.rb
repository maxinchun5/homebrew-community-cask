cask "pokerth" do
  version "2.1.9"
  sha256 "9af8c9f05b871abe1aad466d9bcf62a429b90ed88464d7177da3a2cf213b13d1"

  url "https://downloads.sourceforge.net/pokerth/PokerTH-#{version}-Combined.dmg"
  name "PokerTH"
  desc "Free Texas hold'em poker"
  homepage "https://www.pokerth.net/"

  livecheck do
    url "https://sourceforge.net/projects/pokerth/rss?path=/pokerth"
  end

  depends_on macos: :monterey

  app "PokerTH.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  zap trash: "~/.pokerth"
end
