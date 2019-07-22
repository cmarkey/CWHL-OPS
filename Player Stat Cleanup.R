library(dplyr)

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
CWHL_Reg_Player_Stats$PM[is.na(CWHL_Reg_Player_Stats$PM)] <- 0
CWHL_Reg_Player_Stats$PPG[is.na(CWHL_Reg_Player_Stats$PPG)] <- 0
CWHL_Reg_Player_Stats$SHG[is.na(CWHL_Reg_Player_Stats$SHG)] <- 0
CWHL_Reg_Player_Stats$GWG[is.na(CWHL_Reg_Player_Stats$GWG)] <- 0
CWHL_Reg_Player_Stats$W[is.na(CWHL_Reg_Player_Stats$W)] <- 0
CWHL_Reg_Player_Stats$L[is.na(CWHL_Reg_Player_Stats$L)] <- 0
CWHL_Reg_Player_Stats$GA[is.na(CWHL_Reg_Player_Stats$GA)] <- 0
CWHL_Reg_Player_Stats$ENA[is.na(CWHL_Reg_Player_Stats$ENA)] <- 0
CWHL_Reg_Player_Stats$Pos[is.na(CWHL_Reg_Player_Stats$Pos)] <- "Unknown"

CWHL_Reg_Player_Stats = subset(CWHL_Reg_Player_Stats, select = -c(Rank, Team_Award, ShO, Plus, T))

#Sum player stats into team stats
CWHL_Team_Stats <- CWHL_Reg_Player_Stats %>%
  group_by(`Team ID`, Season) %>% 
  summarise_if(is.double,funs(sum))

CWHL_Team_Stats = subset(CWHL_Team_Stats, select = -c(Age))
CWHL_Team_Stats$GA = CWHL_Team_Stats$GA + CWHL_Team_Stats$ENA
CWHL_Team_Stats = subset(CWHL_Team_Stats, select = -c(MIN,SEC,ENA))

#Team Game corrections - see Who's Who in Women's Hockey Guide by Richard Scott
CWHL_Team_Stats$GP[(CWHL_Team_Stats$Season == "2007-08") | (CWHL_Team_Stats$Season == "2008-09") | (CWHL_Team_Stats$Season == "2009-10")] = 30
CWHL_Team_Stats$GP[(CWHL_Team_Stats$Season == "2010-11")] = 26
CWHL_Team_Stats$GP[(CWHL_Team_Stats$Season == "2011-12")] = 27
CWHL_Team_Stats$GP[(CWHL_Team_Stats$Season == "2011-12") & (CWHL_Team_Stats$'Team ID' == "Calgary Inferno") ] = 15
CWHL_Team_Stats$GP[(CWHL_Team_Stats$Season == "2012-13") | (CWHL_Team_Stats$Season == "2013-14") | (CWHL_Team_Stats$Season == "2014-15") | (CWHL_Team_Stats$Season == "2015-16") | (CWHL_Team_Stats$Season == "2016-17")] = 30
CWHL_Team_Stats$GP[(CWHL_Team_Stats$Season == "2013-14") & (CWHL_Team_Stats$'Team ID' == "Montréal Stars") ] = 23
CWHL_Team_Stats$GP[(CWHL_Team_Stats$Season == "2013-14") & (CWHL_Team_Stats$'Team ID' == "Toronto Furies") ] = 23
CWHL_Team_Stats$GP[(CWHL_Team_Stats$Season == "2017-18") | (CWHL_Team_Stats$Season == "2018-19")] = 28

#W-L-OTL record corrections - Who's Who in Women's Hockey
CWHL_Team_Stats$W[CWHL_Team_Stats$`Team ID` == "Montréal Stars" & CWHL_Team_Stats$Season == "2007-08"] = 23
CWHL_Team_Stats$W[CWHL_Team_Stats$`Team ID` == "Brampton Thunder" & CWHL_Team_Stats$Season == "2008-09"] = 22
CWHL_Team_Stats$W[CWHL_Team_Stats$`Team ID` == "Burlington Barracudas" & CWHL_Team_Stats$Season == "2008-09"] = 11
CWHL_Team_Stats$W[CWHL_Team_Stats$`Team ID` == "Montréal Stars" & CWHL_Team_Stats$Season == "2009-10"] = 23
CWHL_Team_Stats$W[CWHL_Team_Stats$`Team ID` == "Mississauga Chiefs" & CWHL_Team_Stats$Season == "2009-10"] = 22
CWHL_Team_Stats$W[CWHL_Team_Stats$`Team ID` == "Brampton Thunder" & CWHL_Team_Stats$Season == "2009-10"] = 12
CWHL_Team_Stats$W[CWHL_Team_Stats$`Team ID` == "Vaughan Flames" & CWHL_Team_Stats$Season == "2009-10"] = 9
CWHL_Team_Stats$W[CWHL_Team_Stats$`Team ID` == "Brampton Thunder" & CWHL_Team_Stats$Season == "2010-11"] = 19
CWHL_Team_Stats$W[CWHL_Team_Stats$`Team ID` == "Toronto Furies" & CWHL_Team_Stats$Season == "2010-11"] = 8
CWHL_Team_Stats$W[CWHL_Team_Stats$`Team ID` == "Burlington Barracudas" & CWHL_Team_Stats$Season == "2010-11"] = 6
CWHL_Team_Stats$W[CWHL_Team_Stats$`Team ID` == "Montréal Stars" & CWHL_Team_Stats$Season == "2012-13"] = 18
CWHL_Team_Stats$W[CWHL_Team_Stats$`Team ID` == "Montréal Stars" & CWHL_Team_Stats$Season == "2014-15"] = 14
CWHL_Team_Stats$W[CWHL_Team_Stats$`Team ID` == "Calgary Inferno" & CWHL_Team_Stats$Season == "2018-19"] = 23

CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Brampton Thunder" & CWHL_Team_Stats$Season == "2007-08"] = 7
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Mississauga Chiefs" & CWHL_Team_Stats$Season == "2007-08"] = 8
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Montréal Stars" & CWHL_Team_Stats$Season == "2007-08"] = 6
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Vaughan Flames" & CWHL_Team_Stats$Season == "2007-08"] = 16
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Burlington Barracudas" & CWHL_Team_Stats$Season == "2007-08"] = 18
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Burlington Barracudas" & CWHL_Team_Stats$Season == "2007-08"] = 18
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Montréal Stars" & CWHL_Team_Stats$Season == "2008-09"] = 4
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Brampton Thunder" & CWHL_Team_Stats$Season == "2008-09"] = 7
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Mississauga Chiefs" & CWHL_Team_Stats$Season == "2008-09"] = 9
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Burlington Barracudas" & CWHL_Team_Stats$Season == "2008-09"] = 16
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Vaughan Flames" & CWHL_Team_Stats$Season == "2008-09"] = 19
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Montréal Stars" & CWHL_Team_Stats$Season == "2009-10"] = 5
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Mississauga Chiefs" & CWHL_Team_Stats$Season == "2009-10"] = 7
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Brampton Thunder" & CWHL_Team_Stats$Season == "2009-10"] = 8
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Vaughan Flames" & CWHL_Team_Stats$Season == "2009-10"] = 20
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Montréal Stars" & CWHL_Team_Stats$Season == "2010-11"] = 2
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Brampton Thunder" & CWHL_Team_Stats$Season == "2010-11"] = 5
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Boston Blades" & CWHL_Team_Stats$Season == "2010-11"] = 15
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Toronto Furies" & CWHL_Team_Stats$Season == "2010-11"] = 13
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Burlington Barracudas" & CWHL_Team_Stats$Season == "2010-11"] = 18
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Montréal Stars" & CWHL_Team_Stats$Season == "2011-12"] = 4
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Brampton Thunder" & CWHL_Team_Stats$Season == "2011-12"] = 7
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Toronto Furies" & CWHL_Team_Stats$Season == "2011-12"] = 13
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Burlington Barracudas" & CWHL_Team_Stats$Season == "2011-12"] = 26
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Boston Blades" & CWHL_Team_Stats$Season == "2012-13"] = 4
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Montréal Stars" & CWHL_Team_Stats$Season == "2012-13"] = 5
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Brampton Thunder" & CWHL_Team_Stats$Season == "2012-13"] = 12
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Toronto Furies" & CWHL_Team_Stats$Season == "2012-13"] = 13
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Calgary Inferno" & CWHL_Team_Stats$Season == "2012-13"] = 21
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Montréal Stars" & CWHL_Team_Stats$Season == "2013-14"] = 2
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Calgary Inferno" & CWHL_Team_Stats$Season == "2013-14"] = 11
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Toronto Furies" & CWHL_Team_Stats$Season == "2013-14"] = 10
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Brampton Thunder" & CWHL_Team_Stats$Season == "2013-14"] = 16
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Calgary Inferno" & CWHL_Team_Stats$Season == "2014-15"] = 6
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Montréal Stars" & CWHL_Team_Stats$Season == "2014-15"] = 9
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Toronto Furies" & CWHL_Team_Stats$Season == "2014-15"] = 13
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Brampton Thunder" & CWHL_Team_Stats$Season == "2014-15"] = 16
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Boston Blades" & CWHL_Team_Stats$Season == "2014-15"] = 6
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Calgary Inferno" & CWHL_Team_Stats$Season == "2015-16"] = 6
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Brampton Thunder" & CWHL_Team_Stats$Season == "2015-16"] = 7
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Toronto Furies" & CWHL_Team_Stats$Season == "2015-16"] = 16
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Montréal Canadiennes" & CWHL_Team_Stats$Season == "2016-17"] = 5
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Brampton Thunder" & CWHL_Team_Stats$Season == "2016-17"] = 10
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Toronto Furies" & CWHL_Team_Stats$Season == "2016-17"] = 11
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Boston Blades" & CWHL_Team_Stats$Season == "2016-17"] = 20
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Montréal Canadiennes" & CWHL_Team_Stats$Season == "2017-18"] = 5
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Kunlun Red Star" & CWHL_Team_Stats$Season == "2017-18"] = 6
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Calgary Inferno" & CWHL_Team_Stats$Season == "2017-18"] = 7
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Markham Thunder" & CWHL_Team_Stats$Season == "2017-18"] = 7
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Vanke Rays" & CWHL_Team_Stats$Season == "2017-18"] = 13
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Toronto Furies" & CWHL_Team_Stats$Season == "2017-18"] = 17
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Boston Blades" & CWHL_Team_Stats$Season == "2017-18"] = 24
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Markham Thunder" & CWHL_Team_Stats$Season == "2018-19"] = 11
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Vanke Rays" & CWHL_Team_Stats$Season == "2018-19"] = 13
CWHL_Team_Stats$L[CWHL_Team_Stats$`Team ID` == "Worcester Blades" & CWHL_Team_Stats$Season == "2018-19"] = 28

CWHL_Team_Stats$OTL <- CWHL_Team_Stats$GP - (CWHL_Team_Stats$W + CWHL_Team_Stats$L)

#Team Point Calculation
CWHL_Team_Stats$Points <- 2*CWHL_Team_Stats$W+1*CWHL_Team_Stats$OTL
