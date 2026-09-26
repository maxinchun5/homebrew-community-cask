cask "servo" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026-09-25"
  sha256 arm:   "0067ee054d451d50fab673511eab15e09638c64cef47c6afa113bcafb90583e8",
         intel: "214049a851f6ea06f362bd3aea470f160e27fa2756025e3a749cf33d93914e46"

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
