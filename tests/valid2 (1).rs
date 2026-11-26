robot sorter;
task labelBox begin
    say 'ready';
end;
begin
    num load;
    scan load;
    repeat 3 times
        when load >= 10 then
            do labelBox;
        orwhen load > 5 then
            turn 90;
        orwhen load = 5 then
            say 'five';
        otherwise
            move 1;
        end
    end
end.
