class Lazyincus < Formula
  desc "Terminal UI for Incus, in the style of lazydocker"
  homepage "https://github.com/tallica/lazyincus"
  license "MIT"
  head "https://github.com/tallica/lazyincus.git", branch: "master"

  depends_on "go" => :build

  on_macos do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.17.1/lazyincus_0.17.1_darwin_arm64.tar.gz"
      sha256 "a5d9283c5e54530b185e18e6e8797e759b9b0400929a73043e1934ff6efd8e63"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.17.1/lazyincus_0.17.1_darwin_amd64.tar.gz"
      sha256 "738360c4535f3ffcdc4605ce81d9a5a599c065e862198cc746a6120d55be7e01"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.17.1/lazyincus_0.17.1_linux_arm64.tar.gz"
      sha256 "84adfe0ceeed564d35010f00144e2087dddbba8d17488af879a477e03e044c71"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.17.1/lazyincus_0.17.1_linux_amd64.tar.gz"
      sha256 "0c03cc492587942d2abcf4505103a3422e181d01000b5a2245c786e2cd1d3436"
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
