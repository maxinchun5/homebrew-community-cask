cask "aria2d" do
  on_big_sur :or_older do
    version "1.4.1,470"
    sha256 "71aea297a3e47294a1097506945ba943915bda2784f93eead53487b5ccea547c"
    livecheck do
      skip "Legacy version"
    end
  end
  on_monterey :or_newer do
    version "1.4.2,484"
    sha256 "5ca7e037d934eac8d6b545db375e23fec1cbfacd99705f0b8d08eb0f98643e17"
    livecheck do
      url "https://raw.githubusercontent.com/xjbeta/AppUpdaterAppcasts/master/Aria2D/Appcast.xml"
      strategy :sparkle do |items|
        items.map(&:nice_version)
      end
    end
  end

  if Gem::Version.new(version.csv.first) >= Gem::Version.new("1.4.2")
    url "https://github.com/xjbeta/Aria2D/releases/download/#{version.csv.first}/Aria2D.zip"
  else
    url "https://github.com/xjbeta/Aria2D/releases/download/#{version.csv.first}%28#{version.csv.second}%29/Aria2D.zip"
  end
  name "Aria2D"
  desc "Aria2 GUI"
  homepage "https://github.com/xjbeta/Aria2D"

  depends_on :macos

  app "Aria2D.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}"]
  end

  zap trash: [
    "~/Library/Application Support/Aria2D",
    "~/Library/Application Support/com.xjbeta.Aria2D",
    "~/Library/Preferences/com.xjbeta.Aria2D.plist",
    "~/Library/Saved Application State/com.xjbeta.Aria2D.savedState",
  ]
end
