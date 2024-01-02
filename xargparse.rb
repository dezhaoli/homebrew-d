# This is an auto-generated file. DO NOT EDIT 

class Xargparse < Formula
    desc "Parser for command-line options, arguments and sub-commands"
    homepage "https://github.com/dezhaoli/xargparse"
    version "v4.1.3"

    url "https://github.com/dezhaoli/xargparse/archive/v4.1.3.tar.gz"

    if OS.mac?
      sha256 "45a409ae6999004821ae6c948b386b340eb7b001c1d13c9bd9f7fb49c67e1b3b"
    end


    license "Apache-2.0"
    head "https://github.com/dezhaoli/xargparse.git", branch: "main"

    depends_on "bash"
    depends_on "coreutils"

    def install
      
      bin.install "xargparse" => "xargparse"
      bin.install "xcomplete" => "xcomplete"
      bin.install "xformat" => "xformat"
      bin.install "xwsl-ex" => "xwsl-ex"
      bin.install "d" => "d"
      bash_completion.install_symlink bin/"xcomplete"

    end


    def caveats
      <<~EOS
        Add the following line to your ~/.bash_profile:
          #call xcomplete after bash_completion
          [[ -r "#{bin}/xcomplete" ]] && . "#{bin}/xcomplete"
      EOS
    end
    
    
    test do
      assert_match(/^xargparse /, shell_output("#{bin}/xargparse").strip)
    end


end
