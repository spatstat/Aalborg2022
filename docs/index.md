This is the website for participants in the summer school
_Statistics for Point Patterns in Space and Beyond_ given by Jesper Møller, Rasmus Waagepetersen, Jakob Gulddahl Rasmussen, Christophe Biscio and Ege Rubak as part of the
[1st International Summer School for PhD Students and Other Young Researchers](https://www.phd.engineering.aau.dk/Summer+School+2022/) in Aalborg, August 22-26 2022.

**Location:** [Aalborg University, Fredrik Bajers Vej 7A room 4-108, DK-9200 Aalborg Ø](https://clients.mapsindoors.com/aau/57482221bc1f570e288b8ef0/details/137e8aba9b244cd89c0bfc65)

## Getting credit for the course

To receive a course diploma (4 ECTS) the participants will be evaluated by successful participation during the lectures, including the solution of exercises. 
For the final assessment, a satisfactory solution of selected exercises (henceforth called hand-in exercises) are required with **deadline September 11, 2022**. 
The hand-in exercises and to whom they should be send are listed as part of the description of each day of the workshop below.
Please write your name clearly on the handin exactly as it appears on PhD Moodle, so we can easily cross reference with the participant list.

## Required preparation for the course

You will need a working install of R (and RStudio) with the package spatstat to participate, so please go through these steps:

1. If you don't have [R](http://r-project.org) (mandatory) and [Rstudio](http://rstudio.com) (optional, but highly recommended) installed please do so [as described here](https://asta.math.aau.dk/software/R-installation)
(**note** as described you need to choose a non-standard install option for R during install on Windows to be sure to avoid problems)

2. Watch this video about using RStudio (feel free to only skim it if you are already RStudio user or consciously choose another interface to R):
https://youtu.be/mAtAHwiP204

3. When you have R installed on your own computer, please install `spatstat` (http://cran.r-project.org/package=spatstat) and all its dependencies by running this R command in the R console:
`install.packages("spatstat", dependencies = TRUE)`


## Monday and Tuesday (lecturers Rasmus Waagepetersen and Ege Rubak)

These days are divided into a morning and afternoon session for a total of four sessions.

Each session consists of:

1. A lecture based on the same [slide set](./notes/lecturesRW.pdf) for all sessions
2. Exercises from the slides using "pen and paper"
3. Software demonstration based on lab notes (see below)
4. Lab exercises on the computer

**Some links are not active yet.**

Topic | Lab notes | Lab exercises | Lab solutions | Hand-in exercise
Intro and moments | [Notes 1](./notes/notes01.html) | [Lab 1](./labs/lab01.html) | [Lab solutions 1](./solutions/solution01.html) | Exerc. 1 in Intro sec. of slides
Poisson and envelopes | [Notes 2](./notes/notes02.html) | [Lab 2](./labs/lab02.html) | [Lab solutions 2](./solutions/solution02.html) | Exerc. 2 in Poisson sec. of slides
Cox/cluster and estimating eqns. | [Notes 3](./notes/notes03.html) | [Lab 3](./labs/lab03.html) | [Lab solutions 3](./solutions/solution03.html) | Exerc. 1 in Cox/cluster sec. of slides
Determinantal and Markov models | [Notes 4](./notes/notes04.html) | [Lab 4](./labs/lab04.html) | [Lab solutions 4](./solutions/solution04.html) | Computer exercise [html](./notes/dpp_exercise.html),[pdf](./notes/dpp_exercise.pdf),[Rmd](./notes/dpp_exercise.Rmd)

### Hand-in exercises for Monday and Tuesday

Hand-in exercises are listed in the table above. 
Solutions for the first three should be send to Rasmus (rw@math.aau.dk) while the solution to the computer exercise should be send to Ege (rubak@math.aau.dk).

## Wednesday (lecturer Jakob Gulddahl Rasmussen)

- [Slides (spacetime-slides.pdf) about temporal and spatio-temporal point processes](./notes/spacetime-slides.pdf)
- [R-code for demonstrating temporal and spatio-temporal point processes](./notes/spacetime-Rcode.R)

### Hand-in exercises for Wednesday

- _One_ of the exercises at slide 11, 17, 33 or 35 in spacetime-slides.pdf should be handed in to Jakob (jgr@math.aau.dk).

### Optional reading

This is not required but may be helpful when solving exercises:

- [Lecture notes on marked temporal point processes](https://arxiv.org/pdf/1806.00221.pdf)

## Thursday (lecturers Jakob Gulddahl Rasmussen and Jesper Møller)

Thursday consists of four lectures

- First lecture: We continue with the slides and R-code from day 3 (Jakob).
- Second lecture: [Slides (lecture_networks_no_pause.pdf) about point processes on linear networks (Jesper)](https://people.math.aau.dk/~jm/courses/SummerSchool2022/lecture_networks_no_pause.pdf).
- Third lecture: [Slides (lecture_spheres_no_pause.pdf) about point processes on the sphere (Jesper)](https://people.math.aau.dk/~jm/courses/SummerSchool2022/lecture_spheres_no_pause.pdf).
- Fourth lecture: [Slides (dln-slides.pdf) about point processes on directed linear networks (Jakob)](./notes/dln-slides.pdf).

### Hand-in exercises for Thursday

- _One_ of the exercises at slide 11, 18, 19, 30 or 43 in lecture_spheres_no_pause.pdf should be handed in to Jesper (jm@math.aau.dk).
- _One_ of the exercises at slide 20 or 43 in lecture_networks_no_pause.pdf should be handed in to Jesper (jm@math.aau.dk).
- _One_ of the exercises at slide 5, 10 or 15 in dln-slides.pdf should be handed in to Jakob (jgr@math.aau.dk).

### Optional reading for Thursday

This is not required but may be helpful when solving exercises:

- [Paper on log Gaussian Cox processes on the sphere](https://arxiv.org/pdf/1803.03051) (second lecture)
- [Review paper on point processes on linear networks](https://people.math.aau.dk/~jm/courses/SummerSchool2022/sjs.pdf) (third lecture)
- [Paper on point processes on directed linear network](https://link.springer.com/content/pdf/10.1007/s11009-020-09777-y.pdf) (also at [arXiv: 1812.09071](https://arxiv.org/pdf/1812.09071)) (fourth lecture)

## Course materials for day 5 (lecturer Christophe Biscio)

**TBA**

### Information for developers

The `Rmarkdown` source code for some parts is available at
[https://github.com/spatstat/Aalborg2022](https://github.com/spatstat/Aalborg2022)

**This material is Copyright (C) Jesper Møller, Rasmus Waagepetersen, Jakob Gulddahl Rasmussen, Christophe Biscio, Ege Rubak and Adrian Baddeley 2022**
