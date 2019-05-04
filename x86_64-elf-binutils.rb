require 'formula'

class X8664ElfBinutils < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftp.gnu.org/gnu/binutils/binutils-2.32.tar.gz'
  sha256 '9b0d97b3d30df184d302bced12f976aa1e5fbf4b0be696cdebc6cca30411a46e'

  depends_on 'gcc' => :build
  def install
    ENV['CC'] = '/usr/local/opt/gcc/bin/gcc-8'
    ENV['CXX'] = '/usr/local/opt/gcc/bin/g++-8'
    ENV['CPP'] = '/usr/local/opt/gcc/bin/cpp-8'
    ENV['LD'] = '/usr/local/opt/gcc/bin/gcc-8'

    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=x86_64-elf','--disable-werror',
                             '--enable-gold=yes',
                             "--prefix=#{prefix}"
      system 'make all'
      system 'make install'
    end
  end
end
