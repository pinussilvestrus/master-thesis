%% Class ttthesis %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This template is inspired by Roland Bless %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClass[12pt,titlepage,oneside]{book}

%% Options of this Class
\DeclareOption{draft}{\let\@draft\@empty}
\DeclareOption{dbse}{\let\@dbse\@empty}
\DeclareOption{german}{\let\@german\@empty}
\DeclareOption{print}{\let\@print\@empty}
\DeclareOption{final}{\let\@final\@empty}
\newif\if@usepdf \@usepdffalse % not pdf ready
\ProcessOptions

%% New Commands for Options
\newcommand{\ifnotdraft}[1]{\ifx\@draft\@undefined #1 \fi}
\newcommand{\ifnotdraftelse}[2]{\ifx\@draft\@undefined #1 \else #2 \fi}
\newcommand{\ifdraft}[1]{\ifx\@draft\@undefined  \else #1 \fi}
\newcommand{\ifgerman}[2]{\ifx\@german\@undefined #2 \else #1 \fi}
\newcommand{\ifdbse}[2]{\ifx\@dbse\@undefined #2 \else #1 \fi}
\newcommand{\ifprint}[2]{\ifx\@print\@undefined #2 \else #1 \fi}
\newcommand{\iffinal}[2]{\ifx\@final\@undefined #2 \else #1 \fi}

%% Package Declarations
\usepackage[T1]{fontenc}      % T1-encoded fonts: auch Wörter mit Umlauten trennen
\usepackage[utf8]{inputenc} % Eingabe nach ISO 8859-1
\usepackage[final]{graphicx}  % um Graphiken einzubinden
\usepackage{makeidx}          % wir wollen auch einen Index
\usepackage{fancyhdr}         % definiere einfache Headings
\usepackage{subfigure}
\usepackage{xcolor}           % colored text
\usepackage{booktabs}         % lines in tables: \toprule, \midrule, \bottomrule
\usepackage{amssymb,amsthm}   % mathematical symbols and environments
\usepackage[cmex10]{amsmath}
\usepackage{soul}
\usepackage{enumerate}        % specialized enumerations
\usepackage{multicol}         % text in multiple columns
\usepackage{csquotes}         % citations based on the language set for babel
\usepackage[subfigure]{tocloft} % listoffigures additions
\usepackage{enumitem} % itemize additions
\usepackage[figuresleft]{rotating} % rotating tables (sidewaystable)
\usepackage{tabularx}%dynamic tables

%% List of figures and tables
\renewcommand{\cftfigpresnum}{Abbildung }
\renewcommand{\cfttabpresnum}{Tabelle }

\renewcommand{\cftfigaftersnum}{:}
\renewcommand{\cfttabaftersnum}{:}

\setlength{\cftfignumwidth}{3.2cm}
\setlength{\cfttabnumwidth}{3cm}

\setlength{\cftfigindent}{0cm}
\setlength{\cfttabindent}{0cm}


%% Pagesize and Pageborder
\usepackage{geometry}
  \ifgerman{\geometry{a4paper}}{\geometry{letterpaper}}
  \geometry{left=30mm,right=30mm,top=30mm,bottom=25mm,head=14.5pt}

%% Paragraph Style
\parindent 0cm                     % Absatzanfang wird nicht eingerückt
\parskip1.5ex plus0.5ex minus0.5ex % Abstand zwischen zwei Absätzen

%% Numbering of Sections
\setcounter{secnumdepth}{2} % Numerierung auch für \subsubsection
\setcounter{tocdepth}{2}    % nimm auch \subsubsections ins Inhaltsverz. auf

%% Schusterjungen und Hurenkinder verhindern: siehe deutsches TeX-FAQ (6.1.3)
\clubpenalty = 10000
\widowpenalty = 10000
\displaywidowpenalty = 10000

% Labels for \vref
\usepackage{varioref}
\ifgerman{
	\labelformat{page}{Seite~#1}
	\labelformat{chapter}{Kapitel~#1}
	\labelformat{section}{Abschnitt~#1}
	\labelformat{subsection}{Abschnitt~#1}
	\labelformat{subsubsection}{Abschnitt~#1}
	\labelformat{equation}{Formel~#1}
	\labelformat{figure}{Abbildung~#1}
	\labelformat{table}{Tabelle~#1}
}{
	\labelformat{page}{Page~#1}
	\labelformat{chapter}{Chapter~#1}
	\labelformat{section}{Section~#1}
	\labelformat{subsection}{Section~#1}
	\labelformat{subsubsection}{Section~#1}
	\labelformat{equation}{Equation~#1}
	\labelformat{figure}{Figure~#1}
	\labelformat{table}{Table~#1}
}

%% PDF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifx\pdftexversion\@undefined % kein PDFTeX aktiv
\else
\@usepdftrue % switch automatically to PDF mode
\fi


\usepackage{nohyperref}

\newif\if@usehyperref
\ifx\href\@undefined % Wenn kein hyperref Paket geladen
\@usehyperreffalse % hyperref used
\else
\@usehyperreftrue % hyperref used
\fi

% use urls
\def\url#1{\expandafter\string\csname #1\endcsname}

%% Citations
\usepackage[notocbib]{apacite}		  % w departmend citation style
\ifgerman{
	\usepackage[ngerman]{babel}
	\usepackage{ngerman}
	\usepackage{bibgerm}        % German symbols in BibTeX
}{
	\usepackage[english]{babel}
}

\let\oldcite\cite \def\cite{\renewcommand{\BOthers}[1]{u. a.\hbox{}} \oldcite }
\let\oldciteA\citeA \def\citeA{\renewcommand{\BOthers}[1]{u. a.} \oldciteA }
	
%\renewcommand{\BOthers}[1]{u. a.\hbox{}}%       et al -> u. a.
%\renewcommand{\BOthersPeriod}[1]{u. a.\hbox{}}%  et al. -> u. a.

% Das float-Paket muss NACH hyperref eingebunden werden,
% sonst klappt die PDF-Ausgabe nicht:
\usepackage{float} %z.B. \floatstyle{ruled}

%% Glossaries and Acronyms
\usepackage[nopostdot,nonumberlist,numberedsection,toc]{glossaries} % list of acronyms
  \setlength{\glsdescwidth}{0.8\textwidth} % for longer acronym descriptions
  %\glossarystyle{super}

%% Headings %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\headfont}{\fontfamily{ppl}\selectfont}
%\newcommand{\headfont}{\sffamily}
%\newcommand{\headfont}{\slshape}
\newcommand{\captionfont}{}
\newcommand{\chapterheadfont}{}

\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter.\ #1}{}}
\fancyhf{} % clear all header and footer fields
\fancyhead[C]{{\headfont\thepage}} % left/right header for even/odd pages
%\fancyhead[R]{\headfont\nouppercase{\rightmark}} % header for left side (odd)
%\fancyhead[RE]{\headfont\nouppercase{\leftmark}} % right header for even pages
\renewcommand{\headrulewidth}{0pt} % head rule
\renewcommand{\footrulewidth}{0pt} % foot rule
% plainstyle
\fancypagestyle{plain}{%
	\fancyhf{} % clear all header and footer fields
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
	\chead{\headfont\thepage}
}

\renewcommand{\chaptername}{}

\renewcommand{\section}{%
\@startsection{section}%
{1}% Gliederungsebene
{0mm}% Einzug
{1ex plus 1ex minus 1.2ex}% Vorabstand
{0.5ex plus 0.5ex minus 0.5ex}% Nachabstand
{\chapterheadfont\Large\bfseries}% Stil
}
\renewcommand{\subsection}{%
\@startsection{subsection}%
{2}%
{0mm}%
{1ex plus 1ex minus 1ex}%
{0.2ex plus 0.2ex minus 0.2ex}%
{\chapterheadfont\large\bfseries}%
}
\renewcommand{\subsubsection}{%
\@startsection{subsubsection}%
{3}%
{0mm}%
{1ex plus 1ex minus 1ex}%
{0.2ex plus 0.2ex minus 0.2ex}%
{\chapterheadfont\normalsize\bfseries}%
}
\renewcommand{\paragraph}{%
\@startsection{paragraph}%
{4}%
{0mm}%
{2ex plus 1ex minus 2ex}%
{0.2ex plus 0.2ex minus 0.2ex}%
{\chapterheadfont\normalsize\bfseries}%
}

\newlength{\chapnolen}
\newlength{\chapparlen}
\newsavebox{\chapno}
%% Kein ``Kapitel'' bei Kapitelüberschrift
% \renewcommand{\@chapapp}{} allein reicht nicht!
%% \chapter{...}
\renewcommand{\@makechapterhead}[1]{%
  %\vspace*{0.2\textheight}%
  %\hrule
  \vskip 15\p@
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \savebox{\chapno}{\chapterheadfont\huge\bfseries \thechapter.}
        \settowidth{\chapnolen}{\usebox{\chapno}}
        \parbox[t]{\chapnolen}{\usebox{\chapno}}\nobreak\leavevmode
%        \par\nobreak
%        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@MM
    \setlength{\chapparlen}{\textwidth}
    \addtolength{\chapparlen}{-1.0\chapnolen}
    \addtolength{\chapparlen}{-2ex}
    \leavevmode\nobreak
    \parbox[t]{\chapparlen}{\raggedright\chapterheadfont\huge \bfseries #1\par\nobreak}
    %\the\textwidth
    %\the\chapparlen
    %\the\chapnolen
    %\vskip 20\p@
    %\rule{\textwidth}{1pt}
    %\vskip 40\p@
  }}

%% \chapter*{...}
\renewcommand{\@makeschapterhead}[1]{%
  \vspace*{40\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \chapterheadfont \huge \bfseries  #1\par\nobreak
    %\vskip 40\p@
  }%
}

%% Table of Contents %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\let\oldtableofcontents\tableofcontents
%\renewcommand{\tableofcontents}{{\pdfbookmark{\contentsname}{\contentsname}\chapterheadfont\oldtableofcontents}}
\let\@olddottedtocline\@dottedtocline
\renewcommand{\@dottedtocline}[5]{\@olddottedtocline{#1}{#2}{#3}{#4}{\chapterheadfont #5}}

%% pagestyle fuer Titelseite:
\def\titlehead#1{\def\@titlehead{#1}}
\def\titlefoot#1{\def\@titlefoot{#1}}
\def\@titlehead{}
\def\@titlefoot{}

\def\ps@title{%
\headheight 15mm
\footskip   0cm
\addtolength{\textheight}{-15mm}
\let\@mkboth\@gobbletwo%
  \def\@oddhead{\vbox{\hbox to\textwidth{\@titlehead}
                \vskip 1.5mm
                \hbox to\textwidth{\hrulefill}}}
  \def\@oddfoot{\vbox{\vskip -1mm\hbox to\textwidth{\hrulefill}\vskip 1mm
                \hbox to\textwidth{\@titlefoot}}}
  \let\@evenhead\@oddhead
  \let\@evenfoot\@oddfoot
}

\renewenvironment{titlepage}
{%
  \let\oldheadheight\headheight
  \let\oldfootskip\footskip
  \let\oldtextheight\textheight
  
   \cleardoublepage
   \if@twocolumn
      \@restonecoltrue\onecolumn
   \else
      \@restonecolfalse\newpage
    \fi
    \thispagestyle{title}%
    \setcounter{page}\@ne
}%
{\if@restonecol\twocolumn \else \newpage \fi
 \if@twoside\else
    \setcounter{page}\@ne
 \fi
 \let\headheight\oldheadheight
 \let\textheight\oldtextheight
 \let\footskip\oldfootskip
}

%% Bibliography %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\bibname}{\ifgerman{Literaturverzeichnis}{Bibliography}}

% extends bibliography by a list of the pages where the publication is cited
%\backrefgerman % for german theses
%\renewcommand*{\backref}[1]{
	% default interface
	% #1: backref list
	%
	% We want to use the alternative interface,
	% therefore the definition is empty here.
%}
%\renewcommand*{\backrefalt}[4]{
	% alternative interface
	% #1: number of distinct back references
	% #2: backref list with distinct entries
	% #3: number of back references including duplicates
	% #4: backref list including duplicates
%	\ifgerman{
	%	\footnotesize\color{gray}(zitiert auf Seite~#2)
	%}{
	%	\footnotesize\color{gray}(cited on Page~#2)
	%}
%}

\setlength\bibitemsep{1.1\itemsep}

%% Style of Index Page %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewenvironment{theindex}
{\if@twocolumn
   \@restonecolfalse
 \else
   \@restonecoltrue
 \fi
 \columnseprule \z@
 \columnsep 35\p@
 \twocolumn[\@makeschapterhead{\indexname}]%
 \@mkboth{\indexname}%
         {\indexname}%
 \addcontentsline{toc}{chapter}{\indexname}%
 \thispagestyle{fancy}
 \flushbottom
 \parindent\z@
 \parskip\z@ \@plus .3\p@\relax
 \let\item\@idxitem
 \def\,{\relax\ifmmode\mskip\thinmuskip
              \else\hskip0.2em\ignorespaces\fi}%
 \raggedright}

%% End of Class %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%