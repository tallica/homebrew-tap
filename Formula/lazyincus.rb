class Lazyincus < Formula
  desc "Terminal UI for Incus, in the style of lazydocker"
  homepage "https://github.com/tallica/lazyincus"
  license "MIT"
  head "https://github.com/tallica/lazyincus.git", branch: "master"

  depends_on "go" => :build

  on_macos do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.8.1/lazyincus_0.8.1_darwin_arm64.tar.gz"
      sha256 "415458fddbc37e403c6411011e260f4517f20dcae490466b883469df4b85e2d8"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.8.1/lazyincus_0.8.1_darwin_amd64.tar.gz"
      sha256 "87fce36420202ad7300e2a052bbe6b2399e26e38a791ec22b5a6ffb29f0a0d71"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.8.1/lazyincus_0.8.1_linux_arm64.tar.gz"
      sha256 "bd9b09c4df525eb442f2c56716fd9347eedd319752e1d560c483966203e4c653"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.8.1/lazyincus_0.8.1_linux_amd64.tar.gz"
      sha256 "6a1f9a5a37e8a017a29d8e109a465e2d7f864ed5b30ab494abc4f23faa3c9f51"
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
