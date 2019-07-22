CWHL_Reg_Player_Stats <- subset(CWHL_Player_Stats_2007_19, CWHL_Player_Stats_2007_19$'Tournament ID' == "CWHL")

CWHL_Reg_Player_Stats$`Team ID`[grepl("MontréalStars", CWHL_Reg_Player_Stats$`Team ID`)] <- "Montréal Stars"
CWHL_Reg_Player_Stats$`Team ID`[grepl("BramptonCanadettesThunder", CWHL_Reg_Player_Stats$`Team ID`)] <- "Brampton Thunder"
CWHL_Reg_Player_Stats$`Team ID`[grepl("MississaugaChiefs", CWHL_Reg_Player_Stats$`Team ID`)] <- "Mississauga Chiefs"
CWHL_Reg_Player_Stats$`Team ID`[grepl("VaughanFlames", CWHL_Reg_Player_Stats$`Team ID`)] <- "Vaughan Flames"
CWHL_Reg_Player_Stats$`Team ID`[grepl("BurlingtonBarracudas", CWHL_Reg_Player_Stats$`Team ID`)] <- "Burlington Barracudas"
CWHL_Reg_Player_Stats$`Team ID`[grepl("OttawaCapitalCanucks", CWHL_Reg_Player_Stats$`Team ID`)] <- "Ottawa Capital Canucks"
CWHL_Reg_Player_Stats$`Team ID`[grepl("QuébecPhénix", CWHL_Reg_Player_Stats$`Team ID`)] <- "Québec Phénix"
CWHL_Reg_Player_Stats$`Team ID`[grepl("MontrealStars", CWHL_Reg_Player_Stats$`Team ID`)] <- "Montreal Stars"
CWHL_Reg_Player_Stats$`Team ID`[grepl("BramptonCanadetteThunder", CWHL_Reg_Player_Stats$`Team ID`)] <- "Brampton Thunder"
CWHL_Reg_Player_Stats$`Team ID`[grepl("OttawaSenators", CWHL_Reg_Player_Stats$`Team ID`)] <- "Ottawa Senators"
CWHL_Reg_Player_Stats$`Team ID`[grepl("BramptonHC", CWHL_Reg_Player_Stats$`Team ID`)] <- "Brampton Thunder"
CWHL_Reg_Player_Stats$`Team ID`[grepl("BostonBlades", CWHL_Reg_Player_Stats$`Team ID`)] <- "Boston Blades"
CWHL_Reg_Player_Stats$`Team ID`[grepl("TorontoFuries", CWHL_Reg_Player_Stats$`Team ID`)] <- "Toronto Furies"
CWHL_Reg_Player_Stats$`Team ID`[grepl("Alberta", CWHL_Reg_Player_Stats$`Team ID`)] <- "Calgary Inferno"
CWHL_Reg_Player_Stats$`Team ID`[grepl("Burlington", CWHL_Reg_Player_Stats$`Team ID`)] <- "Burlington Barracudas"
CWHL_Reg_Player_Stats$`Team ID`[grepl("Boston", CWHL_Reg_Player_Stats$`Team ID`)] <- "Boston Blades"
CWHL_Reg_Player_Stats$`Team ID`[grepl("Montreal", CWHL_Reg_Player_Stats$`Team ID`)] <- "Montréal Stars"
CWHL_Reg_Player_Stats$`Team ID`[grepl("Brampton", CWHL_Reg_Player_Stats$`Team ID`)] <- "Brampton Thunder"
CWHL_Reg_Player_Stats$`Team ID`[grepl("Toronto", CWHL_Reg_Player_Stats$`Team ID`)] <- "Toronto Furies"
CWHL_Reg_Player_Stats$`Team ID`[grepl("CalgaryInferno", CWHL_Reg_Player_Stats$`Team ID`)] <- "Calgary Inferno"
CWHL_Reg_Player_Stats$`Team ID`[grepl("BramptonThunder", CWHL_Reg_Player_Stats$`Team ID`)] <- "Brampton Thunder"
CWHL_Reg_Player_Stats$`Team ID`[grepl("MontréalCanadiennes", CWHL_Reg_Player_Stats$`Team ID`)] <- "Montréal Canadiennes"
CWHL_Reg_Player_Stats$`Team ID`[grepl("KunlunRedStar", CWHL_Reg_Player_Stats$`Team ID`)] <- "Kunlun Red Star"
CWHL_Reg_Player_Stats$`Team ID`[grepl("VankeRays", CWHL_Reg_Player_Stats$`Team ID`)] <- "Vanke Rays"
CWHL_Reg_Player_Stats$`Team ID`[grepl("MarkhamThunder", CWHL_Reg_Player_Stats$`Team ID`)] <- "Markham Thunder"
CWHL_Reg_Player_Stats$`Team ID`[grepl("ShenzhenKRSVankeRays", CWHL_Reg_Player_Stats$`Team ID`)] <- "Shenzhen KRS Vanke Rays"
CWHL_Reg_Player_Stats$`Team ID`[grepl("WorcesterBlades", CWHL_Reg_Player_Stats$`Team ID`)] <- "Worcester Blades"

CWHL_Reg_Player_Stats$GP[is.na(CWHL_Reg_Player_Stats$GP)] <- 0
CWHL_Reg_Player_Stats$G[is.na(CWHL_Reg_Player_Stats$G)] <- 0
CWHL_Reg_Player_Stats$A[is.na(CWHL_Reg_Player_Stats$A)] <- 0
CWHL_Reg_Player_Stats$PTS[is.na(CWHL_Reg_Player_Stats$PTS)] <- 0
CWHL_Reg_Player_Stats$ShO[is.na(CWHL_Reg_Player_Stats$ShO)] <- 0
CWHL_Reg_Player_Stats$GAA[CWHL_Reg_Player_Stats$GAA == "?"] <- 0
