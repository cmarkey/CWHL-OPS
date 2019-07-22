library(dplyr)

#Sum player stats into team stats
CWHL_Team_Stats <- CWHL_Reg_Player_Stats %>%
  group_by(`Team ID`, Season) %>% 
  summarise_if(is.double,funs(sum))

CWHL_Team_Stats = subset(CWHL_Team_Stats, select = -c(Age,Rank))
CWHL_Team_Stats$GA = CWHL_Team_Stats$GA + CWHL_Team_Stats$ENA
CWHL_Team_Stats = subset(CWHL_Team_Stats, select = -c(MIN,SEC,ENA))
CWHL_Team_Stats = subset(CWHL_Team_Stats, select = -c(T))

#Team Game corrections - see Who's Who in Women's Hockey Guide by Richard Scott
CWHL_Team_Stats$GP[(CWHL_Team_Stats$Season == "2007-08") | (CWHL_Team_Stats$Season == "2008-09") | (CWHL_Team_Stats$Season == "2009-10")] = 30
CWHL_Team_Stats$GP[(CWHL_Team_Stats$Season == "2010-11")] = 26
CWHL_Team_Stats$GP[(CWHL_Team_Stats$Season == "2011-12")] = 27
CWHL_Team_Stats$GP[(CWHL_Team_Stats$Season == "2011-12") & (CWHL_Team_Stats$'Team ID' == "Calgary Inferno") ] = 15
CWHL_Team_Stats$GP[(CWHL_Team_Stats$Season == "2012-13") | (CWHL_Team_Stats$Season == "2013-14") | (CWHL_Team_Stats$Season == "2014-15") | (CWHL_Team_Stats$Season == "2015-16") | (CWHL_Team_Stats$Season == "2016-17")] = 30
CWHL_Team_Stats$GP[(CWHL_Team_Stats$Season == "2013-14") & (CWHL_Team_Stats$'Team ID' == "Montréal Stars") ] = 23
CWHL_Team_Stats$GP[(CWHL_Team_Stats$Season == "2013-14") & (CWHL_Team_Stats$'Team ID' == "Toronto Furies") ] = 23
CWHL_Team_Stats$GP[(CWHL_Team_Stats$Season == "2017-18") | (CWHL_Team_Stats$Season == "2018-19")] = 28

#W-L-OTL record corrections


#League Goals per Game (per team)
league_goals_p_game = CWHL_Team_Stats %>%
  group_by(Season) %>%
  summarise(lgpg = sum(G)/(mean(GP)))

CWHL_Team_Stats_lgpg <- merge(CWHL_Team_Stats,league_goals_p_game, by = "Season") #ignore MGF values here

#Marginal Goals For
CWHL_Team_Stats_lgpg$MGF <- CWHL_Team_Stats_lgpg$G - ((7/12)*CWHL_Team_Stats_lgpg$GP*CWHL_Team_Stats_lgpg$lgpg)

#Marginal Goals Against
CWHL_Team_Stats_lgpg$MGA <- ((1+(7/12))*CWHL_Team_Stats_lgpg$GP*CWHL_Team_Stats_lgpg$lgpg) - CWHL_Team_Stats_lgpg$GA

#League Points per Goal
league_points_p_goal = CWHL_Team_Stats %>%
  group_by(Season) %>%
  summarise(lgpg = sum(G)/(mean(GP)))

#Expected Points
CWHL_Team_Stats_lgpg$EP <- (CWHL_Team_Stats_lgpg$MGF + CWHL_Team_Stats_lgpg$MGA)