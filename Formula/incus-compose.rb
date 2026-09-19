class IncusCompose < Formula
  desc "Drop-in replacement for docker compose that runs your compose.yaml on Incus"
  homepage "https://incus-compose.org"
  version "1.3.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lxc/incus-compose/releases/download/v#{version}/incus-compose_#{version}_darwin_arm64.tar.gz"
      sha256 "ba2f521dda21a1294185bd17606d1fdf190e74f45c62b59e53affee82a4321e6"
    end
    on_intel do
      url "https://github.com/lxc/incus-compose/releases/download/v#{version}/incus-compose_#{version}_darwin_amd64.tar.gz"
      sha256 "4ef5af54c0e4fcff6ebc3d6e02ef0864b91b7581297269cbcab30cad750bcebf"
    end
  end

  def install
    bin.install "incus-compose"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/incus-compose version")
  end
end
