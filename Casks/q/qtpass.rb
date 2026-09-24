cask "qtpass" do
  version "1.8.2"
  sha256 "cf7975178ed16dfb1eebb4833cca5c79c546e03e0c65895081907adec8825f4f"

  url "https://github.com/IJHack/qtpass/releases/download/v#{version}/qtpass-#{version}.dmg"
  name "QtPass"
  desc "Multi-platform GUI for pass, the standard unix password manager"
  homepage "https://qtpass.org/"

  depends_on macos: :ventura

  app "QtPass.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  zap trash: [
    "~/Library/Preferences/org.ijhack.QtPass.plist",
    "~/Library/Saved Application State/org.qtpass.savedState",
  ]
end
