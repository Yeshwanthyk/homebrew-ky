# Written by ky's release workflow (scripts/release/formula.sh in Yeshwanthyk/ky-durable); edits here are replaced.
class Ky < Formula
  desc "Your own durable agent on your Cloudflare account"
  homepage "https://github.com/Yeshwanthyk/ky-durable"
  version "0.2.2"

  on_macos do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.2/ky-darwin-arm64.tar.gz"
      sha256 "eed0b1606a5338c5f5fe6d6c05cc970da767e1fb21ee2df31432b20f378cd3b5"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.2/ky-darwin-x64.tar.gz"
      sha256 "650feb60fb75ea6087ba738a9bff142403f0e1593497013da0c3d701fada3204"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.2/ky-linux-arm64.tar.gz"
      sha256 "ceabd0a4f1c5676a636b0754953fe01ab5446409022f089b560ced5c74cad95d"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.2/ky-linux-x64.tar.gz"
      sha256 "9fd11a2bc1fe48398038466571b11983bd35a92929bf8f844e736619eee64511"
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
