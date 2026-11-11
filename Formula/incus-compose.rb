class IncusCompose < Formula
  desc "Drop-in replacement for docker compose that runs your compose.yaml on Incus"
  homepage "https://incus-compose.org"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lxc/incus-compose/releases/download/v1.4.0/incus-compose_1.4.0_darwin_arm64.tar.gz"
      sha256 "628b212a7c968ebad7717ec9882d8de01bbbe5d9d0a086d764d47fee49c4ad11"
    end
    on_intel do
      url "https://github.com/lxc/incus-compose/releases/download/v1.4.0/incus-compose_1.4.0_darwin_amd64.tar.gz"
      sha256 "d0101bdd778180a8b1d1022847c871159b48eeb2639daa1f4895c6001ea965b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lxc/incus-compose/releases/download/v1.4.0/incus-compose_1.4.0_linux_arm64.tar.gz"
      sha256 "1ff983f4d6bf47677d451bcf97bbef4339fdc727fd5e864784cde7580d34fe96"
    end
    on_intel do
      url "https://github.com/lxc/incus-compose/releases/download/v1.4.0/incus-compose_1.4.0_linux_amd64.tar.gz"
      sha256 "3dbb65a4f9d8bde671248311f1c78309f582fb8fa81436795895a55c2f7a9a18"
    end
  end

  def install
    bin.install "incus-compose"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/incus-compose version")
  end
end
