class Lazyincus < Formula
  desc "Terminal UI for Incus, in the style of lazydocker"
  homepage "https://github.com/tallica/lazyincus"
  license "MIT"
  head "https://github.com/tallica/lazyincus.git", branch: "master"

  depends_on "go" => :build

  on_macos do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.14.0/lazyincus_0.14.0_darwin_arm64.tar.gz"
      sha256 "1b54bf5e5202a5079cddf7debb65dad19642b02f00965cf444c274343a051341"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.14.0/lazyincus_0.14.0_darwin_amd64.tar.gz"
      sha256 "3dbcd2ed05c2c60f4f5f518d6459a7cb6dab1fc0ceb80d035fe2ef65d6860b91"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.14.0/lazyincus_0.14.0_linux_arm64.tar.gz"
      sha256 "9b7a50a0b62debd1956f5f796cae3fc7f6a31b745c6e2fa548a08ef492875272"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.14.0/lazyincus_0.14.0_linux_amd64.tar.gz"
      sha256 "3394bdf6c68231ae89ebf77c705f99ebf2f8f92df4427e2defeccd3000f8af0f"
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
