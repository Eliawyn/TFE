for i = 3:8
    eval(sprintf('X%d(:,[3,4])', i)) = eval(sprintf('X%d(:,[4,3])', i));
    eval(sprintf('Y%d(:,[3,4])', i)) = eval(sprintf('Y%d(:,[4,3])', i));
end