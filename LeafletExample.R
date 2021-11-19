Points <- read.csv("Points.csv")

library(leaflet)

l <-leaflet()

esri <- grep("^Esri", providers, value = TRUE)
esri <- esri[c(5,2,4,10)]

for (provider in esri) {
  l <- l %>% addProviderTiles(provider, group = provider, 
                              options = providerTileOptions(minZoom = 0, maxZoom = 100))    
}

l <- l %>% 
  addCircleMarkers(data = Points, lng = ~lon, lat = ~lat, opacity = 0.8, fillOpacity = 0.8) 

l %>% 
  addLayersControl(baseGroups = names(esri),
                   options = layersControlOptions(collapsed = TRUE))
