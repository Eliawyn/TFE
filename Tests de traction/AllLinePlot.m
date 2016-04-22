close all
for i =1:10
    figure
    plot(Traction.Line(i).time,Traction.Line(i).load,'LineWidth',1.5)
end