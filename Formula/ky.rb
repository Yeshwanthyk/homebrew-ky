# Written by ky's release workflow (scripts/release/formula.sh in Yeshwanthyk/ky-durable); edits here are replaced.
class Ky < Formula
  desc "Your own durable agent on your Cloudflare account"
  homepage "https://github.com/Yeshwanthyk/ky-durable"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.1/ky-darwin-arm64.tar.gz"
      sha256 "519ff9b62a4dbd9aef7c2a060a546fc6ef82357087afa6ddfdf7981f3e8a63b9"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.1/ky-darwin-x64.tar.gz"
      sha256 "4e5cfecf6fbce4a3ee982e6417cb42d0df71b13666e2774a7908a67fb3bff9c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.1/ky-linux-arm64.tar.gz"
      sha256 "2861b53b7bbe8a13307ded92db6a881729da4d6124b9c92996479c2f645a1a4e"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.1/ky-linux-x64.tar.gz"
      sha256 "fe6d86bf65fda1ff66cafa9557eac596e83b46d90779e3162e682f4b1de8a1f1"
    end
  end

  def install
    bin.install "ky"
  end

  def caveats
    <<~EOS
      Then run: ky init

      Another program can be named ky too. If `ky --version` doesn't say (ky-durable-cli),
      that one comes first on your PATH: run this one as #{opt_bin}/ky, or put
      #{HOMEBREW_PREFIX}/bin before its folder on your PATH.
    EOS
  end

  test do
    assert_match "ky #{version} (ky-durable-cli)", shell_output("#{bin}/ky --version")
  end
end
