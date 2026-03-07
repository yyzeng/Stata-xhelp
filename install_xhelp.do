* 安装xhelp命令
forvalues i = 1/76{
	net install xhelp`i', from("dictionary") replace  //dictionary 改为你下载的后的xhelp文件夹的位置
}
