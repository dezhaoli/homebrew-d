# This is an auto-generated file. DO NOT EDIT
class D < Formula
    desc "X toolkit"
    homepage "https://github.com/dezhaoli/d"
    version "2.1.1"

    url "https://github.com/dezhaoli/d/archive/2.1.1.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy

    if OS.mac?
      sha256 "7ee81922d0f1aee91605b54a1f334374c642d834edbb63c4ae6c00d7fb3e2cc6"
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
