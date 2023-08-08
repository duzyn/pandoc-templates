---
title: Pandoc 模板
author: David Peng
date: 2023-08-08
---

<!-- markdownlint-disable MD025 -->

# Pandoc 模板

自用的一些 Pandoc 模板

## 使用方法

在 Windows 上，克隆本仓库到 `%APPDATA%\pandoc` 路径下：

    git clone https://ghproxy.com/https://github.com/duzyn/pandoc-templates \
    "%APPDATA%\pandoc"

在 Linux 或 macOS 上，克隆本仓库到 `~/.local/share/pandoc` 路径下：

    git clone https://ghproxy.com/https://github.com/duzyn/pandoc-templates \
    ~/.local/share/pandoc

或者克隆到任意路径后，在 Windows 上时运行 `.\mklink_pandoc_data_dir.bat`，在 Linux 或 macOS 上，运行 `.\ln_pandoc_data_dir.sh`

## 参考

- [github-markdown-css](https://github.com/sindresorhus/github-markdown-css)
- [Tufte CSS](https://edwardtufte.github.io/tufte-css/)
- [RStudio Tufte Handout](https://rstudio.github.io/tufte/)
- [R Markdown Tufte Style](https://rstudio.github.io/tufte/cn/)
- [RStudio Pandoc template: tufte-handout.tex](https://raw.githubusercontent.com/rstudio/tufte/master/inst/rmarkdown/templates/tufte_handout/resources/tufte-handout.tex)
- [Eisvogel LaTeX theme](https://github.com/Wandmalfarbe/pandoc-latex-template)
