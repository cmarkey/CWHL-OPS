library(ggplot2)

lgpg_plot <- ggplot(data = league_goals_p_game, aes(x = Season, y = lgpg, group = 1))+
  geom_line(color = "#2BA896", size = 2) +
  labs(x = "Season", y = "Avg Goals per Game", title = "CWHL Goals per Game by Season")+
  theme_light()+
  theme(plot.title = element_text(hjust = 0.5))
  

lgpg_plot
