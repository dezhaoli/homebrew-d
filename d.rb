# This is an auto-generated file. DO NOT EDIT 

require "formula"
require_relative "lib/private_strategy"
class D < Formula
    desc "X toolkit"
    homepage "https://github.com/dezhaoli/d"
    version "v3.1.5"

    url "https://github.com/dezhaoli/d/archive/v3.1.5.tar.gz", :using => GitHubPrivateRepositoryDownloadStrategy

    if OS.mac?
      sha256 "9c4defe762b8b1a5a2c8f20ca2dd33d72667717f4ab69a686b92ad021e8369da"
    end


    license "Apache-2.0"
    head "https://github.com/dezhaoli/d.git", branch: "main"

    depends_on "bash"
    depends_on "coreutils"

    def install
      bin.install "d" => "d"
      
      bin.install "gcloud_form_file.py" => "gcloud_form_file.py"
      bin.install "gcloud_api_v1.py" => "gcloud_api_v1.py"
      bin.install "gcloud_api_v2.py" => "gcloud_api_v2.py"
      bin.install "gcloud_openapi.py" => "gcloud_openapi.py"

      bin.install "xbkapi" => "xbkapi"
      bin.install "xcatch-build-err" => "xcatch-build-err"
      bin.install "xformat" => "xformat"
      bin.install "xgcloud" => "xgcloud"
      bin.install "xlink" => "xlink"  
      bin.install "xnifs" => "xnifs"  
      bin.install "xpair" => "xpair"
      bin.install "xparallel" => "xparallel"
      bin.install "xrecord" => "xrecord"
      bin.install "xrobot" => "xrobot"
      bin.install "xsvn" => "xsvn"
      bin.install "xwsl-ex" => "xwsl-ex"
      bin.install "xxcodebuild" => "xxcodebuild"

    end


    def caveats
      <<~EOS
        
      EOS
    end
    
    
    test do
      assert_match(/^d /, shell_output("#{bin}/d").strip)
    end


end
