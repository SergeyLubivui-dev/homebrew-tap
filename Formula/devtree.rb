class Devtree < Formula
  desc "Tree-shaped development planning that lives inside your repository"
  homepage "https://github.com/SergeyLubivui-dev/devtree"
  version "0.4.0"
  license "MIT"

  # The released binaries, not a build from source: devtree has no dependencies
  # and cross-compiles in CI, so there is nothing for a build here to add
  # except a Go toolchain on every machine that installs it.
  on_macos do
    on_arm do
      url "https://github.com/SergeyLubivui-dev/devtree/releases/download/v0.4.0/devtree_v0.4.0_darwin_arm64"
      sha256 "9df73027d9a1342f5ac128654254e940f79564a624fa7178856d9af5111b225c"
    end
    on_intel do
      url "https://github.com/SergeyLubivui-dev/devtree/releases/download/v0.4.0/devtree_v0.4.0_darwin_amd64"
      sha256 "39e09fd71bc587be91c8f7a5a42f4d3f43ae9026d569087995aab7a2d6f247f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/SergeyLubivui-dev/devtree/releases/download/v0.4.0/devtree_v0.4.0_linux_arm64"
      sha256 "5975b3f85db8770500d1e5e12e018246e93e6ea2759136ca807b88b3b2ef8fea"
    end
    on_intel do
      url "https://github.com/SergeyLubivui-dev/devtree/releases/download/v0.4.0/devtree_v0.4.0_linux_amd64"
      sha256 "56e6313b26ecada18969dbcfe799e50aa67872dcd05a7ca1c61bb3981b489cd5"
    end
  end

  def install
    # The download keeps the asset's name, which carries the version and the
    # platform. Only one of them is ever present.
    bin.install Dir["devtree_*"].first => "devtree"
  end

  test do
    assert_match "devtree #{version}", shell_output("#{bin}/devtree version")

    # A plan, a diagram, and a check: the whole loop, in a sandbox.
    system bin/"devtree", "init", "--project", "Formula test", "--empty", "--outputs", "TREE.md"
    system bin/"devtree", "add", "Works", "-s", "done"
    system bin/"devtree", "check", "--strict"
    assert_match "Works", (testpath/"TREE.md").read
  end
end
