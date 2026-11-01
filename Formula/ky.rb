# Written by ky's release workflow (scripts/release/formula.sh in Yeshwanthyk/ky-durable); edits here are replaced.
class Ky < Formula
  desc "Your own durable agent on your Cloudflare account"
  homepage "https://github.com/Yeshwanthyk/ky-durable"
  version "0.2.14"

  on_macos do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.14/ky-darwin-arm64.tar.gz"
      sha256 "33e36c6386216ef6d9d70d15d1b01e45894fd3d24f16194def9d3b1bb3940f22"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.14/ky-darwin-x64.tar.gz"
      sha256 "9bd292a2bf704a9e2fbf03635a93565354dd33a0ffe391cce08a5d8905ddda5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.14/ky-linux-arm64.tar.gz"
      sha256 "aa517238cc9357a3bca309c2ec74c0dbeebf0ce39b0905a084d5a4169ee9e81c"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.14/ky-linux-x64.tar.gz"
      sha256 "4396bbb62079ed2b64e282bcdfb29fcf9d60fc43fd6d3bd6c903ab3db46b3f43"
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
