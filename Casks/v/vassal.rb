cask "vassal" do
  version "3.7.27"
  sha256 "69089b84fd6b2a45796b81ceb4492286a2d3a2f18e9fe03529708ceee6d46433"

  url "https://github.com/vassalengine/vassal/releases/download/#{version}/VASSAL-#{version}-macos-universal.dmg"
  name "VASSAL"
  desc "Board game engine"
  homepage "https://www.vassalengine.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "VASSAL.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  uninstall quit: "org.vassalengine.vassal"

  zap trash: "~/Library/Application Support/VASSAL"
end
