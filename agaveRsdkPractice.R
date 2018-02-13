library(devtools)
install_github("agaveplatform/r-sdk")
library(rAgave)

# cat("AGAVE_USERNAME=dhbrand\n", file=file.path(normalizePath("~/"), ".Renviron"))
# cat("AGAVE_PASSWORD=password\n", file=file.path(normalizePath("~/"), ".Renviron"), append=TRUE)
# cat("AGAVE_TENANT=iplantc.org\n", file=file.path(normalizePath("~/"), ".Renviron"), append=TRUE)
# cat("AGAVE_BASE_URL=https://agave.iplantc.org", file=file.path(normalizePath("~/"), ".Renviron"), append=TRUE)

myCreds <- Sys.getenv( c("AGAVE_USERNAME", "AGAVE_PASSWORD", "AGAVE_TENANT", "AGAVE_BASE_URL"), names = TRUE )

# if (is.null(myCreds[["AGAVE_USERNAME"]]) || nchar(myCreds[["AGAVE_USERNAME"]]) == 0) {
#     myCreds[["AGAVE_USERNAME"]] <- readline("Agave username:")
#     Sys.setenv(AGAVE_USERNAME = myCreds[["AGAVE_USERNAME"]])
# }
# 
# if (is.null(myCreds[["AGAVE_PASSWORD"]]) || nchar(myCreds[["AGAVE_PASSWORD"]]) == 0) {
#     myCreds[["AGAVE_PASSWORD"]] <- readline("Agave password:")
#     Sys.setenv(AGAVE_PASSWORD = myCreds[["AGAVE_PASSWORD"]])
# }
# 
# if (is.null(myCreds[["AGAVE_BASE_URL"]]) || nchar(myCreds[["AGAVE_BASE_URL"]]) == 0) {
#     myCreds[["AGAVE_BASE_URL"]] <- readline("Agave base url (https://public.agaveapi.co):")
#     Sys.setenv(AGAVE_BASE_URL = myCreds[["AGAVE_BASE_URL"]])
# }

ag <-Agave$new( baseUrl = myCreds[["AGAVE_BASE_URL"]],
                username = myCreds[["AGAVE_USERNAME"]], 
                password = myCreds[["AGAVE_PASSWORD"]],
                cacheDir="~/Stapleton_Lab/agave/cache")


clientData <- Client$new(clientName="rAgave")
clientData$clientName
# ag$clients$add_client(body=clientData)
ag$clients$get_client(clientName = "rAgave")
ag$clients$list_clients()
ag$clients$list_client_api_subscriptions(clientName = "rAgave")


str(head(ag$apps$listApps(),5))

str(ag$files$list(path = "dhbrand/ExampleData/DongWang/"))

ag$files$download(path = "/dhbrand/ExampleData/DongWang/dongwang.ped",filename = "dongwang.ped", overwrite = TRUE)

ag$files$upload(destSystemId = "data.iplantcollaborative.org",destDirPath = "/dhbrand/", filename = "Parallel PDF.R")


str(ag$tokenInfo$toJSON())
ag$restore()

api = Agave$new()

str(api$files$listPermissions(path = "dhbrand/ExampleData/DongWang/"))
