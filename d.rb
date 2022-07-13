# This is an auto-generated file. DO NOT EDIT 

require "formula"
require_relative "lib/private_strategy"
class D < Formula
    desc "X toolkit"
    homepage "https://github.com/dezhaoli/d"
    version "2.1.2"

    url "https://github.com/dezhaoli/d/archive/2.1.2.tar.gz", :using => GitHubPrivateRepositoryArchiveDownloadStrategy

    if OS.mac?
      sha256 "fa41e16e1164fdf7668bde514ddf8eda12855b8c64a9053823ff41da5fca35fc"
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
    
    


end
