class IncusCompose < Formula
  desc "Drop-in replacement for docker compose that runs your compose.yaml on Incus"
  homepage "https://incus-compose.org"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lxc/incus-compose/releases/download/v1.3.5/incus-compose_1.3.5_darwin_arm64.tar.gz"
      sha256 "906f0ce3449d35c3bfac210a018455d0dd9af0e450ac03395c622dbf5b386c54"
    end
    on_intel do
      url "https://github.com/lxc/incus-compose/releases/download/v1.3.5/incus-compose_1.3.5_darwin_amd64.tar.gz"
      sha256 "c2a9b2263188cfcb7fb90e6341ba3a806846f3d0e3309b46a17e22bf9b15728f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lxc/incus-compose/releases/download/v1.3.5/incus-compose_1.3.5_linux_arm64.tar.gz"
      sha256 "39e460804affe076f46df34c4434ee53cac167f9b836a15b5b52d7f8d6aede71"
    end
    on_intel do
      url "https://github.com/lxc/incus-compose/releases/download/v1.3.5/incus-compose_1.3.5_linux_amd64.tar.gz"
      sha256 "0ed925b152ec5cea08b72f2f2ffbaa167619103a9aefb2582285920d5931facb"
    end
  end

  def install
    bin.install "incus-compose"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/incus-compose version")
  end
end
