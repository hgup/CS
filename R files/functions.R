area <- function(sides) {
  s = sum(sides)/2
  area = s
  for(i in sides){
   area <- area * (s-i) 
  }
  area <- sqrt(area); area
}

find_area <- function(){
  input <- scan(n = 3)
  area(input)
}

find_area()

`%fights%` <- function(x, y){
 mx = max(x,y)
 return(cat(as.character(mx),"wins"))
}

`%>%` <- function(input, func){
  func(input)
}

