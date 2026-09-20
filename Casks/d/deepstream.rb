cask "deepstream" do
  version "10.2.2"
  sha256 "0a3e601e4bf18a6cb3f0170eb9befd536b86df42c0685c25a718229df04587f7"

  url "https://github.com/deepstreamIO/deepstream.io/releases/download/v#{version}/deepstream.io-mac-#{version}.pkg"
  name "deepstream"
  desc "Data-sync realtime server"
  homepage "https://deepstream.io/"

  depends_on :macos

  pkg "deepstream.io-mac-#{version}.pkg"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  uninstall pkgutil: "deepstream.io"

  # No zap stanza required

  caveats do
    files_in_usr_local
  end
end
