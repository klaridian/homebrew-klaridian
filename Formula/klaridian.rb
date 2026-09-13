# Homebrew formula for klaridian — TEMPLATE.
#
# This is the source of truth for the formula that lives in the tap repo
# `klaridian/homebrew-klaridian` (Formula/klaridian.rb). It downloads
# the PREBUILT binary from the GitHub Release — it does NOT `depends_on "node"`
# and does NOT build from source. That keeps `brew install` a zero-Node,
# instant install (the Speakeasy model, ARCHITECTURE.md §64).
#
# The url/sha256 per platform are filled in per release by
# packaging/homebrew/render-formula.sh from the release's binary assets.
# The 0.2.0 / __SHA_*__ placeholders below are substituted there.
class Klaridian < Formula
  desc "Generate MCP servers from an OpenAPI spec — native binary, no Node required"
  homepage "https://klaridian.dev"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/klaridian/klaridian/releases/download/v0.2.0/klaridian-darwin-arm64"
      sha256 "18d063915ca06b7cde5edd58897d26ce882992f5db72601366af68893f93a0c4"
    end
    on_intel do
      url "https://github.com/klaridian/klaridian/releases/download/v0.2.0/klaridian-darwin-x64"
      sha256 "433ad95c2bd3aa8c237c6958a8b9de5b1755baa7d19d0100da84c396f7a80d31"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/klaridian/klaridian/releases/download/v0.2.0/klaridian-linux-arm64"
      sha256 "21cb19e48efb983ce9361f3a75e213e5a5752e2d5b31d4ffc44f37ff47a56838"
    end
    on_intel do
      url "https://github.com/klaridian/klaridian/releases/download/v0.2.0/klaridian-linux-x64"
      sha256 "0f75d108e7090ee87bb1f9c63e951abb474f8f49ccecb9784c532262e394b96a"
    end
  end

  def install
    # The downloaded asset is the bare binary; install it as `klaridian`.
    bin.install Dir["*"].first => "klaridian"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/klaridian --version")
  end
end
