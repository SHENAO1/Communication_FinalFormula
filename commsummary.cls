\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{commsummary}[2025/12/24 Communication Theory Summary Class]

% 基于 article 类，默认双栏，10pt字号以容纳更多内容
\LoadClass[twocolumn, 10pt]{article}

% --- 基础宏包 ---
\RequirePackage[left=1.5cm, right=1.5cm, bottom=1.5cm, top=2.2cm, headheight=15pt, columnsep=0.8cm]{geometry}
\RequirePackage{amsmath, amssymb, amsthm, bm} % 数学公式
\RequirePackage{graphicx}

% --- 绘图支持 ---
\RequirePackage{tikz}
\usetikzlibrary{arrows.meta} % 支持更多的箭头样式
\RequirePackage{pgfplots}    % <--- 【新增】引入 pgfplots 绘图宏包
\pgfplotsset{compat=1.17}    % <--- 【新增】设置 pgfplots 兼容性版本

\RequirePackage{xcolor}
\RequirePackage{enumitem} % 列表定制
\RequirePackage{hyperref} % 超链接

% --- 中文支持 ---
\RequirePackage[heading=true]{ctex}

% --- 漂亮的盒子 (TColorBox) ---
\RequirePackage[most]{tcolorbox}
\tcbuselibrary{skins} 

% 定义颜色
\definecolor{mainblue}{RGB}{0, 102, 204}
\definecolor{subbg}{RGB}{240, 245, 250}
\definecolor{alertred}{RGB}{204, 0, 0}
\definecolor{examplebg}{RGB}{255, 245, 245} % 例题的淡红色背景

% --- 自定义命令：PPT页码标记 ---
\newcommand{\pptpage}[1]{%
    \hfill {\scriptsize\sffamily\color{gray} (P#1)}%
}

% --- 核心环境：知识点盒子 (Blue Box) ---
\newtcolorbox{kbox}[1]{
    breakable,            % 允许跨栏/跨页
    enhanced,             % 启用增强绘图引擎
    colframe=mainblue,    % 边框颜色
    colback=white,        % 背景颜色
    coltitle=white,       % 标题文字颜色
    fonttitle=\bfseries\sffamily,
    title={#1},           % 标题
    arc=3pt,              % 圆角
    boxrule=1pt,          % 边框宽度
    left=2pt, right=2pt, top=2pt, bottom=2pt, % 内部边距
    toptitle=2pt, bottomtitle=2pt,
    drop shadow,          
    after skip=10pt       % 盒子之后的间距
}

% --- 新增环境：例题盒子 (Red Box) ---
\newtcolorbox{examplebox}[1]{
    breakable,
    enhanced,
    colframe=alertred,      % 红色边框
    colback=examplebg,      % 淡红色背景
    coltitle=white,
    fonttitle=\bfseries\sffamily,
    title={#1},
    arc=3pt,
    boxrule=1pt,
    left=2pt, right=2pt, top=2pt, bottom=2pt,
    toptitle=2pt, bottomtitle=2pt,
    drop shadow,
    after skip=10pt
}

% --- 紧凑的列表样式 ---
\setlist[enumerate]{label=\arabic*., leftmargin=*, itemsep=0pt, parsep=2pt, topsep=0pt}
\setlist[itemize]{label=$\bullet$, leftmargin=*, itemsep=0pt, parsep=2pt, topsep=0pt}

% --- 章节标题美化 ---
\ctexset{
    section = {
        format += \color{mainblue}\raggedright,
        name = {第,章},
        number = \chinese{section},
        aftername = \hspace{0.5em}
    }
}

% --- 页眉页脚 ---
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\small 通信原理速查笔记}
\fancyhead[R]{\small \leftmark}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}