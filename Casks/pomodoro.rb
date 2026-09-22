cask "pomodoro" do
  version "0.1.0"
  sha256 "5a9a58980362b67fdc94cc5c77d8b9936a2d387aaf51ec219dea45fdc6fee956"

  url "https://github.com/tallica/pomodoro/releases/download/v#{version}/Pomodoro-v#{version}-macos.zip"
  name "Pomodoro"
  desc "Menu bar timer for the Pomodoro technique"
  homepage "https://github.com/tallica/pomodoro"

  depends_on macos: :ventura

  app "Pomodoro.app"

  zap trash: "~/Library/Preferences/pl.tallica.pomodoro.plist"
end
