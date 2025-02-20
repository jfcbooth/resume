%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Freeman Curriculum Vitae
% Class File
% Version 3.0 (September 3, 2021)
%
% This class originates from:
% https://www.LaTeXTemplates.com
%
% Authors:
% Vel (vel@LaTeXTemplates.com)
% Alessandro Plasmati
%
% License:
% CC BY-NC-SA 4.0 (https://creativecommons.org/licenses/by-nc-sa/4.0/)
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{FreemanCV}[2021/09/03 Freeman CV Class v3.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % Pass through any extra options specified to the base class
\ProcessOptions\relax % Process class options

\LoadClass{article} % Load the base class

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES AND MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\usepackage{etoolbox} % Required for conditional logic and changing commands

\setlength{\parindent}{0pt} % Paragraph indentation

\usepackage{supertabular} % Required for the supertabular environment which allows tables to span multiple pages so sections with tables correctly wrap across pages

\usepackage{extsizes} % Allows using more default font sizes as a class option

\usepackage{graphicx}

\usepackage{wrapfig}

\usepackage{enumitem}

\usepackage[none]{hyphenat}
\hyphenpenalty=10000
\exhyphenpenalty=10000

%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------

\usepackage[
	a4paper, % Paper size
	top=1cm, % Top margin org 1.75cm
	bottom=.1cm, % Bottom margin org 1.75cm
	left=1.5cm, % Left margin
	right=1.5cm, % Right margin
	footskip=1cm, % Space from the bottom margin to the baseline of the footer
	headsep=0.5cm, % Space from the top margin to the baseline of the header
	headheight=1cm, % Height of the header
	%showframe % Uncomment to show frames around the margins for debugging purposes
]{geometry}

%----------------------------------------------------------------------------------------
%	COLUMN LAYOUT
%----------------------------------------------------------------------------------------

\usepackage{paracol} % Required for creating multi-column layouts that can span pages automatically

\AtBeginEnvironment{paracol}{\setlength{\parindent}{0pt}} % Paracols have default paragraph indentation and this overrides it to the template default of no indentation

\setlength\columnsep{0.05\textwidth} % Amount of horizontal space between the columns

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage{fontspec} % Required for specifying custom fonts under XeLaTeX

\defaultfontfeatures{Ligatures=TeX} % To support LaTeX ligatures (e.g. `` and --)
\defaultfontfeatures{Path=Fonts/} % Specify the location of font files

% The serif font used by default or explicitly with \textrm{}/\rmfamily
% \setmainfont{EBGaramond}[
% 	UprightFont=*-Regular.ttf,
% 	BoldFont=*-Bold.ttf,
% 	BoldItalicFont=*-BoldItalic.ttf,
% 	ItalicFont=*-Italic.ttf,
% 	SmallCapsFont=*-SC.ttf
% ]

\setmainfont{calibri}[
	UprightFont=*-regular.ttf,
	BoldFont=*-bold.ttf,
	BoldItalicFont=*-bold-italic.ttf,
	ItalicFont=*-italic.ttf,
]

% The sans serif font used explicitly with \textsf{}\sffamily
\setsansfont{LibertinusSans}[
	UprightFont=*-Regular.otf,
	BoldFont=*-Bold.otf,
	ItalicFont=*-Italic.otf
]

\newfontfamily{\cursivefont}{freebooterscript} % New font family for the cursive font Freebooter Script

\newfontfamily{\FA}{FontAwesome} % Create a new font family for FontAwesome icons
\input{Fonts/fontawesomesymbols-xeluatex.tex} % Load a file to create shortcuts to the icons, see icon examples and their shortcuts in fontawesome.pdf in the Fonts folder

%----------------------------------------------------------------------------------------
%	HEADERS & FOOTERS
%----------------------------------------------------------------------------------------

\usepackage{fancyhdr} % Required for customizing headers and footers
\pagestyle{fancy} % Enable custom headers and footers

\renewcommand{\headrulewidth}{0pt} % Remove the default rule under the header

\fancyhf{} % Clear default headers/footers by default, add headers and footers in the template file as per the example

%----------------------------------------------------------------------------------------
%	SECTIONS
%----------------------------------------------------------------------------------------

\usepackage[nobottomtitles*]{titlesec} % Required for modifying sections, the nobottomtitles* pushes section titles to the next page when they are close to the bottom of the page

\renewcommand{\bottomtitlespace}{0.05\textheight} % The minimal space required from the bottom margin so a section title isn't moved to the next page

\titleformat
	{\section} % Section type being modified
	[block] % Section layout type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\color{headings}\scshape\Large\raggedright} % Text formatting of the whole section, i.e. label and title
	{} % Section label (e.g. number) and its formatting
	{0pt} % Horizontal space between the section label and title
	{} % Code before the section title
	[\color{black}\titlerule] % Code after the section title

\titlespacing*{\section}{0pt}{0pt}{8pt} % Spacing around section titles, the order is: left, before and after

%------------------------------------------------

\titleformat
	{\subsection} % Section type being modified
	[block] % Section layout type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\bf} % Text formatting of the whole section, i.e. label and title
	{} % Section label (e.g. number) and its formatting
	{0pt} % Horizontal space between the section label and title
	{} % Code before the section title
	[] % Code after the section title

\titlespacing*{\subsection}{0pt}{8pt}{3pt} % Spacing around section titles, the order is: left, before and after

%----------------------------------------------------------------------------------------
%	COLORS
%----------------------------------------------------------------------------------------

\usepackage[usenames, svgnames]{xcolor} % Required for defining and using custom colors

\definecolor{text}{HTML}{2b2b2b} % Main document text color, off-black
\definecolor{headings}{HTML}{701112} % Dark red color for headings
\definecolor{shade}{HTML}{F5DD9D} % Peach color for the contact information box
\definecolor{linkcolor}{HTML}{0000EE} % 25% desaturated headings color for links

\color{text} % Set the default text color

%----------------------------------------------------------------------------------------
%	LINKS
%----------------------------------------------------------------------------------------

\usepackage[hidelinks]{hyperref} % Required for links

\hypersetup{
	colorlinks=false, % Whether to color the text of links
	urlcolor=linkcolor, % Color for \url and \href links
	linkcolor=linkcolor, % Color for \nameref links
}

%----------------------------------------------------------------------------------------
%	CUSTOM COMMANDS
%----------------------------------------------------------------------------------------

% Command for adding a new job entry (work experience)
\newcommand{\jobentry}[5]{
	{{\raggedright\large{\textbf{#4}}}} % Job title
	{}\textbf{|}{} % adds spacing
	{{\raggedright\large #3}} % Employer
	\hfill
	\vspace{-5pt}
	{\raggedleft\textsc{#1}} % Duration and conditional full time/part time text
	{\begin{itemize}[leftmargin=10pt]
		\itemsep-5pt
		#5
	\end{itemize}
	} % Description
	\medskip % Vertical whitespace
}

% Command for entering a new qualification (education)
\newcommand{\qualificationentry}[5]{
	\textsc{#1} & \textbf{#2}\\ % Duration and degree
	& {\small\textsc{#3}}\\ % Honors, achievements or distinctions (e.g. first class honors)
	& #4\\ % Department
	& \textit{#5}\\ % Institution
}

% Command for entering a separate table row -- used for any section that uses a two column table for alignment
\newcommand{\tableentry}[2]{
	\textsc{#1} & #2\\ % First the heading, then content, then a conditional insertion of whitespace if the third parameter has any content in it
}

% Command for entering a publication as a short DOI (digital object identifier) string to the publication, a link is automatically created
\newcommand{\doipublication}[4]{
	#1 & % Year
	\href{http://dx.doi.org/#2}{\expandafter\ifstrequal\expandafter{#3}{firstauthor}{\textbf{doi:#2}}{doi:#2}}% DOI string and if "firstauthor" is entered for the 3rd argument, this makes the DOI string bold indicating a first author publication
	\expandafter\ifstrequal\expandafter{#4}{}{\\}{\\[5pt]} % Conditional insertion of whitespace if the 4th parameter has any content in it
}

% 4 args: year, link, 
\newcommand{\publication}[4]{
	#1 & % Year
	\href{#2}{\expandafter\ifstrequal\expandafter{#3}{firstauthor}{\textbf{doi:#2}}{doi:#2}}% DOI string and if "firstauthor" is entered for the 3rd argument, this makes the DOI string bold indicating a first author publication
	\expandafter\ifstrequal\expandafter{#4}{}{\\}{\\[5pt]} % Conditional insertion of whitespace if the 4th parameter has any content in it
}

% 4 args: name, link, picture file, description
\newcommand{\project}[4]{
	\begin{center}
\textbf{\href{#2}{#1 \scriptsize\faLink}}
\includegraphics[height=80pt]{#3}\\ %Z how large image is
\end{center}
\vspace{-10pt}
#4
}

\usepackage{xspace}
\usepackage{xcolor}
\newcommand\linkcolor{\color{blue}}