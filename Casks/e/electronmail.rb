cask "electronmail" do
  arch arm: "arm64", intel: "x64"

  on_monterey :or_older do
    version "5.3.8"
    sha256 arm:   "d824541227fb50cb198035b0dc7894122a7af305ddd0050f3c7768ef5d999d87",
           intel: "172c4e98eaa5a0cc23b3ea92f771fab506d05426e59fe448c2d7f4a13498e5c0"

    livecheck do
      skip "Legacy version"
    end
  end
  on_ventura :or_newer do
    version "5.3.9"
    sha256 arm:   "d824541227fb50cb198035b0dc7894122a7af305ddd0050f3c7768ef5d999d87",
           intel: "172c4e98eaa5a0cc23b3ea92f771fab506d05426e59fe448c2d7f4a13498e5c0"
  end

  url "https://github.com/vladimiry/ElectronMail/releases/download/v#{version}/electron-mail-#{version}-mac-#{arch}.dmg"
  name "ElectronMail"
  desc "Unofficial ProtonMail Desktop App"
  homepage "https://github.com/vladimiry/ElectronMail"

  depends_on macos: :monterey

  app "electron-mail.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/github.comvladimiryelectronmail.sfl*",
    "~/Library/Application Support/electron-mail",
    "~/Library/Logs/ElectronMail",
    "~/Library/Preferences/github.comvladimiryElectronMail.plist",
    "~/Library/Saved Application State/github.comvladimiryElectronMail.savedState",
  ]
end
