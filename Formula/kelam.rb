# Kelam CLI — build and run voice AI agents from the terminal. https://kelam.sh
#
# Tap-style formula: the sdist named by `url` is installed into a private virtualenv,
# and pip resolves the dependencies (all pure-python or prebuilt wheels) from PyPI at
# install time. That keeps a version bump to two lines (url + sha256) — the release
# workflow in samsadsam/kelam rewrites them automatically on every tagged release.
class Kelam < Formula
  desc "Build and run voice AI agents from the terminal"
  homepage "https://kelam.sh"
  url "https://files.pythonhosted.org/packages/89/f7/826a979059c6e23ff04a3768d5dc6375cb5ee32b797d6763c60d2e4d0035/kelam-0.6.1.tar.gz"
  sha256 "3a628d8e3088db49c9f2785c87291191e4c3bb72bc7650d6a595e7b10840485d"

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
