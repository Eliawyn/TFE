close all
for i =1:10
    figure
    plot(Traction.Corner(i).time,Traction.Corner(i).load,'LineWidth',1.5)
end