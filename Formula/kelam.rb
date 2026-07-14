# Kelam CLI — build and run voice AI agents from the terminal. https://kelam.sh
#
# Tap-style formula: the sdist named by `url` is installed into a private virtualenv,
# and pip resolves the dependencies (all pure-python or prebuilt wheels) from PyPI at
# install time. That keeps a version bump to two lines (url + sha256) — the release
# workflow in samsadsam/kelam rewrites them automatically on every tagged release.
class Kelam < Formula
  desc "Build and run voice AI agents from the terminal"
  homepage "https://kelam.sh"
  url "https://files.pythonhosted.org/packages/7d/56/3db4c7e9de78722ab811e8976b7f5a6e82f4d5c945f3f1f0aa07b6adef4f/kelam-0.22.1.tar.gz"
  sha256 "8c356f23c5bab99683fe347d57e0fef6c256c2b3b0533ef9f256d69cacb93ef6"

  depends_on "python@3.13"

  def install
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "venv", libexec
    system libexec/"bin/pip", "install", buildpath.to_s
    bin.install_symlink libexec/"bin/kelam"
  end

  test do
    assert_match "voice AI agents", shell_output("#{bin}/kelam --help")
  end
end
