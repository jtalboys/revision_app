# Read in the data from my googlesheet using googlesheets4
# We need googlesheets4 and googledrive
library(googlesheets4)
library(googledrive)

# Should have to authenticate when next line is run
sem2_content <- drive_get("Sem2_content")

# Get the sheets names - asked for auth here as well??
mods <- sheets_sheets(sem2_content)

# To get the actual data from a sheet use read_sheet
# This will get called in the app but for now we'll read in the relevant sheets
Tseries <- read_sheet(sem2_content, sheet = "TSeries")
graph_nets <- read_sheet(sem2_content, sheet = "GraphsAndNets")

