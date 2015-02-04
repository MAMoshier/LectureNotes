\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecnotes}[2014/08/21 lecnotes package]

% Basics
\LoadClass[10pt,openany]{memoir}
\RequirePackage{etoolbox}
\RequirePackage{mathtools}
\RequirePackage[dvipsnames]{xcolor}


% set up for different media
\newtoggle{printformatting}
\newtoggle{ipadformatting}
\newtoggle{kindleformatting}

\togglefalse{printformatting}
\togglefalse{ipadformatting}
\togglefalse{kindleformatting}


\DeclareOption{print}{
	\toggletrue{printformatting}
	\def\Format{print}
	\PassOptionsToPackage{letterpaper,
		twoside %,
		%left=2cm,
		%top=1.5cm,
		%right=5cm,
		%bottom=2cm,
		%marginparwidth=4cm,
		%marginparsep=3mm
		}{geometry}
}
\DeclareOption{ipad}{
	\toggletrue{ipadformatting}
	\def\Format{ipad}
	\PassOptionsToPackage{paperwidth=9in,
		paperheight=6in,
		scale=0.9, centering,
		text={.9\paperwidth,.9\paperheight}, ratio=1:1,
		width=.9\paperwidth, vmargin=.05\paperheight, marginratio=1:1,
		hdivide={*,0.9\paperwidth,*}, vdivide={*,0.9\paperheight,*},
		margin={0.05\paperwidth,0.05\paperheight}
	} %	
		%left=3mm,% right=3mm,
		%top=1mm,
		%bottom=1mm,
		%right=3cm}
		{geometry}
}
\DeclareOption{kindle}{
	\toggletrue{kindleformatting}
	\def\Format{kindle}
	\PassOptionsToPackage{letterpaper,
		left=2cm,
		top=1.5cm,
		right=5cm,
		bottom=2cm,
		marginparwidth=4cm,
		marginparsep=3mm}{geometry}
}
\DeclareOption*{\PackageWarning{lecnotes}{Unknown ‘\CurrentOption’}}
\ExecuteOptions{print}
\ProcessOptions\relax

% Now set up page geometry
\RequirePackage{geometry}

% Author commands for fine tuning pagination for specific media
\newcommand{\printbreak}{\iftoggle{printformatting}{\newpage}{}}
\newcommand{\ipadbreak}{\iftoggle{ipadformatting}{\newpage}{}}
\newcommand{\kindlebreak}{\iftoggle{kindleformatting}{\newpage}{}}

%Type face settings. Could be customized to the medium option
\renewcommand{\rmdefault}{ppl} % rm
\linespread{1.05}        % Palatino needs more leading
\RequirePackage[scaled]{helvet} % ss
\RequirePackage{courier} % tt
\RequirePackage{euler} % math

%\normalfont
\RequirePackage[T1]{fontenc}
\RequirePackage{microtype} % Makes nice adjustments with no fuss

\RequirePackage{amssymb,amsmath,eucal,stmaryrd,bbold}

% Title page and meta data
\newcommand{\setTopic}[1]{\def\Topic{#1}}
\newcommand{\setAuthor}[1]{\def\Author{#1}}
\newcommand{\setDate}[1]{\def\Date{#1}}
\newcommand{\setCourse}[1]{\def\Course{#1}}
\newcommand{\setVersion}[1]{\def\Version{#1}}

\newlength{\drop}
\newcommand*{\notestitle}{
	\begingroup%
	\drop=0.1\textheight
	\fboxsep 0.5\baselineskip
	\sffamily
	{\centering
		{\Large \Course}\par
		\vspace{0.3\drop}
		{\Large Lecture Notes}\par
		\vspace{0.3\drop}
		{\Large on}\par
		\vspace{0.3\drop}
		{\Large \Topic}\par
		\vspace{0.9\drop}
		{\large \Author}\par
		\vspace{0.3\drop}
		{\Date}\par
		\vspace{1\drop}
	}
	\vfill
	{\small Version: \Version\ (\today) Format: \Format}
	\endgroup
}

\chapterstyle{lyhne}
\makeatletter
\renewcommand*{\beforepartskip}{\null\vskip4cm}
\renewcommand*{\afterpartskip}{\par\vfil%
	\@afterindentfalse\@afterheading}
\makeatother
\renewcommand{\chaptername}{Lecture}

\RequirePackage{listings}
\lstset{language=Python, mathescape=true,tabsize=4}

\RequirePackage{enumitem}
\RequirePackage{tikz}
\usetikzlibrary{shapes.symbols}
\RequirePackage{marginnote}
\RequirePackage{multicol}
\RequirePackage{stackrel}
\RequirePackage{hyperref}


\RequirePackage[framemethod=tikz]{mdframed}

\newcounter{factCnt}[chapter]

