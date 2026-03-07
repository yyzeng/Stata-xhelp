
# Stata-xhelp

🚀 **xhelp 为 Stata 命令提供中文帮助文档。用户可以通过 `xhelp` 命令直接查看翻译后的 Stata 帮助文件。**

本项目从 Stata 的 base 目录中收集 `.sthlp` 帮助文档，并通过调用 **大语言模型 API** 进行批量翻译。

翻译完成后，所有文档被打包为 Stata 扩展命令 **`xhelp`**。用户只需运行提供的 `do` 文件即可完成安装，并将其放入 Stata 的 `PLUS` 文件夹中，从而在 Stata 环境中直接调用。

---

# ✨ 功能特点

- 🗂 **批量翻译**  
  提供大量 Stata 命令的中文帮助文档，方便中文用户查阅。

- 📖 **简单调用**  
  使用 `xhelp` 命令即可快速查看对应命令的中文帮助说明。

- 🔗 **兼容 Stata 原生帮助系统**  
  调用方式与 Stata 原生 `help` 命令类似，易于集成到现有工作流程中。

---

# 📦 使用说明

## 1️⃣ 下载 xhelp

🎯 **从 GitHub 下载并解压**

1. 点击页面右上角 **`Code`**
2. 选择 **`Download ZIP`**
3. 下载完成后解压文件
4. 将解压得到的 `xhelp/` 文件夹放置到合适的位置

---

## 2️⃣ 设置 Stata PLUS 目录

在 Stata 中运行以下命令查看系统目录：

```stata
sysdir     // 显示 Stata 系统文件夹列表（也可使用 adopath 命令）
```

如有需要，可以修改 `PLUS` 目录的位置：

```stata
sysdir set PLUS "DIRECTORY"
```

---

## 3️⃣ 安装 xhelp

1. 使用 Stata 打开下载文件中的 **安装 do 文件**（文件名为 `install_xhelp.do`）。该文件的内容如下：

 ```stata
 forvalues i = 1/76{
     net install xhelp`i', from("dictionary") replace  //dictionary 改为你下载后的 xhelp 文件夹的位置
 }
 ```
   
2. 修改 do 文件中的 `dictionary` 路径（上面代码中 `from()` 内的路径）为本地 `xhelp` 文件夹的地址
3. 运行该 do 文件完成安装

说明：

- `dictionary`：指向下载后 **xhelp 文件夹的路径**
- `replace` 选项：用于覆盖已有安装（如不需要可删除）

---

## 4️⃣ 使用 xhelp 命令

安装完成后，即可在 Stata 中使用 `xhelp` 查看中文帮助文档：

```stata
xhelp
```

示例：

```stata
help reg     // Stata 原生命令：查看 reg 的官方英文帮助
xhelp reg    // xhelp 功能：查看 reg 的中文帮助文档
```
