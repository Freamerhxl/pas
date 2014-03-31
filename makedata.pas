var map:array[0..501,0..501]of boolean;
    i,j,n,x,y,z:longint;
begin
  assign(output,'input.txt');rewrite(output);
  randomize;
  writeln(500,' ',500);
  for i:=1 to 500 do
    begin
      x:=x+random(100)+1;
      y:=random(100)+1;
      z:=random(100)+1;
      writeln(x,' ',y,' ',z);
    end;
  close(output);
end.
