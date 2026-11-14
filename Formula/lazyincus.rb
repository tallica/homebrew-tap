class Lazyincus < Formula
  desc "Terminal UI for Incus, in the style of lazydocker"
  homepage "https://github.com/tallica/lazyincus"
  license "MIT"
  head "https://github.com/tallica/lazyincus.git", branch: "master"

  depends_on "go" => :build

  on_macos do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.17.0/lazyincus_0.17.0_darwin_arm64.tar.gz"
      sha256 "a3b6c07164dba9fc5b6bf1492b3e08d29198b86c3d32dbff2375f7a998735cc5"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.17.0/lazyincus_0.17.0_darwin_amd64.tar.gz"
      sha256 "8ab09bf0570d0468f061f3fb5a1b82c95fd726d371ea623b4cadf0c3a600b628"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.17.0/lazyincus_0.17.0_linux_arm64.tar.gz"
      sha256 "de13f7e99a683f69ffb5cdf9472cb2bbe4c10fa3dcb2974a620493c92f9fcd24"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.17.0/lazyincus_0.17.0_linux_amd64.tar.gz"
      sha256 "e42310215f80629c453c2a63d186ca50a5748766fcf7ddd1127688988da557f4"
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
