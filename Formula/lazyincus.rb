class Lazyincus < Formula
  desc "Terminal UI for Incus, in the style of lazydocker"
  homepage "https://github.com/tallica/lazyincus"
  license "MIT"
  head "https://github.com/tallica/lazyincus.git", branch: "master"

  depends_on "go" => :build

  on_macos do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.13.0/lazyincus_0.13.0_darwin_arm64.tar.gz"
      sha256 "8e000d3ebe6059060761fc4a51461b381326ab004c209afd1870c46f5d6e8352"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.13.0/lazyincus_0.13.0_darwin_amd64.tar.gz"
      sha256 "fedb559df30b57ec9d592c491a8cf412940b8f42a98499fce7fbdf80b089a5ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.13.0/lazyincus_0.13.0_linux_arm64.tar.gz"
      sha256 "78c3c468baefd5c862980218bf700a1ffe25739d67460f8b7bf0166ffdade93b"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.13.0/lazyincus_0.13.0_linux_amd64.tar.gz"
      sha256 "2cc6bff80f4b418bf6d6059f6bcbd511208271500e2b22deb12bdea99605bf5d"
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
