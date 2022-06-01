# This is an auto-generated file. DO NOT EDIT
class D_xargparse < Formula
    desc "Parser for command-line options, arguments and sub-commands"
    homepage "https://github.com/dezhaoli/xargparse"
    version "1.0.0"

    if OS.mac?
      sha256 "5969ec0fe44e944cdeba112ca196380edcf4c28b7053a5e4eee4b3a6e4847ec1"
    end

    baseurl = "https://github.com/dezhaoli/xargparse/archive/"
    @@bin_name = "1.0.0.tar.gz"
    url baseurl + @@bin_name

    license "Apache-2.0"

    def install
      bin.install "xargparse" => "xargparse"
    end

    test do
      assert_match(/^usage: xargparse/, shell_output("#{bin}/xargparse").strip)
    end
end
