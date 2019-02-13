val bintrayUsername = sys.env.get("BINTRAY_USERNAME").getOrElse("")
val bintrayPassword = sys.env.get("BINTRAY_PASSWORD").getOrElse("")

credentials += Credentials("Bintray", "dl.bintray.com", bintrayUsername, bintrayPassword)
