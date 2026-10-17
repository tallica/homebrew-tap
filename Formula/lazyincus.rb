class Lazyincus < Formula
  desc "Terminal UI for Incus, in the style of lazydocker"
  homepage "https://github.com/tallica/lazyincus"
  license "MIT"
  head "https://github.com/tallica/lazyincus.git", branch: "master"

  depends_on "go" => :build

  on_macos do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.16.0/lazyincus_0.16.0_darwin_arm64.tar.gz"
      sha256 "19e9f0ef5813418118f52b1b1e75901d0ca63162a71283cb6cce8d12b192c48d"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.16.0/lazyincus_0.16.0_darwin_amd64.tar.gz"
      sha256 "c1f5ea8a740a1d050b195d0b6d0739e983ec8fdbc7b3c753f7e6d99203ca6b9d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.16.0/lazyincus_0.16.0_linux_arm64.tar.gz"
      sha256 "1786f4b2b8b3128c8a82bd5162fa3379d734723f06c8c1c8cd66b0b7b4b739ae"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.16.0/lazyincus_0.16.0_linux_amd64.tar.gz"
      sha256 "607ecf586b1a632c0cd230238728664d5705d7f57f5732c476972f5936fdb9b2"
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
