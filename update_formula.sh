#!/bin/sh
###########################################################
# @Author: dezhaoli@tencent.com
# @Date:   
# Please contact dezhaoli if you have any questions.
###########################################################






function create()
{
    local is_private=${1:-false}
    local is_test=${2:-false}
    local token="$HOMEBREW_GITHUB_API_TOKEN"

    local name="$CLI_NAME"
    local version="$VERSION"
    local desction="$DESC"
    local caveats="$CAVEATS"
    local ex_install="$EX_INSTALL"

    local class_name=$name
    local base_url="https://github.com/dezhaoli/$name"

    # OSX
    local tmp_file="/tmp/${name}"
    rm -f ${tmp_file}


    if $is_private; then
        curl -H 'Authorization: token '$token  \
             -H 'Accept: application/vnd.github.v3.raw' \
             -L -o "${tmp_file}" -s "${base_url}/archive/${version}.tar.gz"
        local STRATEGY=', :using => GitHubPrivateRepositoryReleaseDownloadStrategy'
    else
        curl -L -o "${tmp_file}" -s "${base_url}/archive/${version}.tar.gz"
        local STRATEGY=
    fi
    if $is_test;then
        local TEST="
    test do
      assert_match(/^usage: ${name}/, shell_output(\"#{bin}/${name}\").strip)
    end"
    else
        local TEST=
    fi
    

    local osx_sha256=$(shasum -a 256 "${tmp_file}" | awk '{print $1}')


    TEMPLATE="# This is an auto-generated file. DO NOT EDIT
class $(tr 'a-z' 'A-Z' <<< ${class_name:0:1})${class_name:1} < Formula
    desc \"${desction}\"
    homepage \"https://github.com/dezhaoli/${name}\"
    version \"${version}\"

    url \"${base_url}/archive/${version}.tar.gz\"$STRATEGY

    if OS.mac?
      sha256 \"${osx_sha256}\"
    end


    license \"Apache-2.0\"
    head \"${base_url}.git\", branch: \"main\"

    depends_on \"bash\"
    depends_on \"coreutils\"

    def install
      bin.install \"${name}\" => \"${name}\"
      ${ex_install}
    end


    def caveats
      <<~EOS
        ${caveats}
      EOS
    end
    
    $TEST


end"

    echo "${TEMPLATE}" > "$(dirname "$0")/${name}.rb"
}



set -e -x

if (($#!=2)); then
  echo "Usage: [HOMEBREW_GITHUB_API_TOKEN] $(basename $0) <xargparse> <VERSION>"
  exit 1
fi

CLI_NAME="$1"
VERSION="$2"

#https://github.com/dezhaoli/homebrew-d.git

if [ "${CLI_NAME}" = "xargparse" ]; then
    DESC="Parser for command-line options, arguments and sub-commands"

    CAVEATS="Add the following line to your ~/.bash_profile:
          [[ -r \"#{bin}/xcomplete\" ]] && . \"#{bin}/xcomplete\""
    EX_INSTALL="
      bin.install \"xcomplete\" => \"xcomplete\"
      bash_completion.install_symlink bin/\"xcomplete\"
"
    create false true

elif [ "${CLI_NAME}" = "d" ]; then
    DESC="X toolkit"

    CAVEATS=""

    EX_INSTALL="
      bin.install \"gcloud_form_file.py\" => \"gcloud_form_file.py\"
      bin.install \"gcloud_api_v1.py\" => \"gcloud_api_v1.py\"
      bin.install \"gcloud_api_v2.py\" => \"gcloud_api_v2.py\"
      bin.install \"gcloud_openapi.py\" => \"gcloud_openapi.py\"

      bin.install \"xbkapi\" => \"xbkapi\"
      bin.install \"xcatch-build-err\" => \"xcatch-build-err\"
      bin.install \"xformat\" => \"xformat\"
      bin.install \"xgcloud\" => \"xgcloud\"
      bin.install \"xlink\" => \"xlink\"  
      bin.install \"xnifs\" => \"xnifs\"  
      bin.install \"xpair\" => \"xpair\"
      bin.install \"xparallel\" => \"xparallel\"
      bin.install \"xrecord\" => \"xrecord\"
      bin.install \"xrobot\" => \"xrobot\"
      bin.install \"xsvn\" => \"xsvn\"
      bin.install \"xwsl-ex\" => \"xwsl-ex\"
      bin.install \"xxcodebuild\" => \"xxcodebuild\"
"
    create true false
else
  echo "Unsupported binary: ${CLI_NAME}"
  exit 1
fi

