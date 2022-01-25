\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{jste-ist}
  [2022/01/25 Yoshiki Sato]

\LoadClass[a4j, twocolumn, 10.5ptj, uplatex, dvipdfmx]{jsarticle}

\usepackage[uplatex,jis2004]{otf}

% 古いコマンドやパッケージを警告
% nag - Detecting and warning about obsolete LaTeX commands
% http://www.ctan.org/tex-archive/macros/latex/contrib/nag
\RequirePackage[l2tabu, orthodox]{nag}

% amsmath が提供しない数式環境を使用した場合に警告
% onlyamsmath
% http://www.ctan.org/tex-archive/macros/latex/contrib/onlyamsmath
\usepackage[all, warning]{onlyamsmath}

% コメントアウト
\usepackage{comment}

% 行間スペース調整
\usepackage{setspace}

% 日本語のしおり文字化け対策
\ifx\kanjiskip\undefined\else
  \usepackage{atbegshi}
  \ifx\ucs\undefined
	\ifnum 42146=\euc"A4A2
	  \AtBeginShipoutFirst{\special{pdf:tounicode EUC-UCS2}}
	\else
	  \AtBeginShipoutFirst{\special{pdf:tounicode 90ms-RKSJ-UCS2}}
	\fi
  \else
	\AtBeginShipoutFirst{\special{pdf:tounicode UTF8-UCS2}}
  \fi
	\usepackage[dvipdfmx,colorlinks=false]{hyperref}
\fi

\usepackage[top=30truemm,bottom=30truemm,left=30truemm,right=30truemm]{geometry}

\setlength{\fullwidth}{42.53zw}     % 紙面横幅を42.53zw（20.2zw + 2.13zw + 20.2zw)
\setlength{\textwidth}{\fullwidth}
\setlength{\columnsep}{2.13zw}

% 行送り= フォントサイズ  * 1.15
% 9pt
%\renewcommand\small{\@setfontsize\normalsize{9.034}{10.3891}}
\renewcommand\small{\@setfontsize\normalsize{9.034}{13.551}}
% 10pt
\renewcommand\normalsize{\@setfontsize\normalsize{10.038}{11.5437}}
% 10.5pt
\renewcommand\large{\@setfontsize\large{10.539}{12.11985}}
% 11pt
\renewcommand\Large{\@setfontsize\Large{11.041}{12.69715}}
% 12pt
\renewcommand\LARGE{\@setfontsize\LARGE{12.045}{13.85175}}
% 14pt
\renewcommand\huge{\@setfontsize\huge{14.053}{16.16095}}
% 16pt
\renewcommand\Huge{\@setfontsize\huge{16.060}{18.469}}

\let\@etitle\@empty
\newcommand{\etitle}[1]{\gdef\@etitle{#1}}
\let\@subtitle\@empty
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\let\@esubtitle\@empty
\newcommand{\esubtitle}[1]{\gdef\@esubtitle{#1}}

\let\@abstract\@empty
\renewcommand{\abstract}[1]{\gdef\@abstract{#1}}
\let\@keyword\@empty
\newcommand{\keyword}[1]{\gdef\@keyword{#1}}

\let\@author\@empty
\renewcommand{\author}[1]{\gdef\@author{#1}}
\let\@eauthor\@empty
\newcommand{\eauthor}[1]{\gdef\@eauthor{#1}}

\let\@affiliation\@empty
\newcommand{\affiliation}[1]{\gdef\@affiliation{#1}}
\let\@eaffiliation\@empty
\newcommand{\eaffiliation}[1]{\gdef\@eaffiliation{#1}}

\let\@email\@empty
\newcommand{\email}[1]{\gdef\@email{#1}}

\def\@maketitle{%
	\newpage\null
	\begin{minipage}[c]{46zw}
		\let\footnote\thanks
		\begin{center}
		\hspace{-3zw}{\huge\textbf{\@title} \par}%
		%{\Large\@etitle\par}%

		\if\relax\@subtitle\relax%
			\else
			{\huge\textbf{\@subtitle}\par}%
			\if\relax\@esubtitle\relax%
				\else
				{\normalsize-\hspace{2mm}\@esubtitle\hspace{2mm}-\par}%
			\fi%
			\vspace{12pt}
		\fi%
		\end{center}

		\begin{center}
		\hspace{-4zw}
		{\LARGE\gt{\@author}\par}%
		\vspace{-1pt}
		\end{center}
		%{\normalsize\@eauthor\par}%
		%\vspace{5pt}
		%{\Large\gt{\@affiliation}\par}%
		%{\normalsize\@eaffiliation\par}%
		%{\Large\gt{\@email}\par}%

		\vspace{8pt}

		%\hspace{1zw}
		%\begin{tabularx}{42zw}{X}

		%\begin{spacing}{0.9}
		%\hspace{1zw}{\small\@abstract\par}
		%\end{spacing}

		%\end{tabularx}

		%\vspace{-20pt}
	\end{minipage}
}

\renewcommand{\section}{%
	\@startsection{section}{1}{\z@}%
	%{0.9\Cvs}% 前アキ
	{0.4\Cvs}% 前アキ
	{0.1\Cvs}% 後アキ
	{\normalfont\large\headfont\raggedright}}

\renewcommand{\subsection}{%
	\@startsection{subsection}{1}{\z@}%
	%{0.9\Cvs}% 前アキ
	{0.4\Cvs}% 前アキ
	{0.1\Cvs}% 後アキ
	{\normalfont\normalsize\headfont\raggedright}}

\renewcommand{\subsubsection}{%
	\@startsection{subsubsection}{1}{\z@}%
	%{0.9\Cvs}% 前アキ
	{0.4\Cvs}% 前アキ
	{0.1\Cvs}% 後アキ
	{\normalfont\normalsize\headfont\raggedright}}

\usepackage{secdot}
\sectiondot{subsection}
\sectiondot{subsubsection}

\renewcommand\refname{\centerline{参考文献}\global\def\refname{参考文献}}
