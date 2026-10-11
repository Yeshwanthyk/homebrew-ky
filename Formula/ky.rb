# Written by ky's release workflow (scripts/release/formula.sh in Yeshwanthyk/ky-durable); edits here are replaced.
class Ky < Formula
  desc "Your own durable agent on your Cloudflare account"
  homepage "https://github.com/Yeshwanthyk/ky-durable"
  version "0.2.4"

  on_macos do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.4/ky-darwin-arm64.tar.gz"
      sha256 "7cb1554c0fe769ee76bb280c9db02aba941d30a3e397eedb9439e61f5ad96747"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.4/ky-darwin-x64.tar.gz"
      sha256 "204a73cdbd5828f108457557ba0675163edaec2e29b198cc4c1d6374681da38e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.4/ky-linux-arm64.tar.gz"
      sha256 "37bd4f9cb1fc7c8525ee0d4f89ee04c0623a054f9195bb5704d80b6064797f51"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.4/ky-linux-x64.tar.gz"
      sha256 "f12b6cec0ff98470120b68aa65fd2f063bc68d9143de498d5d60d12b8be2309c"
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
