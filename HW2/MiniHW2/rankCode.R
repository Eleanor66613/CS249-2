checker<-function(data){
	result<-c()
  	checkName<-data$name[1]
  	checkPercent<-data$percent[1]
  	count<-0 
  	for(i in 1: nrow(data)){
      
       if(checkName==data$name[i]){
          if(count==-1){
              
          }else if(data$percent[i]>checkPercent){
              count<-count+1
			  checkPercent<-data$percent[i]
          }else{
              count<--1
          }
      }else{
          if(count>=15){
              result<-append(result, checkName)
          }
          count<-1
          checkName<-data$name[i]
		  checkPercent<-data$percent[i]
	   }
	}
	result
}
