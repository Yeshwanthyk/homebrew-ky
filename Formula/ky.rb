# Written by ky's release workflow (scripts/release/formula.sh in Yeshwanthyk/ky-durable); edits here are replaced.
class Ky < Formula
  desc "Your own durable agent on your Cloudflare account"
  homepage "https://github.com/Yeshwanthyk/ky-durable"
  version "0.2.3"

  on_macos do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.3/ky-darwin-arm64.tar.gz"
      sha256 "8aecff10ea1395b524ba3c9090848f7b0cd58bc4b9032d7f69bc76490b803919"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.3/ky-darwin-x64.tar.gz"
      sha256 "f7d21befb8a97475b82db19e16ebaab76808189cd7c2d95cb6fc2a8d6e5909e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.3/ky-linux-arm64.tar.gz"
      sha256 "66106225615ac190cdbb70dfe01b8fad4aee266d0acd95bf660f825317ad840a"
    end
    on_intel do
      url "https://github.com/Yeshwanthyk/ky-durable/releases/download/v0.2.3/ky-linux-x64.tar.gz"
      sha256 "d3dff8cd2925567eab5f03e04776d79453402614daf20f7b4469422e3ff8c868"
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
