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
# The 0.4.0 / __SHA_*__ placeholders below are substituted there.
class Klaridian < Formula
  desc "Generate MCP servers from an OpenAPI spec — native binary, no Node required"
  homepage "https://klaridian.dev"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/klaridian/klaridian/releases/download/v0.4.0/klaridian-darwin-arm64"
      sha256 "777975f5161a6f813da6ed0bfeff998f94a88cfe7193d60a02139f28440f9906"
    end
    on_intel do
      url "https://github.com/klaridian/klaridian/releases/download/v0.4.0/klaridian-darwin-x64"
      sha256 "000f6a1fd177c0072d1ddc6881cb6e7961169017ce8ee41db2ff34df6c21b378"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/klaridian/klaridian/releases/download/v0.4.0/klaridian-linux-arm64"
      sha256 "79f78eeeea6a884f4651cc1d28dd3fdf0f03deb1bfebfbbbe4e89ca20ddf3a38"
    end
    on_intel do
      url "https://github.com/klaridian/klaridian/releases/download/v0.4.0/klaridian-linux-x64"
      sha256 "3e0aea89d62de6e4fff9cac20cc25c72d70e3c8db1eaafd0c10d7634400b1d69"
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
