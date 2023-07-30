# Ethan Lew's Resume

This repository contains the LaTeX source code for my (Ethan Lew's) resume.

## Access The Resume

The compiled resume is automatically built and deployed to GitHub Pages whenever there are new commits to the `main` branch. It can be accessed at the following URL:

[https://EthanJamesLew.github.io/elew-cv/elew-cv.pdf](https://<your-github-username>.github.io/<your-repo-name>/elew-cv.pdf)

## Local Build Instructions

To compile the LaTeX document to a PDF locally, follow these steps:

1. Install a LaTeX distribution (e.g., [TeX Live](https://www.tug.org/texlive/) or [MiKTeX](https://miktex.org/)) if you haven't done so already.

2. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/EthanJamesLew/elew-cv.git
    ```

    Replace `EthanJamesLew` and `elew-cv` with your actual GitHub username and repository name.

3. Navigate to the repository's directory:

    ```bash
    cd elew-cv
    ```

    Replace `elew-cv` with your actual repository name.

4. Compile the LaTeX document to a PDF:

    ```bash
    pdflatex elew-cv.tex
    ```

5. The compiled PDF (named `elew-cv.pdf`) should now be in the same directory.