class Lazyincus < Formula
  desc "Terminal UI for Incus, in the style of lazydocker"
  homepage "https://github.com/tallica/lazyincus"
  license "MIT"
  head "https://github.com/tallica/lazyincus.git", branch: "master"

  depends_on "go" => :build

  on_macos do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.9.1/lazyincus_0.9.1_darwin_arm64.tar.gz"
      sha256 "1d197011311380251235856f184ab9339e0202ddb3aaa01fab01f841922e1491"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.9.1/lazyincus_0.9.1_darwin_amd64.tar.gz"
      sha256 "7fbac0f362b561de0c78f2751070e2b97a3c6faf6dca09688dca7c9853b8f54d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.9.1/lazyincus_0.9.1_linux_arm64.tar.gz"
      sha256 "292c8525a1b98b1ecbad6d2959e073a1ff4864fb7c70a1d9d3142b1aba65ebdd"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.9.1/lazyincus_0.9.1_linux_amd64.tar.gz"
      sha256 "369c34e61b1c907bee7a7b8073f524218ea615464627cbae895204cde97b5cc7"
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
