cask "servo" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026-09-21"
  sha256 arm:   "0900fee25d1c801ff84d6603b1c005c12b23f0f08a446cfed719c7b527f965a9",
         intel: "e5e9a8002042d76e81cc4dbf3e79c6dabee32f228de6f985318f9cb4d1c68a88"

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
