\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{commsummary}[2025/12/30 Communication Theory Summary Class]

% 基于 article 类，默认双栏，10pt字号
\LoadClass[twocolumn, 10pt]{article}

% --- 基础宏包 ---
\RequirePackage[left=1.5cm, right=1.5cm, bottom=1.5cm, top=2.2cm, headheight=15pt, columnsep=0.8cm]{geometry}
\RequirePackage{amsmath, amssymb, amsthm, bm} 
\RequirePackage{graphicx}
\RequirePackage{cancel}

% --- 绘图支持 ---
\RequirePackage{tikz}

\usetikzlibrary{
    arrows.meta, positioning, calc, patterns, tikzmark, shadows, % 原有库
    shapes.geometric, fit, backgrounds                           % 新增库
}

\RequirePackage{pgfplots}
\pgfplotsset{compat=1.17}

\RequirePackage[table]{xcolor}
\RequirePackage{enumitem} 
\RequirePackage{hyperref} 

% --- 中文支持 ---
\RequirePackage[heading=true]{ctex}

% --- 漂亮的盒子 (TColorBox) ---
\RequirePackage[most]{tcolorbox}
\tcbuselibrary{skins} 

% --- 颜色定义 ---
\definecolor{mainblue}{RGB}{0, 102, 204}
\definecolor{subbg}{RGB}{240, 245, 250}
\definecolor{alertred}{RGB}{204, 0, 0}
\definecolor{examplebg}{RGB}{255, 245, 245}

% [新增] 直观理解盒子的颜色
\definecolor{intuitiongreen}{RGB}{0, 128, 128} % 蓝绿色
\definecolor{intuitionbg}{RGB}{240, 255, 250}  % 极淡的绿色背景

% 其他颜色
\definecolor{boxbg}{RGB}{225, 245, 255} 
\definecolor{procblue}{RGB}{0, 102, 204}
\definecolor{textred}{RGB}{180, 0, 0}
\definecolor{textgreen}{RGB}{0, 100, 0}

% --- 自定义命令 ---
\newcommand{\pptpage}[1]{\hfill {\scriptsize\sffamily\color{gray} (P#1)}}

% [新增] 定义 Sa 函数算子
\DeclareMathOperator{\Sa}{Sa}

% [可选] 如果你也用 sinc，可以顺便定义一下
\DeclareMathOperator{\sinc}{sinc}


% --- 核心环境：知识点盒子 (Blue Box) ---
% [修改说明] 改为接受2个参数：[1]是可选配置，#2是标题
% 这样可以在使用时通过 [breakable=false] 覆盖默认设置
\newtcolorbox{kbox}[2][]{
    breakable, enhanced,
    colframe=mainblue, colback=white, coltitle=white,
    fonttitle=\bfseries\sffamily, title={#2},
    arc=3pt, boxrule=1pt,
    left=2pt, right=2pt, top=2pt, bottom=2pt,
    toptitle=2pt, bottomtitle=2pt,
    drop shadow, after skip=10pt,
    #1 % 这一行允许传入额外参数
}

% --- 环境：例题盒子 (Red Box) ---
\newtcolorbox{examplebox}[1]{
    breakable, enhanced,
    colframe=alertred, colback=examplebg, coltitle=white,
    fonttitle=\bfseries\sffamily, title={#1},
    arc=3pt, boxrule=1pt,
    left=2pt, right=2pt, top=2pt, bottom=2pt,
    toptitle=2pt, bottomtitle=2pt,
    drop shadow, after skip=10pt
}

% [新增] 环境：直观理解盒子 (Green Box) ---
\newtcolorbox{intuitionbox}[1]{
    breakable, enhanced,
    colframe=intuitiongreen, colback=intuitionbg, coltitle=white,
    fonttitle=\bfseries\sffamily, title={#1},
    arc=3pt, boxrule=1pt,
    left=2pt, right=2pt, top=2pt, bottom=2pt,
    toptitle=2pt, bottomtitle=2pt,
    drop shadow, after skip=10pt,
}

% --- 列表与章节设置 ---
\setlist[enumerate]{label=\arabic*., leftmargin=*, itemsep=0pt, parsep=2pt, topsep=0pt}
\setlist[itemize]{label=$\bullet$, leftmargin=*, itemsep=0pt, parsep=2pt, topsep=0pt}

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