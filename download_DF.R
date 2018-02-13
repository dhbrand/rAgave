lib
library(rAgave)

myCreds <- Sys.getenv( c("AGAVE_USERNAME", "AGAVE_PASSWORD", "AGAVE_TENANT", "AGAVE_BASE_URL"), names = TRUE )

ag <-Agave$new( baseUrl = myCreds[["AGAVE_BASE_URL"]],
                username = myCreds[["AGAVE_USERNAME"]], 
                password = myCreds[["AGAVE_PASSWORD"]],
                cacheDir="~/Stapleton_Lab/agave/cache")

# clientData <- Client$new(clientName="rAgave")
# ag$clients$add_client(body=clientData)

str(ag$files$list(path = "dhbrand/ExampleData/DongWang/"))

ag$files$upload(destSystemId = "data.iplantcollaborative.org",destDirPath = "/dhbrand/", filename = "Parallel PDF.R")

df <- capture.output(ag$files$download(path = "/dhbrand/ExampleData/DongWang/dongwang.ped",filename = "dongwang.ped", overwrite = TRUE))

ag$restore()
str(ag$tokenInfo$toJSON())
