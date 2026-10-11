# Written by ky's release workflow (scripts/release/formula.sh in Yeshwanthyk/ky-durable); edits here are replaced.
class Ky < Formula
  desc "Your own durable agent on your Cloudflare account"
  homepage "https://github.com/Yeshwanthyk/ky-durable"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.1.1/ky-darwin-arm64.tar.gz"
      sha256 "510eb749d9cd60a700694ac38c742ae82d501c524ff5ece33bb68109aa31721d"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.1.1/ky-darwin-x64.tar.gz"
      sha256 "b6ace07d621ba2c00df700ca90f5397e9074614fcccdd26df7bedd5d29f61eed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.1.1/ky-linux-arm64.tar.gz"
      sha256 "9ebde39d54da5c94b5e42e768b75cf6f22e6227118729d93a8d725f093d3311d"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.1.1/ky-linux-x64.tar.gz"
      sha256 "74cf865b40d136dfa5e79559a62bdf57e84a324cbdbbf89e7c95bf8782d04d8b"
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
