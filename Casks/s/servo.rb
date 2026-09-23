cask "servo" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026-09-22"
  sha256 arm:   "5093592896e9ce31e0b7e25057335a6cb7421459835c08dd3100d2e97f317598",
         intel: "817462c009c13d9b7a7ee58ac0c35ba1696cb4724ddf5fc6897adb26ff728f21"

  url "https://github.com/servo/servo-nightly-builds/releases/download/#{version}/servo-#{arch}-apple-darwin.dmg"
  name "Servo"
  desc "Parallel browser engine"
  homepage "https://servo.org/"

  livecheck do
    url :url
    regex(/^v?(\d+(?:[.-]\d+)+)$/i)
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Servo.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  zap trash: "~/Library/Application Support/Servo"
end
