#!/bin/bash

app_name="BaiduNetdisk_mac"
shell_path="$(dirname "$0")"

dylib_name="libBDNetDiskHook.dylib"
app_bundle_path="/Applications/${app_name}.app/Contents/MacOS"
app_executable_path="${app_bundle_path}/${app_name}"
app_executable_backup_path="${app_executable_path}_backup"

# 备份原始可执行文件
if [ ! -f "$app_executable_backup_path" ]
then
cp "$app_executable_path" "$app_executable_backup_path"
result="y"
else
read -t 150 -p "已安装补丁包，是否覆盖？[y/n]:" result
fi

if [[ "$result" == 'y' ]]; then
    cp -r "${shell_path}/${dylib_name}" ${app_bundle_path}
    ${shell_path}/insert_dylib --all-yes "${app_bundle_path}/${dylib_name}" "$app_executable_backup_path" "$app_executable_path"
    echo -e "\n\tDone！"
fi


