%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements

\pagestyle{empty} % Suppress page numbers

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \addressSep {$\diamond$} % Set default address separator to a diamond

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
  \def \@addressthree {#1}
  }{
     \def \@addressone {#1}
  }}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
  \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printname % Print the name specified with \name
  \@ifundefined{@addressone}{}{ % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{ % Print the second address if specified
    \printaddress{\@addresstwo}}
     \@ifundefined{@addressthree}{}{ % Print the third address if specified
    \printaddress{\@addressthree}}
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \sectionskip
  \MakeUppercase{\bf #1} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{1.5em} % Margin within the section
  }
  \item[]
}{
  \end{list}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
 {\bf #1} \hfill {#2}% Bold company name and date on the right
 \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
  \\
  {\em #3} \hfill {\em #4}% Italic job title and location
  }\smallskip
  \begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0.5em} % Some space after the list of bullet points
}

%----------------------------------------------------------------------------------------
%	MULTIPLE ROLES AT ONE COMPANY, DRAWN AS A TREE
%----------------------------------------------------------------------------------------

% Usage:
%   \begin{rCompany}{Company}{Dates}{Location}
%     \begin{rRole}{Title}{Dates} \item ... \end{rRole}
%     \begin{rRole}{Title}{Dates} \item ... \end{rRole}
%   \end{rCompany}
%
% Each role is held in a box until the next one starts, so the last role
% can be drawn with a corner instead of a continuing trunk.

\newbox\rc@box
\newif\ifrc@first
\newlength\rc@tick   \setlength{\rc@tick}{0.9em}  % Branch length
\newlength\rc@pad    \setlength{\rc@pad}{0.25em}  % Space between branch and text
\newlength\rc@gap    \setlength{\rc@gap}{0.3em}   % Half the vertical space between roles
\newlength\rc@rule   \setlength{\rc@rule}{0.4pt}  % Line thickness
\def\rc@branch{0.55ex} % Branch height above the baseline
\def\rc@rootdepth{0.4em} % How far the trunk starts below the company baseline

% The tree sits in the section's left gutter, outside the bullet column,
% so role titles and text align with every other job listing.
\newcommand{\rc@flush}[1]{% #1 is how far the trunk runs below the baseline
  \ifvoid\rc@box\else
    \par\nointerlineskip
    \hbox{%
      \kern\@totalleftmargin
      \llap{%
        \vrule width\rc@rule
          height\dimexpr\ht\rc@box+\ifrc@first 0.1em\else 2\rc@gap\fi\relax
          depth#1%
        \vrule width\rc@tick height\dimexpr\rc@branch+\rc@rule\relax depth-\rc@branch
        \kern\rc@pad}%
      \box\rc@box}%
    \global\rc@firstfalse
  \fi
}

\newenvironment{rCompany}[3]{%
  \leavevmode
  \llap{%
    \vrule width\rc@rule height\dimexpr\rc@branch+\rc@rule\relax depth\rc@rootdepth
    \vrule width\rc@tick height\dimexpr\rc@branch+\rc@rule\relax depth-\rc@branch
    \kern\rc@pad}%
  {\bf #1}\ifthenelse{\equal{#3}{}}{}{, {\em #3}}\hfill{#2}\par
  \global\setbox\rc@box=\box\voidb@x
  \global\rc@firsttrue
}{%
  \rc@flush{-\rc@branch}\par\vspace{0.5em}
}

\newenvironment{rRole}[2]{%
  \rc@flush{\dp\rc@box}%
  \global\setbox\rc@box=\hbox\bgroup
  \begin{minipage}[t]{\linewidth}
    {\em #1}\hfill{\em #2}\par
    \begin{list}{$\cdot$}{\leftmargin=0pt \labelwidth=0.5em \labelsep=0.5em
      \topsep=1pt \partopsep=0pt \parsep=0pt \itemsep=1pt}
}{%
    \end{list}
  \end{minipage}\egroup
}

\newenvironment{rSubsectionEmpty}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
 {\bf #1} \hfill {#2}% Bold company name and date on the right
 \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
  \\
  {\em #3} \hfill {\em #4}% Italic job title and location
  }\smallskip
}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge} % Size of the name at the top of the document
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\nameskip{\bigskip} % The space after your name at the top
\def\sectionskip{\medskip} % The space after the heading section