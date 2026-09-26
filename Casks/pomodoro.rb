cask "pomodoro" do
  version "0.3.1"
  sha256 "2f2b190cc7c9f70f21563fa101568e19f7cdec1402c986864cc45fee8ed3610b"

  url "https://github.com/tallica/pomodoro/releases/download/v#{version}/Pomodoro-v#{version}-macos.zip"
  name "Pomodoro"
  desc "Menu bar timer for the Pomodoro technique"
  homepage "https://github.com/tallica/pomodoro"

  depends_on macos: :ventura

  app "Pomodoro.app"

  zap trash: "~/Library/Preferences/pl.tallica.pomodoro.plist"
end
