class Lazyincus < Formula
  desc "Terminal UI for Incus, in the style of lazydocker"
  homepage "https://github.com/tallica/lazyincus"
  license "MIT"
  head "https://github.com/tallica/lazyincus.git", branch: "master"

  depends_on "go" => :build

  on_macos do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.13.1/lazyincus_0.13.1_darwin_arm64.tar.gz"
      sha256 "e2d67a8754dde108d4c26bc8636a27bb086f24ee0dbe508ec89882b31dbb898e"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.13.1/lazyincus_0.13.1_darwin_amd64.tar.gz"
      sha256 "349d6da72f09e9b587183869e7c672ca799b1ec37af99eb2e9ffa38131782b27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.13.1/lazyincus_0.13.1_linux_arm64.tar.gz"
      sha256 "7ba38a9fbed0c34a62427301607b45440fbc1bfee360ae27a351aabf5cb5ce5c"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.13.1/lazyincus_0.13.1_linux_amd64.tar.gz"
      sha256 "c82023235a106eba8f2df5b042fa69f15d88f12638345172b51b26be2b5f7a78"
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
