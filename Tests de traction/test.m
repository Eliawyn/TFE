for i = 1:10
    point = find(Traction.Corner(i).time <= 10);
    point = point(end);
    Traction.Corner(i).time(point)
end