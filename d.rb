# This is an auto-generated file. DO NOT EDIT 

class D < Formula
    desc "X toolkit"
    homepage "https://github.com/dezhaoli/d"
    version "v4.1.0"

    url "https://github.com/dezhaoli/d/archive/v4.1.0.tar.gz"

    if OS.mac?
      sha256 "b3f06a5484f0574fe703a916aaebaa56a2a931d30e53026ac0afb6ca88634a26"
    end


    license "Apache-2.0"
    head "https://github.com/dezhaoli/d.git", branch: "main"

    depends_on "bash"
    depends_on "coreutils"

    def install
      
      bin.install "gcloud_api_v1.py" => "gcloud_api_v1.py"
      bin.install "gcloud_api_v2.py" => "gcloud_api_v2.py"
      bin.install "gcloud_form_file.py" => "gcloud_form_file.py"
      bin.install "gcloud_openapi.py" => "gcloud_openapi.py"

      bin.install "get-chrome-cookies-win.py" => "get-chrome-cookies-win.py"
      bin.install "get-chrome-cookies.py" => "get-chrome-cookies.py"

      bin.install "xbkapi" => "xbkapi"
      bin.install "xcatch-build-err" => "xcatch-build-err"
      bin.install "xchrome-cookies" => "xchrome-cookies"
      bin.install "xgcloud" => "xgcloud"
      bin.install "xlink" => "xlink"  
      bin.install "xpair" => "xpair"
      bin.install "xparallel" => "xparallel"
      bin.install "xpidcat" => "xpidcat"
      bin.install "xrecord" => "xrecord"
      bin.install "xrobot" => "xrobot"
      bin.install "xsvn" => "xsvn"
      bin.install "xunity" => "xunity"
      bin.install "xxcodebuild" => "xxcodebuild"
      bin.install "xzip" => "xzip"

    end


    def caveats
      <<~EOS
        
      EOS
    end
    
    
    test do
      assert_match(/^d /, shell_output("#{bin}/d").strip)
    end


end
