# Kelam CLI — build and run voice AI agents from the terminal. https://kelam.sh
#
# Tap-style formula: the sdist named by `url` is installed into a private virtualenv,
# and pip resolves the dependencies (all pure-python or prebuilt wheels) from PyPI at
# install time. That keeps a version bump to two lines (url + sha256) — the release
# workflow in samsadsam/kelam rewrites them automatically on every tagged release.
class Kelam < Formula
  desc "Build and run voice AI agents from the terminal"
  homepage "https://kelam.sh"
  url "https://files.pythonhosted.org/packages/7a/a0/a4f27823c14a667cf3e94f77f531233849a6b0f0597eb3dd376ff9d96a5b/kelam-0.20.1.tar.gz"
  sha256 "f2ea648a00532db9080288d4b76c9ab6173d80575ad20051db6d16509fbebd61"

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
