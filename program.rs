robot picker1;
{ a minimal RoboScript program }
begin
 num steps;
 steps := 4;
 move steps * d + 1;
 turn 90;
 say 'distance', steps;
end.