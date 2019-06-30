#usethis::create_from_github("ines/course-starter-r", destdir = "c:/code/", open=TRUE, rstudio=TRUE)

###
#source("c:/Code/RBootcamp/extract_chapters.R")
library(decampr)


#load chapter as single character string
chapter_file <- readr::read_file("c:/Code/RBootcamp_old/chapter1.md")
chapter_file <- convert_to_unix_linebreaks(chapter_file)
#chunk text into exercises
test_list <- get_exercises(chapter_file = chapter_file)
#extract exercise information
exercise_list <- parse_exercise_list(test_list)
#number the exercises
exercise_list <- number_ex_list(exercise_list, basename = "01")
#save the exercises and rewritten chapter.md
save_exercise_list(exercise_list, "chapter1.md", "c:/Code/RBootcamp_old/chapter1.md")




#load chapter as single character string
chapter_file <- readr::read_file("c:/Code/RBootcamp_old/chapter2.md")
chapter_file <- convert_to_unix_linebreaks(chapter_file)
#chunk text into exercises
test_list <- get_exercises(chapter_file = chapter_file)
#extract exercise information
exercise_list <- parse_exercise_list(test_list)
#number the exercises
exercise_list <- number_ex_list(exercise_list, basename = "02")
#save the exercises and rewritten chapter.md
save_exercise_list(exercise_list, "chapter2.md", "c:/Code/RBootcamp_old/chapter2.md")

library(decampr)
chapter_file <- readr::read_file("c:/Code/RBootcamp_old/chapter3.md")
chapter_file <- convert_to_unix_linebreaks(chapter_file)
#chunk text into exercises
test_list <- get_exercises(chapter_file = chapter_file)
#extract exercise information
exercise_list <- parse_exercise_list(test_list)
#number the exercises
exercise_list <- number_ex_list(exercise_list, basename = "03")
#save the exercises and rewritten chapter.md
save_exercise_list(exercise_list, "chapter3.md", "c:/Code/RBootcamp_old/chapter3.md")


chapter_file <- readr::read_file("c:/Code/RBootcamp_old/chapter4.md")
#chunk text into exercises
chapter_file <- convert_to_unix_linebreaks(chapter_file)
test_list <- get_exercises(chapter_file = chapter_file)
#extract exercise information
exercise_list <- parse_exercise_list(test_list)
#number the exercises
exercise_list <- number_ex_list(exercise_list, basename = "04")
#save the exercises and rewritten chapter.md
save_exercise_list(exercise_list, "chapter4.md", "c:/Code/RBootcamp_old/chapter4.md")


chapter_file <- readr::read_file("c:/Code/RBootcamp_old/chapter5.md")
#chunk text into exercises
chapter_file <- convert_to_unix_linebreaks(chapter_file)
test_list <- get_exercises(chapter_file = chapter_file)
#extract exercise information
exercise_list <- parse_exercise_list(test_list)
#number the exercises
exercise_list <- number_ex_list(exercise_list, basename = "05")
#save the exercises and rewritten chapter.md
save_exercise_list(exercise_list, "chapter5.md", "c:/Code/RBootcamp_old/chapter5.md")
