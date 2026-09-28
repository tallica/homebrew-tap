class Lazyincus < Formula
  desc "Terminal UI for Incus, in the style of lazydocker"
  homepage "https://github.com/tallica/lazyincus"
  license "MIT"
  head "https://github.com/tallica/lazyincus.git", branch: "master"

  depends_on "go" => :build

  on_macos do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.11.0/lazyincus_0.11.0_darwin_arm64.tar.gz"
      sha256 "91008d64118de1ef3b6393e6ac260491c4eb26cb4e09020f8fe80fe19818be5d"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.11.0/lazyincus_0.11.0_darwin_amd64.tar.gz"
      sha256 "8cfd48c1c47ae8c30bda9372ce9e3043f723fa85dde54adc9e26c1c28c07b5de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.11.0/lazyincus_0.11.0_linux_arm64.tar.gz"
      sha256 "5c4e923cbf86cb589cb630c2d9424a787ec7b3d54bc71887a389b24740a0e231"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.11.0/lazyincus_0.11.0_linux_amd64.tar.gz"
      sha256 "d17b6d3062adf8ef1c555efbe50acf347a2aebf843a7b22c10afd1ef025c72a7"
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
