# Written by ky's release workflow (scripts/release/formula.sh in Yeshwanthyk/ky-durable); edits here are replaced.
class Ky < Formula
  desc "Your own durable agent on your Cloudflare account"
  homepage "https://github.com/Yeshwanthyk/ky-durable"
  version "0.2.11"

  on_macos do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.11/ky-darwin-arm64.tar.gz"
      sha256 "1c9bee2c0e55283a93311f02fed0e07deb0122d838143e11fa169da009e90ac8"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.11/ky-darwin-x64.tar.gz"
      sha256 "31066942dd0d99707282de8126c06bfffe13252feeef2357a345d0634ab92eab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.11/ky-linux-arm64.tar.gz"
      sha256 "e721119d9b63e916e88736db87c3a11015c7cf82a4d83ec3d856607a69bc757c"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.11/ky-linux-x64.tar.gz"
      sha256 "aed0f8c2c2a686f7dc3679f12366228d5473b27a339beb56de6b9822501c5d8e"
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
