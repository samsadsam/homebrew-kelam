# Kelam CLI — build and run voice AI agents from the terminal. https://kelam.sh
#
# Tap-style formula: the sdist named by `url` is installed into a private virtualenv,
# and pip resolves the dependencies (all pure-python or prebuilt wheels) from PyPI at
# install time. That keeps a version bump to two lines (url + sha256) — the release
# workflow in samsadsam/kelam rewrites them automatically on every tagged release.
class Kelam < Formula
  desc "Build and run voice AI agents from the terminal"
  homepage "https://kelam.sh"
  url "https://files.pythonhosted.org/packages/d9/91/2f527e6ac8cd76ad016fc52f56d85e44b5843bcdecfa3c0ac1c6abc50da4/kelam-0.29.0.tar.gz"
  sha256 "a38420a55325682da2ebac3aa0c9cbf6d67986c199e18e4e03b69cad03159cd5"

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
