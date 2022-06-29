#!/bin/sh
###########################################################
# @Author: dezhaoli@tencent.com
# @Date:   
# Please contact dezhaoli if you have any questions.
###########################################################

set -e -x

if [ "$#" -lt 2 ]; then
  echo "Usage: ./update.sh <xargparse> VERSION"
  exit 1
fi

CLI_NAME="$1"
VERSION="$2"

#https://github.com/dezhaoli/homebrew-d.git

if [ "${CLI_NAME}" = "xargparse" ]; then
  URL_BASE="https://github.com/dezhaoli/xargparse"
  CLASSNAME="xargparse"
  DESC="Parser for command-line options, arguments and sub-commands"

  CAVEATS="Add the following line to your ~/.bash_profile:
          [[ -r \"#{bin}/xcomplete\" ]] && . \"#{bin}/xcomplete\""
  EX_INSTALL="
      bin.install \"xcomplete\" => \"xcomplete\"
      bash_completion.install_symlink bin/\"xcomplete\"
      "


elif [ "${CLI_NAME}" = "d" ]; then
  URL_BASE="https://github.com/dezhaoli/d"
  CLASSNAME="d"
  DESC="X toolkit"

  CAVEATS=""
  
  EX_INSTALL="
      bin.install \"xbkapi\" => \"xbkapi\"
      bin.install \"xcatch-build-err\" => \"xcatch-build-err\"
      bin.install \"xformat\" => \"xformat\"
      bin.install \"xgcloud\" => \"xgcloud\"
      bin.install \"gcloud_form_file.py\" => \"gcloud_form_file.py\"
      bin.install \"gcloud_api_v1.py\" => \"gcloud_api_v1.py\"
      bin.install \"gcloud_api_v2.py\" => \"gcloud_api_v2.py\"
      bin.install \"gcloud_openapi.py\" => \"gcloud_openapi.py\"
      bin.install \"xlink\" => \"xlink\"  
      bin.install \"xpair\" => \"xpair\"
      bin.install \"xparallel\" => \"xparallel\"
      bin.install \"xrecord\" => \"xrecord\"
      bin.install \"xrobot\" => \"xrobot\"
      bin.install \"xsvn\" => \"xsvn\"
      bin.install \"xxcodebuild\" => \"xxcodebuild\"
      "
else
  echo "Unsupported binary: ${CLI_NAME}"
  exit 1
fi

# OSX
OSX_BINPATH="/tmp/${CLI_NAME}"
curl -L -o ${OSX_BINPATH} -s "${URL_BASE}/archive/${VERSION}.tar.gz"
OSX_SHA256=$(shasum -a 256 "${OSX_BINPATH}" | awk '{print $1}')


TEMPLATE="# This is an auto-generated file. DO NOT EDIT
class $(tr 'a-z' 'A-Z' <<< ${CLASSNAME:0:1})${CLASSNAME:1} < Formula
    desc \"${DESC}\"
    homepage \"https://github.com/dezhaoli/${CLI_NAME}\"
    version \"${VERSION}\"

    url \"${URL_BASE}/archive/${VERSION}.tar.gz\"

    if OS.mac?
      sha256 \"${OSX_SHA256}\"
    end


    license \"Apache-2.0\"
    head \"${URL_BASE}.git\", branch: \"main\"

    depends_on \"bash\"
    depends_on \"coreutils\"

    def install
      bin.install \"${CLI_NAME}\" => \"${CLI_NAME}\"
      ${EX_INSTALL}
    end


    def caveats
      <<~EOS
        ${CAVEATS}
      EOS
    end
    

    test do
      assert_match(/^usage: ${CLI_NAME}/, shell_output(\"#{bin}/${CLI_NAME}\").strip)
    end
end"

echo "${TEMPLATE}" > "$(dirname "$0")/${CLI_NAME}.rb"


