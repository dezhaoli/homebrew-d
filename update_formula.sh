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
  URL_BASE="https://github.com/dezhaoli/xargparse/archive/"
  CLASSNAME="xargparse"
  DESC="Parser for command-line options, arguments and sub-commands"
else
  echo "Unsupported binary: ${CLI_NAME}"
  exit 1
fi

# OSX
OSX_BINPATH="/tmp/${CLI_NAME}"
curl -L -o ${OSX_BINPATH} -s "${URL_BASE}/${VERSION}.tar.gz"
OSX_SHA256=$(shasum -a 256 "${OSX_BINPATH}" | awk '{print $1}')


TEMPLATE="# This is an auto-generated file. DO NOT EDIT
class $(tr 'a-z' 'A-Z' <<< ${CLASSNAME:0:1})${CLASSNAME:1} < Formula
    desc \"${DESC}\"
    homepage \"https://github.com/dezhaoli/${CLI_NAME}\"
    version \"${VERSION}\"

    if OS.mac?
      sha256 \"${OSX_SHA256}\"
    end

    baseurl = \"${URL_BASE}\"
    @@bin_name = \"${VERSION}.tar.gz\"
    url baseurl + @@bin_name

    license \"Apache-2.0\"

    def install
      bin.install \"${CLI_NAME}\" => \"${CLI_NAME}\"
    end

    test do
      assert_match(/^usage: ${CLI_NAME}/, shell_output(\"#{bin}/${CLI_NAME}\").strip)
    end
end"

echo "${TEMPLATE}" > "$(dirname "$0")/${CLI_NAME}.rb"


