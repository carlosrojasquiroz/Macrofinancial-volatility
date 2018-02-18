smpl 2005.1 2016.4
system macro1
macro1.append 		var1=C(1)*var1(-1)+C(5)
macro1.append 		var2=C(6)*var1(-1)+C(7)*var2(-1)+C(8)*var3(-1)+c(9)*var4(-1)+C(10)
macro1.append		  var3=C(11)*var1(-1)+C(12)*var2(-1)+C(13)*var3(-1)+C(14)*var4(-1)+C(15)
macro1.append 		var4=C(16)*var1(-1)+C(17)*var2(-1)+C(18)*var3(-1)+C(19)*var4(-1)+C(20)
macro1.fiml(cov=white)
C(2)=0
C(3)=0
C(4)=0
