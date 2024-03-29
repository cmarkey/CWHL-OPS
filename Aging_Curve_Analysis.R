require(dplyr)
require(ggplot2)

#count(CWHL_Reg_Player_Stats_OPS, vars = "Player_ID")

#df <- CWHL_Reg_Player_Stats_OPS[which((CWHL_Reg_Player_Stats_OPS$'Player ID' == "Rattray_Jamie_Lee") |
#                                        (CWHL_Reg_Player_Stats_OPS$'Player ID' == "Ouellette_Caroline") |
#                                        (CWHL_Reg_Player_Stats_OPS$'Player ID' == "Stack_Kelli") |
#                                        (CWHL_Reg_Player_Stats_OPS$'Player ID' == "Knight_Hilary") |
#                                        (CWHL_Reg_Player_Stats_OPS$'Player ID' == "Hefford_Jayna") | 
#                                        (CWHL_Reg_Player_Stats_OPS$'Player ID' == "Poulin_Marie_Philip") |
#                                        (CWHL_Reg_Player_Stats_OPS$'Player ID' == "Jones_Jess") | 
#                                        (CWHL_Reg_Player_Stats_OPS$'Player ID' == "Botterill_Jennifer")| 
#                                        (CWHL_Reg_Player_Stats_OPS$'Player ID' == "Decker_Brianna")| 
#                                        (CWHL_Reg_Player_Stats_OPS$'Player ID' == "Johnston_Rebecca")),]
#
#
#df2 <-subset(df, GP.x >= 10)
#ggplot(data = df2, aes(x = Age, y = OPS, group = df2$'Player ID', color = df2$'Player ID'))+
#  geom_line(size = 1.2) +
#  labs(title = "CWHL Aging Curve - Offensive Point Shares", y = "Offensive Point Shares", color = "Player")+
#  theme_light()+
#  theme(plot.title = element_text(hjust = 0.5))

#all players who played more than one game
ops = CWHL_Reg_Player_Stats_OPS %>%
  filter(GP.x >= 1)

ops_change$Age <- floor(ops_change$Age)

#bucketing
ops_16 <- ops_change %>%
  filter(Age == 16)
ops_17 <- ops_change %>%
  filter(Age == 17)
ops_18 <- ops_change %>%
  filter(Age == 18)
ops_19 <- ops_change %>%
  filter(Age == 19)
ops_20 <- ops_change %>%
  filter(Age == 20)
ops_21 <- ops_change %>%
  filter(Age == 21)
ops_22 <- ops_change %>%
  filter(Age == 22)
ops_23 <- ops_change %>%
  filter(Age == 23)
ops_24 <- ops_change %>%
  filter(Age == 24)
ops_25 <- ops_change %>%
  filter(Age == 25)
ops_26 <- ops_change %>%
  filter(Age == 26)
ops_27 <- ops_change %>%
  filter(Age == 27)
ops_28 <- ops_change %>%
  filter(Age == 28)
ops_29 <- ops_change %>%
  filter(Age == 29)
ops_30 <- ops_change %>%
  filter(Age == 30)
ops_31 <- ops_change %>%
  filter(Age == 31)
ops_32 <- ops_change %>%
  filter(Age == 32)
ops_33 <- ops_change %>%
  filter(Age == 33)
ops_34 <- ops_change %>%
  filter(Age == 34)
ops_35 <- ops_change %>%
  filter(Age == 35)
ops_36 <- ops_change %>%
  filter(Age == 36)
ops_37 <- ops_change %>%
  filter(Age == 37)
ops_38 <- ops_change %>%
  filter(Age == 38)
ops_39 <- ops_change %>%
  filter(Age == 39)
ops_40 <- ops_change %>%
  filter(Age == 40)

ops_1617 <- inner_join(ops_16,ops_17, by = "Player ID")
ops_1617$deltaOPS <- ops_1617$OPS.y-ops_1617$OPS.x #second year minus 1st year
ops_1718 <- inner_join(ops_17,ops_18, by = "Player ID")
ops_1718$deltaOPS <- ops_1718$OPS.y-ops_1718$OPS.x #second year minus 1st year
ops_1819 <- inner_join(ops_18,ops_19, by = "Player ID")
ops_1819$deltaOPS <- ops_1819$OPS.y-ops_1819$OPS.x #second year minus 1st year
ops_1920 <- inner_join(ops_19,ops_20, by = "Player ID")
ops_1920$deltaOPS <- ops_1920$OPS.y-ops_1920$OPS.x #second year minus 1st year
ops_2021 <- inner_join(ops_20,ops_21, by = "Player ID")
ops_2021$deltaOPS <- ops_2021$OPS.y-ops_2021$OPS.x #second year minus 1st year
ops_2122 <- inner_join(ops_21,ops_22, by = "Player ID")
ops_2122$deltaOPS <- ops_2122$OPS.y-ops_2122$OPS.x #second year minus 1st year
ops_2223 <- inner_join(ops_22,ops_23, by = "Player ID")
ops_2223$deltaOPS <- ops_2223$OPS.y-ops_2223$OPS.x #second year minus 1st year
ops_2324 <- inner_join(ops_23,ops_24, by = "Player ID")
ops_2324$deltaOPS <- ops_2324$OPS.y-ops_2324$OPS.x #second year minus 1st year
ops_2425 <- inner_join(ops_24,ops_25, by = "Player ID")
ops_2425$deltaOPS <- ops_2425$OPS.y-ops_2425$OPS.x #second year minus 1st year
ops_2526 <- inner_join(ops_25,ops_26, by = "Player ID")
ops_2526$deltaOPS <- ops_2526$OPS.y-ops_2526$OPS.x #second year minus 1st year
ops_2627 <- inner_join(ops_26,ops_27, by = "Player ID")
ops_2627$deltaOPS <- ops_2627$OPS.y-ops_2627$OPS.x #second year minus 2st year
ops_2728 <- inner_join(ops_27,ops_28, by = "Player ID")
ops_2728$deltaOPS <- ops_2728$OPS.y-ops_2728$OPS.x #second year minus 2st year
ops_2829 <- inner_join(ops_28,ops_29, by = "Player ID")
ops_2829$deltaOPS <- ops_2829$OPS.y-ops_2829$OPS.x #second year minus 2st year
ops_2930 <- inner_join(ops_29,ops_30, by = "Player ID")
ops_2930$deltaOPS <- ops_2930$OPS.y-ops_2930$OPS.x #second year minus 2st year
ops_3031 <- inner_join(ops_30,ops_31, by = "Player ID")
ops_3031$deltaOPS <- ops_3031$OPS.y-ops_3031$OPS.x #second year minus 1st year
ops_3132 <- inner_join(ops_31,ops_32, by = "Player ID")
ops_3132$deltaOPS <- ops_3132$OPS.y-ops_3132$OPS.x #second year minus 1st year
ops_3233 <- inner_join(ops_32,ops_33, by = "Player ID")
ops_3233$deltaOPS <- ops_3233$OPS.y-ops_3233$OPS.x #second year minus 1st year
ops_3334 <- inner_join(ops_33,ops_34, by = "Player ID")
ops_3334$deltaOPS <- ops_3334$OPS.y-ops_3334$OPS.x #second year minus 1st year
ops_3435 <- inner_join(ops_34,ops_35, by = "Player ID")
ops_3435$deltaOPS <- ops_3435$OPS.y-ops_3435$OPS.x #second year minus 1st year
ops_3536 <- inner_join(ops_35,ops_36, by = "Player ID")
ops_3536$deltaOPS <- ops_3536$OPS.y-ops_3536$OPS.x #second year minus 1st year
ops_3637 <- inner_join(ops_36,ops_37, by = "Player ID")
ops_3637$deltaOPS <- ops_3637$OPS.y-ops_3637$OPS.x #second year minus 3st year
ops_3738 <- inner_join(ops_37,ops_38, by = "Player ID")
ops_3738$deltaOPS <- ops_3738$OPS.y-ops_3738$OPS.x #second year minus 3st year
ops_3839 <- inner_join(ops_38,ops_39, by = "Player ID")
ops_3839$deltaOPS <- ops_3839$OPS.y-ops_3839$OPS.x #second year minus 3st year
ops_3940 <- inner_join(ops_39,ops_40, by = "Player ID")
ops_3940$deltaOPS <- ops_3940$OPS.y-ops_3940$OPS.x #second year minus 2st year
