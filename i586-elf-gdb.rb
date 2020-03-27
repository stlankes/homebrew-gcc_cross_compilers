require 'formula'

class I586ElfGdb < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftp.gnu.org/gnu/gdb/gdb-8.2.tar.xz'
  sha256 'c3a441a29c7c89720b734e5a9c6289c0a06be7e0c76ef538f7bbcef389347c39'

  depends_on 'i586-elf-binutils'
  depends_on 'i586-elf-gcc'

  def install
    ENV['CC'] = '/usr/local/opt/gcc\@8/bin/gcc-8'
    ENV['CXX'] = '/usr/local/opt/gcc\@8/bin/g++-8'
    ENV['CPP'] = '/usr/local/opt/gcc\@8/bin/cpp-8'
    ENV['LD'] = '/usr/local/opt/gcc\@8/bin/gcc-8'

    mkdir 'build' do
      system '../configure', '--target=i586-elf', "--prefix=#{prefix}", "--disable-werror"
      system 'make'
      system 'make install'
      FileUtils.rm_rf share/"locale"
    end
  end
end
