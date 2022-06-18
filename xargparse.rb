# This is an auto-generated file. DO NOT EDIT
class Xargparse < Formula
    desc "Parser for command-line options, arguments and sub-commands"
    homepage "https://github.com/dezhaoli/xargparse"
    version "2.1.1"

    url "https://github.com/dezhaoli/xargparse/archive/2.1.1.tar.gz"

    if OS.mac?
      sha256 "b98d2bfcb194f5b4c0ad5ca01697c23141e65fe4e9ea3f7c78a6bdde24849b25"
    end


    license "Apache-2.0"
    head "https://github.com/dezhaoli/xargparse.git", branch: "main"

    depends_on "bash"
    depends_on "coreutils"

    def install
      bin.install "xargparse" => "xargparse"
      bin.install "xcomplete" => "xcomplete"
      bash_completion.install_symlink bin/"xcomplete"
    end


    def caveats
      <<~EOS
        Add the following line to your ~/.bash_profile:
          [[ -r "#{bin}/xcomplete" ]] && . "#{bin}/xcomplete"
      EOS
    end
    

    test do
      assert_match(/^usage: xargparse/, shell_output("#{bin}/xargparse").strip)
    end
end
