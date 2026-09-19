class Lazyincus < Formula
  desc "Terminal UI for Incus, in the style of lazydocker"
  homepage "https://github.com/tallica/lazyincus"
  url "https://github.com/tallica/lazyincus/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "85305c5b02cd8c7df4804151f8670003569ce4a41b01d851973854c0bc4bd768"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.buildSource=homebrew
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lazyincus --version")
  end
end
