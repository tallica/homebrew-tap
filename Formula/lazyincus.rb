class Lazyincus < Formula
  desc "Terminal UI for Incus, in the style of lazydocker"
  homepage "https://github.com/tallica/lazyincus"
  url "https://github.com/tallica/lazyincus/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "85305c5b02cd8c7df4804151f8670003569ce4a41b01d851973854c0bc4bd768"
  license "MIT"
  head "https://github.com/tallica/lazyincus.git", branch: "master"

  depends_on "go" => :build

  def install
    # The Makefile's own `git describe` versioning only works with a real
    # .git checkout (HEAD builds); tarball installs have no VCS metadata,
    # so pin VERSION explicitly to the formula's release version for those.
    args = build.head? ? [] : ["VERSION=#{version}"]
    system "make", "build", *args
    bin.install "lazyincus"
  end

  test do
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/lazyincus --version"))
  end
end
