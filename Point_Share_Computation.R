require(dplyr)
##Team Level

#League Goals per Game (per team)
league_goals_p_game = CWHL_Team_Stats %>%
  group_by(Season) %>%
  summarise(lgpg = mean(G)/(mean(GP)))

CWHL_Team_Stats_lgpg <- merge(CWHL_Team_Stats,league_goals_p_game, by = "Season") 

#Marginal Goals For
CWHL_Team_Stats_lgpg$MGF <- CWHL_Team_Stats_lgpg$G - ((7/12)*CWHL_Team_Stats_lgpg$GP*CWHL_Team_Stats_lgpg$lgpg)

#Marginal Goals Against
CWHL_Team_Stats_lgpg$MGA <- ((1+(7/12))*CWHL_Team_Stats_lgpg$GP*CWHL_Team_Stats_lgpg$lgpg) - CWHL_Team_Stats_lgpg$GA

#League Points per Goal
league_points_p_goal = CWHL_Team_Stats_lgpg %>%
  group_by(Season) %>%
  summarise(lppg = sum(Points)/sum(G))

CWHL_Team_Stats_lppg <- merge(CWHL_Team_Stats_lgpg,league_points_p_goal, by = "Season") 

#Expected Points
CWHL_Team_Stats_lppg$EP <- CWHL_Team_Stats_lppg$lppg*(CWHL_Team_Stats_lppg$MGF + CWHL_Team_Stats_lppg$MGA)

## Writing Team stats to csv
write.csv(CWHL_Team_Stats_lppg, "C:/Users/carli/Documents/Hockey Research/WHockey Research/CWHL OPS/CWHL_Team_Stats.csv", row.names = FALSE) 

##Player level Offensive Point Shares
CWHL_Reg_Player_Stats_2 <- left_join(CWHL_Reg_Player_Stats, CWHL_Team_Stats_lppg, by = c("Season" = "Season", "Team ID" = "Team ID"))

#Goals Created
CWHL_Reg_Player_Stats_2$GC <- (CWHL_Reg_Player_Stats_2$G.x + .5*CWHL_Reg_Player_Stats_2$A.x) * (CWHL_Reg_Player_Stats_2$G.y/(CWHL_Reg_Player_Stats_2$G.y+.5*CWHL_Reg_Player_Stats_2$A.y))

#Marginal Goals for each skater
gc_f_d = CWHL_Reg_Player_Stats_2 %>%
  group_by(`Team ID`, Season) %>%
  summarize(gc_f_d = sum(GC[Pos != "G"]))
CWHL_Reg_Player_Stats_3 <- left_join(CWHL_Reg_Player_Stats_2, gc_f_d, by = c("Season" = "Season", "Team ID" = "Team ID"))
gp_f_d = CWHL_Reg_Player_Stats_3 %>%
  group_by(`Team ID`, Season) %>%
  summarize(gp_f_d = sum(GP.x[Pos != "G"]))
CWHL_Reg_Player_Stats_4 <- left_join(CWHL_Reg_Player_Stats_3, gp_f_d, by = c("Season" = "Season", "Team ID" = "Team ID"))

CWHL_Reg_Player_Stats_4$iMGF <- CWHL_Reg_Player_Stats_4$GC - ((7/12)*CWHL_Reg_Player_Stats_4$GP.x*((CWHL_Reg_Player_Stats_4$gc_f_d/CWHL_Reg_Player_Stats_4$gp_f_d)))

#Marginal Goals per point
mg_p_p = CWHL_Team_Stats_lppg %>%
  group_by(Season) %>%
  summarize(mg_p_p = sum(G)/sum(Points))

#OPS for skaters
CWHL_Reg_Player_Stats_5 <- merge(CWHL_Reg_Player_Stats_4, mg_p_p,  by = "Season")

CWHL_Reg_Player_Stats_5$OPS <- CWHL_Reg_Player_Stats_5$iMGF/CWHL_Reg_Player_Stats_5$mg_p_p

## Writing to csv file
Player_Stats_CWHL = subset(CWHL_Reg_Player_Stats_5, select = c(Season, 'Team ID', 'Player ID', OPS))
write.csv(Player_Stats_CWHL, )

## Player level Goalie Point Shares