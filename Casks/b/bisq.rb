cask "bisq" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.10.8"
  sha256 arm:   "8e8f0800a88312f92c8939c4d5285ad9a19ecb33e460b5cf7780681b48e1c9cd",
         intel: "84b8d8376a412d956347e27e479cf708a8eae59618ca13515418c772ad9a6f60"

  url "https://github.com/bisq-network/bisq/releases/download/v#{version}/Bisq-#{arch}-#{version}.dmg"
  name "Bisq"
  desc "Decentralised bitcoin exchange network"
  homepage "https://bisq.network/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Bisq.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  zap trash: [
    "~/Library/Application Support/Bisq",
    "~/Library/Saved Application State/io.bisq.CAT.savedState",
  ]
end
