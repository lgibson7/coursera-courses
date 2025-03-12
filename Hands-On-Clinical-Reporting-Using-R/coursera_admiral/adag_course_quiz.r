library(tibble)
library(dplyr, warn.conflicts = FALSE)
library(pharmaversesdtm)
library(admiral)

# creating a query dataset for a customized query
cqterms <- tribble(
  ~TERMNAME, ~TERMID,
  "APPLICATION SITE ERYTHEMA", 10003041L,
  "APPLICATION SITE PRURITUS", 10003053L,
) %>%
  mutate(SRCVAR = "AEDECOD")

cqterms_can <- tribble(
  ~TERMNAME, ~TERMID,
  "COLON CANCER", 10000000L,
  "PROSTATE CANCER", 10000001L
) %>%
  mutate(SRCVAR = "AEDECOD")

cq7 <- query(
  prefix = "CQ07",
  name = "Application Site Issues",
  definition = cqterms
)

cq8 <- query(
  prefix = "CQ08",
  name = "Cancer",
  definition = cqterms_can
)

custom <- create_query_data(queries = list(cq7 
                                           ,cq8 
                                           ))

data("queries") #get current query data from admiral package

adag <- bind_rows(queries, custom) #combine query data with custom queries created above
