class Lazyincus < Formula
  desc "Terminal UI for Incus, in the style of lazydocker"
  homepage "https://github.com/tallica/lazyincus"
  license "MIT"
  head "https://github.com/tallica/lazyincus.git", branch: "master"

  depends_on "go" => :build

  on_macos do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.16.1/lazyincus_0.16.1_darwin_arm64.tar.gz"
      sha256 "ebd4e5905c9a273d42f96f6021ad6833b7f39de1f4b38086f1715e778b66dd7f"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.16.1/lazyincus_0.16.1_darwin_amd64.tar.gz"
      sha256 "06cf34eb726ad8a3748401f4fbb15de54a2f5a58d50d8f6f9854045f799a65fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.16.1/lazyincus_0.16.1_linux_arm64.tar.gz"
      sha256 "412816783a6241a278f2858603c853d6c2a900d9324ff90237137c1d123c5ec2"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.16.1/lazyincus_0.16.1_linux_amd64.tar.gz"
      sha256 "7c24318d816e85ac623681c6f63bd6d1e295df1c3afe0b19bae78be9f109d571"
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
