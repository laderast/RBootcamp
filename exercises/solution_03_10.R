

mutatedBiopics <- mutate(biopics, 
                         box_office_year = year_release * box_office, 
                         box_office_subject = paste0(box_office_year, subject), 
                         box_office_y_s_num = box_office_year/number_of_subjects)
