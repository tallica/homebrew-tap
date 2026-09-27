class Lazyincus < Formula
  desc "Terminal UI for Incus, in the style of lazydocker"
  homepage "https://github.com/tallica/lazyincus"
  license "MIT"
  head "https://github.com/tallica/lazyincus.git", branch: "master"

  depends_on "go" => :build

  on_macos do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.10.1/lazyincus_0.10.1_darwin_arm64.tar.gz"
      sha256 "1843284a76748545efa9b8d912b1f00368747fb3cf79d71d8caee6c655635513"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.10.1/lazyincus_0.10.1_darwin_amd64.tar.gz"
      sha256 "78af9e62029f5c641000f792cd6ff94072cbf65797027ba0d777ff9ac3ff68e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.10.1/lazyincus_0.10.1_linux_arm64.tar.gz"
      sha256 "a15666cf71ae19fac7df1b88aac05671792ae8ccbfcea6ce0c3414c2295d0223"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.10.1/lazyincus_0.10.1_linux_amd64.tar.gz"
      sha256 "c67fdea4a3449d75145922d65ea789c743e1026d4161e700a93c28dc150d1d9f"
    end
  end

  def install
    if build.head?
      # Homebrew's HEAD checkout fetches with tagOpt=--no-tags, so `git
      # describe` can't see release tags unless we fetch them ourselves.
      system "git", "fetch", "--tags", "origin"
      system "make", "build"
    end
    bin.install "lazyincus"
  end

  test do
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/lazyincus --version"))
  end
end
