# This is an auto-generated file. DO NOT EDIT 

class Xargparse < Formula
    desc "Parser for command-line options, arguments and sub-commands"
    homepage "https://github.com/dezhaoli/xargparse"
    version "v3.1.2"

    url "https://github.com/dezhaoli/xargparse/archive/v3.1.2.tar.gz"

    if OS.mac?
      sha256 "2cbb6ebd106cfd7fbf898899063be2b7cd60bbee489fa9f25204dec5809af5d6"
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
