#!/usr/bin/env bash

###
# Dye font
#
# @expamle
# echo -n "$tty_green 绿色文本"
# echo "${tty_reset} 恢复颜色"
### 
if [[ -t 1 ]]; then
  tty_escape() { printf "\x1b[%sm" $1; }
else
  tty_escape() { :; }
fi
tty_universal() { tty_escape "0;$1"; }   # normal
tty_mkbold() { tty_escape "1;$1"; }      # highlight
tty_underline="$(tty_escape "4;39")"     # underline
tty_blue="$(tty_universal 34)"           # blue
tty_red="$(tty_universal 31)"            # red
tty_green="$(tty_universal 32)"          # green
tty_yellow="$(tty_universal 33)"         # yellow
tty_bold="$(tty_universal 39)"           # bold
tty_cyan="$(tty_universal 36)"           # cyan
tty_reset="$(tty_escape 0)"              # reset color

###
# Dye background
#
# @expamle
# echo -n "$tty_bg_green 绿色背景红色字"
# echo "${tty_reset} 恢复颜色"
###
tty_bg_blue="$(tty_universal 44)"        # blue 
tty_bg_red="$(tty_universal 41)"         # red 
tty_bg_green="$(tty_universal 42)"       # green 
tty_bg_yellow="$(tty_universal 43)"      # yellow 
tty_bg_cyan="$(tty_universal 46)"        # cyan 


# select which your shields are reply to the query: 
reply_to_query() {
    echo " ";
    echo "[1] version,download,license"
    echo " "
    echo "Enter default to [1]\n"

    # Input the number of the shields you want to use:
    read -p "$tty_bg_cyan""Choose the labels$tty_reset " labels
    read -p "$tty_bg_cyan""Input your package name$tty_reset " package_name

    
    style="flat"
    registry="https://www.npmjs.com/package"

    # Return the default value if the input is empty
    version_label="[![version](https://img.shields.io/npm/v/$package_name.svg?style=$style&color=39AEA9)]($registry/$package_name)"
    download_able="[![download](https://img.shields.io/npm/dm/$package_name.svg?style=$style&color=F68989)]($registry/$package_name)"
    license_label="[![license](https://img.shields.io/npm/l/$package_name.svg?style=$style&color=5B7DB1)]($registry/$package_name)"
    travis_label=""
    gratipay_label=""
    coveralls_label=""


    echo "
$version_label
$download_able
$license_label
    "
}
reply_to_query