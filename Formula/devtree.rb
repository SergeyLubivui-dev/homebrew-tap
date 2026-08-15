class Devtree < Formula
  desc "Tree-shaped development planning that lives inside your repository"
  homepage "https://github.com/SergeyLubivui-dev/devtree"
  version "0.5.0"
  license "MIT"

  # The released binaries, not a build from source: devtree has no dependencies
  # and cross-compiles in CI, so there is nothing for a build here to add
  # except a Go toolchain on every machine that installs it.
  on_macos do
    on_arm do
      url "https://github.com/SergeyLubivui-dev/devtree/releases/download/v0.5.0/devtree_v0.5.0_darwin_arm64"
      sha256 "796ef0a8710ff0af3661f7c526fb1388bf79be59c037e60df1a1ab8e5b6894c8"
    end
    on_intel do
      url "https://github.com/SergeyLubivui-dev/devtree/releases/download/v0.5.0/devtree_v0.5.0_darwin_amd64"
      sha256 "15081732f0982e82d18f23d51befadee54f7a7304f3ab6af63541e3442f5b44d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/SergeyLubivui-dev/devtree/releases/download/v0.5.0/devtree_v0.5.0_linux_arm64"
      sha256 "890a800b3754465fda57f49f5f8e66af2cb7e86e9b5ce3d15ce7b5dcc4551deb"
    end
    on_intel do
      url "https://github.com/SergeyLubivui-dev/devtree/releases/download/v0.5.0/devtree_v0.5.0_linux_amd64"
      sha256 "462c15d0d66ccb1e76f589d5f70f45932d4cf4f89884fb682a6c58aba6b1aafd"
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
