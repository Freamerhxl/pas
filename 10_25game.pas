const go:array[1..4,1..2]of -1..1=((-1,0),(1,0),(0,-1),(0,1));
var ans:ansistring;
    wh:array['A'..'Z',0..145,1..2]of integer;
    can:array[-1..14,-1..14]of boolean;
    count:array['A'..'Z']of integer;
    i,j,n,m:longint;
    data:ansistring;
    flag:boolean;
function pass(x1,y1,x2,y2,c,f:integer):boolean;
var i,xx,yy:integer;
begin
  for i:=1 to 4 do
    begin
      xx:=x1+go[i,1];yy:=y1+go[i,2];
      if(f=i)then
        begin
          if(xx=x2)and(yy=y2)then exit(true);
            if can[xx,yy]then
            if pass(xx,yy,x2,y2,c,i)then
              exit(true);
        end
      else
        if(f<>i)and(c<3)then
          begin
            if(xx=x2)and(yy=y2)then exit(true);
            if can[xx,yy]then
            if pass(xx,yy,x2,y2,c+1,i)then
              exit(true);
          end;
    end;
  exit(false);
end;
procedure work(c:integer;now:ansistring);
var ch:char;
    i,j:integer;
begin
  if now>ans then exit;
  if c=n*m then
    begin
      flag:=true;
      ans:=now;
      exit;
    end;
  for ch:='A'to'E'do
  for i:=1 to count[ch]-1 do
    if can[wh[ch,i,1],wh[ch,i,2]]=false then
    for j:=i+1 to count[ch]do
    if can[wh[ch,j,1],wh[ch,j,2]]=false then
    if pass(wh[ch,i,1],wh[ch,i,2],wh[ch,j,1],wh[ch,j,2],0,0)then
      begin
        can[wh[ch,i,1],wh[ch,i,2]]:=true;
        can[wh[ch,j,1],wh[ch,j,2]]:=true;
        work(c+2,now+ch);
        can[wh[ch,i,1],wh[ch,i,2]]:=false;
        can[wh[ch,j,1],wh[ch,j,2]]:=false;
      end;
end;
begin
  assign(input,'game.in');reset(input);
  assign(output,'game.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
    begin
      readln(data);
      for j:=1 to m do
        begin
          inc(count[data[j]]);
          wh[data[j],count[data[j]],1]:=i;
          wh[data[j],count[data[j]],2]:=j;
        end;
    end;
  for i:=0 to n+1 do
    begin
      can[i,0]:=true;
      can[i,m+1]:=true;
    end;
  for i:=0 to m+1 do
    begin
      can[0,i]:=true;
      can[n+1,i]:=false;
    end;
  ans:='zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz';
  work(0,'');
  if flag then writeln(ans)
  else writeln('Game over.');
  close(input);close(output);
end.