cask "servo" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026-09-20"
  sha256 arm:   "d5cd078497f622ce3ff3db5b7cde5fb64349d78f13e884eefdf409bf744e4bca",
         intel: "f39d20a809911433d74b344c9123d62bec76437492b9e53c7992e670ceec05c5"

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
