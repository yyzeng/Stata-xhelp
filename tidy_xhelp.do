// 1. 创建文件夹
capture {
	mkdir xhelp/plus

	mkdir xhelp/plus/_

	forvalues i = 0/9 { // 0-9
		mkdir xhelp/plus/`i'
	}

	forvalues i = 97/122 { // a-z
		mkdir xhelp/plus/`=char(`i')'
	}
}

// 3. 遍历 xhelp 文件夹，将文件根据其首字母拷贝至相应子文件夹
local fs: dir xhelp files *, respectcase

foreach file of local fs {
	if strpos("`file'", "xhelp") != 1 & "`file'" != "stata.toc" {
	    local first = substr("`file'", 1, 1)
		quietly copy xhelp/`file' xhelp/plus/`first'/`file', replace
		quietly rm xhelp/`file'
	}
	else if strpos("`file'", ".pkg") > 6 { // erase "xhelp#.pkg"
		quietly rm xhelp/`file'
	}
}

// 4. zip plus/ -> xhelp_sthlps.zip
cd xhelp
quietly zipfile plus, saving(xhelp_sthlps.zip, replace)
// 手工删除 xhelp/plus/ 文件夹

// 5. 进入版本控制
//    5.1 编辑 xhelp.pkg
//    5.2 编辑 stata.toc
//    5.3 编辑 xhelp.ado，增加 install 功能
//    5.4 编辑 xhelp.sthlp 和 xhelp_zh.sthlp

