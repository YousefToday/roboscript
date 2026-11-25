{robot picker1;
begin
 num steps;
 steps := 4;
 when d<2 then
 move steps * d + 1;
 orwhen 2=1 then
 d := 1;
 otherwise
 f := 5;
 end
 turn 90;
 say 'distance', steps;
end.}
robot challenger;
begin
    when a then
        move 1;
    orwhen b then
        when c then
            turn 90;
        otherwise
            say 'inner fallback';
        
    orwhen d then
        move 2;
    orwhen e then
        move 3;
    otherwise
        say 'outer fallback';
    end
end.