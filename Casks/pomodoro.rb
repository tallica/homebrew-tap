cask "pomodoro" do
  version "0.2.0"
  sha256 "6cd03cb82d0da137aa14ebaa381e3746f88d88fcedbb2bb51bdba3c37017e6ee"

  url "https://github.com/tallica/pomodoro/releases/download/v#{version}/Pomodoro-v#{version}-macos.zip"
  name "Pomodoro"
  desc "Menu bar timer for the Pomodoro technique"
  homepage "https://github.com/tallica/pomodoro"

  depends_on macos: :ventura

  app "Pomodoro.app"

  zap trash: "~/Library/Preferences/pl.tallica.pomodoro.plist"
end
