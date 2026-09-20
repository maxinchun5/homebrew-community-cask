cask "kindle-comic-converter" do
  arch arm: "arm", intel: "i386"

  version "11.3.2"
  sha256 arm:   "949d2042357762d9a2db6ecd6677ea6cd638a801bfd0662230b47b45ec2ac51e",
         intel: "9029738010786c0928135ac9b3d52b6f12366fbc3a80798b1cdff47f9aaf5a45"

  url "https://github.com/ciromattia/kcc/releases/download/v#{version}/kcc_macos_#{arch}_#{version}.dmg"
  name "Kindle Comic Converter"
  name "KCC"
  desc "Comic and manga converter for ebook readers"
  homepage "https://github.com/ciromattia/kcc"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Kindle Comic Converter.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  zap trash: "~/Library/Preferences/com.kindlecomicconverter.KindleComicConverter.plist"
end
