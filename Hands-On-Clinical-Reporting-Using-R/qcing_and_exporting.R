#pak::pak(c("metacore", "metatools", "haven", "dplyr","xportr"))

#load libraries

library(metatools)
library(metacore)
library( haven)
library(dplyr)
library(xportr)

#load example datasets

load(metacore_example("pilot_ADaM.rda"))
metacore <- metacore |>
  select_dataset("ADSL")

adsl <- read_xpt(metatools_example("adsl.xpt"))


#Apply metadata and perform associated checks

adsl <- adsl |>
  drop_unspec_vars(metacore) |> #drop unspecified variables from specs
  check_variables(metacore) |> #check all variables specified are present but no additional
  check_ct_data(metacore) |> #check all variables with CT only contain variables within CT
  order_cols(metacore) |> #order the columns according to the spec
  sort_by_key(metacore) #sorts the rows by te sort keys

#Export ADSL in submission-ready format using {xportr}

adsl_xprt <- adsl |>
  xportr_label(metacore) |> #assigns variable label from metacore specifications
  xportr_df_label(metacore, domain = "ADSL") |> #Assigns dataset label from metacore specification
  xportr_type(metacore) |> # coerce variable type to match spec
  xportr_length(metacore) |> #assigns SAS length from a variable level metadata
  xportr_format(metacore) |> #assigns variable format from metacore specifications
  xportr_write("adsl.xpt") #write xpt v5 transport file
