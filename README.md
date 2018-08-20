# BaiduNetdiskPrivate-mac
百度网盘解除p2p限速，svip显示
## 使用办法
## 方法一 使用指令
把百度云路径/Applications/BaiduNetdisk_mac.app/Contents/MacOS/原来的BaiduNetdisk_mac 改名为BaiduNetdisk_mac_  
`建立一个txt`内容：
```
#!/bin/bash
Baidu_PATH="`dirname "${0}"`"
Baidu_BIN="`dirname "${0}"`"/BaiduNetdisk_mac_
 
export DYLD_FORCE_FLAT_NAMESPACE=1
export DYLD_INSERT_LIBRARIES="${Baidu_PATH}/libBDNetDiskHook.dylib"
"$Baidu_BIN"
```
这个文件改名为BaiduNetdisk_mac 使用chmod u+x 改为可执行
重新启动这个程序，就执行了hook过程
## 方法二
使用insert_dylib 把dylib注入到BaiduNetdisk_mac程序中
`推荐使用insert_dylib`

