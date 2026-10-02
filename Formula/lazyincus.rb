class Lazyincus < Formula
  desc "Terminal UI for Incus, in the style of lazydocker"
  homepage "https://github.com/tallica/lazyincus"
  license "MIT"
  head "https://github.com/tallica/lazyincus.git", branch: "master"

  depends_on "go" => :build

  on_macos do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.12.0/lazyincus_0.12.0_darwin_arm64.tar.gz"
      sha256 "5f29f397663af84e995a05cc67a07994b7e56ca38a18a9b03dbbae1873b0d00c"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.12.0/lazyincus_0.12.0_darwin_amd64.tar.gz"
      sha256 "0b1cb3a7b5b5ec4c974773c72705e89d8a1b13463d2842f54d5598523c86cfe8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.12.0/lazyincus_0.12.0_linux_arm64.tar.gz"
      sha256 "961d33e3605a2f8cd43d6919c283425ffb40bf6cd49d771b3d54acf4d4dabbae"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.12.0/lazyincus_0.12.0_linux_amd64.tar.gz"
      sha256 "32bc6f646ac17783107d7346672ebacb2662f22caece9b7a0285950bb9ad508e"
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
