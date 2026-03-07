
# Stata-xhelp

🚀 **xhelp 为 Stata 命令提供中文帮助文档。用户可以通过 `xhelp` 命令直接查看翻译后的 Stata 帮助文件。**

本项目从 Stata 的 base 目录中收集 `.sthlp` 帮助文档，并通过调用 **大语言模型 API** 进行批量翻译。

翻译完成后，所有文档被打包为 Stata 扩展命令 **`xhelp`**。用户只需按以下步骤说明即可完成 `xhelp` 命令安装，
并将预翻译的帮助文档放入 Stata 的系统文件夹 `PLUS` 中，从而在 Stata 环境中直接调用。

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

## 3️⃣ 安装 xhelp 命令及其预打包的翻译版帮助文档

1. 安装 `xhelp` 命令：

 ```stata
 net from "xhelp 文件夹的路径"
 net install xhelp.pkg  // 也可点击相应链接进行安装
 ```
   
2. 安装预打包的翻译版帮助文档

 ```stata
 net get xhelp.pkg
 xhelp, install
 ```

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
