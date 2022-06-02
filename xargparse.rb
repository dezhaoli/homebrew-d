# This is an auto-generated file. DO NOT EDIT
class Xargparse < Formula
    desc "Parser for command-line options, arguments and sub-commands"
    homepage "https://github.com/dezhaoli/xargparse"
    version "1.0.0"

    url "https://github.com/dezhaoli/xargparse/archive/1.0.0.tar.gz"

    if OS.mac?
      sha256 "5969ec0fe44e944cdeba112ca196380edcf4c28b7053a5e4eee4b3a6e4847ec1"
    end


    license "Apache-2.0"
    head "https://github.com/dezhaoli/xargparse.git", branch: "master"

    def install
      bin.install "xargparse" => "xargparse"
    end

    test do
      assert_match(/^usage: xargparse/, shell_output("#{bin}/xargparse").strip)
    end
end
