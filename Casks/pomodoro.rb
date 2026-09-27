cask "pomodoro" do
  version "0.3.2"
  sha256 "a49aaf9105968873c03c622308e55aeb0040917e81ca88ab462529d1fa375300"

  url "https://github.com/tallica/pomodoro/releases/download/v#{version}/Pomodoro-v#{version}-macos.zip"
  name "Pomodoro"
  desc "Menu bar timer for the Pomodoro technique"
  homepage "https://github.com/tallica/pomodoro"

  depends_on macos: :ventura

  app "Pomodoro.app"

  zap trash: "~/Library/Preferences/pl.tallica.pomodoro.plist"
end
