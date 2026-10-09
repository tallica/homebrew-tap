class Lazyincus < Formula
  desc "Terminal UI for Incus, in the style of lazydocker"
  homepage "https://github.com/tallica/lazyincus"
  license "MIT"
  head "https://github.com/tallica/lazyincus.git", branch: "master"

  depends_on "go" => :build

  on_macos do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.15.0/lazyincus_0.15.0_darwin_arm64.tar.gz"
      sha256 "7ef1d35955a3610ea6036d2b094976be6702b3b2e912889eb7e8b3c2ed909ec4"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.15.0/lazyincus_0.15.0_darwin_amd64.tar.gz"
      sha256 "55aca343ad97a0b6d5714b0ad2a02e02e5b8e0956a69c5d87d0391ef57c9d507"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.15.0/lazyincus_0.15.0_linux_arm64.tar.gz"
      sha256 "06ad14612b2b305e953e3e470f6892566ae148caa637b033555ef536f62e0c54"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.15.0/lazyincus_0.15.0_linux_amd64.tar.gz"
      sha256 "d3edefbf3f5c6a46ee74e9d8de7cffbbce57632a67ab13c21096187788fe5867"
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
