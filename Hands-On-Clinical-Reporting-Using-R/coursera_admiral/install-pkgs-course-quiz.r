#-------------------------------------------------------------#
# Install packages needed for the Week 3 Module Quiz -
# ADaM Transformations using Pharmaverse R
#-------------------------------------------------------------#

install.packages("stringr") #This package installed first in order to use devtools
install.packages("devtools") #Needs stringr package installed first

# Load packages above
library("stringr")
library("devtools") # This package is needed for the install_version() function

# Install packages needed to run the code for the quiz, below. 

# NOTE : If you get this message, ignore and skip the updates:
#-------------------------------------------------------------#
# These packages have more recent versions available.
# It is recommended to update all of them.
# Which would you like to update?
#-------------------------------------------------------------#
install_version("admiral", version = "0.12.2", repos = "http://cran.us.r-project.org")
install_version("dplyr", version = "1.1.3", repos = "http://cran.us.r-project.org")
install_version("haven", version = "2.5.3", repos = "http://cran.us.r-project.org")
install_version("lubridate", version = "1.9.3", repos = "http://cran.us.r-project.org")
install_version("metacore", version = "0.1.2", repos = "http://cran.us.r-project.org")
install_version("metatools", version = "0.1.5", repos = "http://cran.us.r-project.org")
install_version("pharmaversesdtm", version = "0.1.1", repos = "http://cran.us.r-project.org")
install_version("tibble", version = "3.2.1", repos = "http://cran.us.r-project.org")
install_version("tidyr", version = "1.3.0", repos = "http://cran.us.r-project.org")
install_version("xportr", version = "0.3.1", repos = "http://cran.us.r-project.org")
