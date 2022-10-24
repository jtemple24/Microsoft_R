Most_Dangerous_Cities <- Crimes_2021 %>% 
  mutate(Crimes_Per_100000_People = (Violent_Crime + Murder + Rape + Robbery +
           Aggrevated_Assault + Property_Crime + Burglary + Theft + 
           Motor_Vehicle_Theft + Arson) / Population * 100000) %>% 
  mutate(Total_Crimes_2021 = Violent_Crime + Murder + Rape + Robbery +
           Aggrevated_Assault + Property_Crime + Burglary + Theft + 
           Motor_Vehicle_Theft + Arson) %>% 
  select(State, City, Population, Total_Crimes_2021, Crimes_Per_100000_People) %>%
  mutate(Crimes_Per_100000_People = trunc(Crimes_Per_100000_People)) %>% 
  arrange(desc(Crimes_Per_100000_People)) %>% 
  filter(Population > 100000)

Top_5_Most_Dangerous_Cities <- Most_Dangerous_Cities %>% 
  select(City, State, Crimes_Per_100000_People) %>% 
  filter(Crimes_Per_100000_People >= 13000)

Top_5_Most_Dangerous_Cities %>% 
  ggplot(aes(City, Crimes_Per_100000_People)) +
  geom_col(aes(fill = State), position = "dodge") +
  ggtitle("US Cities with the highest Crimes per 100,000 people") +
  ggeasy::easy_center_title() +
  ylab("Crimes Per 100,000 people") +
  geom_text(aes(label = Crimes_Per_100000_People), vjust = 1.5, colour = "white")

  


 



          