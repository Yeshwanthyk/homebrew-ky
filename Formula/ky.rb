# Written by ky's release workflow (scripts/release/formula.sh in Yeshwanthyk/ky-durable); edits here are replaced.
class Ky < Formula
  desc "Your own durable agent on your Cloudflare account"
  homepage "https://github.com/Yeshwanthyk/ky-durable"
  version "0.2.9"

  on_macos do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.9/ky-darwin-arm64.tar.gz"
      sha256 "4b3ca9ac009c14933294b22ebe2736bbe47cd07a6771bd4ae6c8b04f004be57f"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.9/ky-darwin-x64.tar.gz"
      sha256 "938c7204e8e1528596298538128a848945a69c4d64cb66c98a51a6ccb616398b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.9/ky-linux-arm64.tar.gz"
      sha256 "9b7b5157921ad8aefda5111b42c3512d14c2b9098a3d8c5a37a2ae3138b87f41"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.9/ky-linux-x64.tar.gz"
      sha256 "99f221e07eb244c45da481b78281e8dbe5cb4f321f0ff91dcbc4d560d09198b9"
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
