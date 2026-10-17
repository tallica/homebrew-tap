cask "pomodoro" do
  version "0.3.3"
  sha256 "1ee3f801a8a15c54520ff6c0e827fd09296fa7f3811f4e76e552369a75385070"

  url "https://github.com/tallica/pomodoro/releases/download/v#{version}/Pomodoro-v#{version}-macos.zip"
  name "Pomodoro"
  desc "Menu bar timer for the Pomodoro technique"
  homepage "https://github.com/tallica/pomodoro"

  depends_on macos: :ventura

  app "Pomodoro.app"

  zap trash: "~/Library/Preferences/pl.tallica.pomodoro.plist"
end
