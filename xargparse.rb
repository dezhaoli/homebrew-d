# This is an auto-generated file. DO NOT EDIT 

class Xargparse < Formula
    desc "Parser for command-line options, arguments and sub-commands"
    homepage "https://github.com/dezhaoli/xargparse"
    version "v4.1.4"

    url "https://github.com/dezhaoli/xargparse/archive/v4.1.4.tar.gz"

    if OS.mac?
      sha256 "2e631e5129b48f9689bf1a9be96addf5d0c4eae71e86dcd5013f36caa360c8b7"
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
