class Lazyincus < Formula
  desc "Terminal UI for Incus, in the style of lazydocker"
  homepage "https://github.com/tallica/lazyincus"
  license "MIT"
  head "https://github.com/tallica/lazyincus.git", branch: "master"

  depends_on "go" => :build

  on_macos do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.10.0/lazyincus_0.10.0_darwin_arm64.tar.gz"
      sha256 "9aa6fc876f28f613df683ab11a546bf80f2eb96e5b21b0ea14c1ce501302b715"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.10.0/lazyincus_0.10.0_darwin_amd64.tar.gz"
      sha256 "0f3635eca9a5a504f6857003fb95149b331fa0edfab56cefe4df29cebae9e214"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tallica/lazyincus/releases/download/v0.10.0/lazyincus_0.10.0_linux_arm64.tar.gz"
      sha256 "4d217e76e24c0d5db7f46cc5db89c79be3892f15499568557e5202cc7f59c34c"
    end
    on_intel do
      url "https://github.com/tallica/lazyincus/releases/download/v0.10.0/lazyincus_0.10.0_linux_amd64.tar.gz"
      sha256 "fadd181cfbada7708c2dd9459ebfabe6534fe6739e0d1ab838a2a113285a863a"
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
