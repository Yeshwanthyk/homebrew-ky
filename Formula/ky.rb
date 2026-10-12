# Written by ky's release workflow (scripts/release/formula.sh in Yeshwanthyk/ky-durable); edits here are replaced.
class Ky < Formula
  desc "Your own durable agent on your Cloudflare account"
  homepage "https://github.com/Yeshwanthyk/ky-durable"
  version "0.2.6"

  on_macos do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.6/ky-darwin-arm64.tar.gz"
      sha256 "7f466102a1987360375d276b286e5a2b94d4c07c31f5be1e710b3819f770390d"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.6/ky-darwin-x64.tar.gz"
      sha256 "75ccd9e4c4031985823b5433b3b238cfb2f99ea430892f4bed0cd9afef51c4a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.6/ky-linux-arm64.tar.gz"
      sha256 "03bfffbdef4d680f59baed1b410d67c427d4b1b49cbbed1f3ce637613a30dee3"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.6/ky-linux-x64.tar.gz"
      sha256 "c251f45763b3d3f6e6de0d989db5d60fcd2746aa66cd9b58bb69a6c3e97e278d"
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
