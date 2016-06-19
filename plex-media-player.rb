class PlexMediaPlayer < Formula
  desc "Next generation Plex Desktop/Embedded Client"
  homepage "https://github.com/plexinc/plex-media-player"
  url "https://github.com/plexinc/plex-media-player/archive/v1.1.2.359-2b757d45.tar.gz"
  version "1.1.2"
  sha256 "50ff99b6aba446659063ccf15b2cd18354ea818d521b1db5b620e7a381f5804a"
  head "https://github.com/plexinc/plex-media-player.git"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "qt5"
  depends_on "mpv" #?? how to do --with-shared --HEAD

  def install
    args = %W[
      .
      -GNinja
      -DCMAKE_INSTALL_PREFIX=#{prefix}
      -DCMAKE_BUILD_TYPE=Debug
      -DQTROOT=/usr/local/opt/qt5
      -DMPV_INCLUDE_DIR=/usr/local/include/mpv
      -DMPV_LIBRARY=/usr/local/lib/libmpv.dylib
    ]
    system "mkdir build ; cd build"
    system "cmake", *args
    system "ninja"
    system "ninja", "install"

  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test plex-media-player`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end

end
