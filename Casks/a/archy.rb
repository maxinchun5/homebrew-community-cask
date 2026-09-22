cask "archy" do
  version "2.43.0"
  sha256 "21d03c4f331599017382a440b766231fc3e267e3cb3406636a7e26a7837833e0"

  url "https://sdk-cdn.mypurecloud.com/archy/#{version}/archy-macos.zip"
  name "Archy"
  desc "YAML processor"
  homepage "https://developer.genesys.cloud/devapps/archy/"

  livecheck do
    url "https://sdk-cdn.mypurecloud.com/archy/versions.json"
    strategy :json do |json|
      json.map { |item| item["version"] }
    end
  end

  depends_on :macos

  binary "archyBin/archy-macos-#{version}", target: "archy"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  zap trash: "~/.archy_config"

  caveats do
    requires_rosetta
  end
end
