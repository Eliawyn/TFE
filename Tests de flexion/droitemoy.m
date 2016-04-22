t = [0 0.3 0.8 1.1 1.6 2.3];
y = [0.6 0.67 1.01 1.35 1.47 1.25];
t2 = 0:0.1:2.8; 
p5= polyfit(t,y,1); 
y3 = polyval(p5,t2);
figure;
plot(t,y,'o',t2,y3);