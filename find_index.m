function a = find_index(time,x)
if x < time(1)
    a = 1;
else
    decimal = floor((x - floor(x)) * 10);
    x = floor(x);
    a = 0;
    for j = 1:length(time)
        if time(j) == x
            a = j;
            while time(a) == x && a < length(time)
                a = a+1;
            end
            a = a-1;
            break
        end
        a = floor(decimal/10 * (a-j)) + j;
    end
end
end