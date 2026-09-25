class Lazyincus < Formula
  desc "Terminal UI for Incus, in the style of lazydocker"
  homepage "https://github.com/tallica/lazyincus"
  license "MIT"
  head "https://github.com/tallica/lazyincus.git", branch: "master"

  depends_on "go" => :build

  on_macos do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.9.0/lazyincus_0.9.0_darwin_arm64.tar.gz"
      sha256 "bc6058fb4abb84bbfa3a8f136a93d2466140ac00f7755a70ad05c654b06bd9bc"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.9.0/lazyincus_0.9.0_darwin_amd64.tar.gz"
      sha256 "bd86caf70359fde1d9e9015da0249772e84421df2a2674436778b6aa6489821e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.9.0/lazyincus_0.9.0_linux_arm64.tar.gz"
      sha256 "3bb5de42460bfb44742c47d8887fac4b0e7cffe79f413711528466c98ed4227d"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.9.0/lazyincus_0.9.0_linux_amd64.tar.gz"
      sha256 "b24d81ee0ceec6ebd1ef8bb5e2d9c7114f12e105a1438d5d9f3c7ea9d758271f"
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
