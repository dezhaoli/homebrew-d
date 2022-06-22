# This is an auto-generated file. DO NOT EDIT
class D < Formula
    desc "X toolkit"
    homepage "https://github.com/dezhaoli/d"
    version "1.0.0"

    url "https://github.com/dezhaoli/d/archive/1.0.0.tar.gz"

    if OS.mac?
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end


    license "Apache-2.0"
    head "https://github.com/dezhaoli/d.git", branch: "main"

    depends_on "bash"
    depends_on "coreutils"

    def install
      
      bin.install "xformat" => "xformat"
      bin.install "xpair" => "xpair"
      bin.install "xxcodebuild" => "xxcodebuild"
      
    end


    def caveats
      <<~EOS
        
      EOS
    end
    

    test do
      assert_match(/^usage: d/, shell_output("#{bin}/d").strip)
    end
end
