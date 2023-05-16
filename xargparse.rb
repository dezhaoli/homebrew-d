# This is an auto-generated file. DO NOT EDIT 

class Xargparse < Formula
    desc "Parser for command-line options, arguments and sub-commands"
    homepage "https://github.com/dezhaoli/xargparse"
    version "3.0.1"

    url "https://github.com/dezhaoli/xargparse/archive/3.0.1.tar.gz"

    if OS.mac?
      sha256 "09d06aa33edf76642e9ae947d29ed6577e77b1d4709f09ce5755f7b3eb44218c"
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
      assert_match(/^xargparse /, shell_output("#{bin}/xargparse").strip)
    end


end
