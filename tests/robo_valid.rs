robot demo;
task greet begin say 'hello'; end;
begin
    num x;
    text label;
    const limit := 2;
    scan label;
    x := (limit + 1) * 2;
    when x > limit then
        repeat 2 times do greet; end
    orwhen x = 1 then
        move 1;
    otherwise
        turn 2;
    end
end.
