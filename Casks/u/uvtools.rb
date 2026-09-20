cask "uvtools" do
  arch arm: "arm64", intel: "x64"

  version "7.0.0"
  sha256 arm:   "d33940889c87fc879fcb0a0315dc1752c6d91b9ea9c3917e0a27a6bacda385c8",
         intel: "d9419347188441dc28df76f84cf3c22e220a5ecad5e0afde09556cc3d4789c38"

  url "https://github.com/sn4k3/UVtools/releases/download/v#{version}/UVtools_osx-#{arch}_v#{version}.zip"
  name "UVtools"
  desc "MSLA/DLP, file analysis, calibration, repair, conversion and manipulation"
  homepage "https://github.com/sn4k3/UVtools"

  auto_updates true
  depends_on macos: :ventura

  app "UVtools.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  zap trash: [
    "~/Library/Preferences/com.UVtools.plist",
    "~/Library/Saved Application State/com.UVtools.savedState",
  ]
end
