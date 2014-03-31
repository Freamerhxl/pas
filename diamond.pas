var a:array[0..1800]of ansistring;
    f:array[-10..1800,-10..1800,1..2]of integer;
    h:array[0..1800,0..1800]of integer;
//    b:array[0..1801]of longint;
    i,j,n,m,ans,k,x,y,xx,yy:longint;
function fmin(a,b:integer):integer;
begin
  if a<b then exit(a)else exit(b);
end;
begin
  assign(input,'diamond.in');reset(input);
  assign(output,'diamond.out');rewrite(output);
  readln(n);
  for i:=1 to 2*n do
    readln(a[i]);
  xx:=1;yy:=n;
  for i:=1 to n do
   begin
      x:=xx+i;y:=yy+i;
      for j:=1 to n do
        begin
          if a[x-1,y-1]='/' then h[x,y]:=1
          else
          h[x,y]:=h[x-1,y-1]+1;
          if a[x,y]='/' then
            begin
              if a[x-1,y]='\' then begin f[x,y,1]:=1;f[x,y,2]:=h[x,y];end
              else
              if(h[x,y]=f[x-1,y+1,2])and(a[x-1,y+1]='/')then
               begin
                 f[x,y,1]:=f[x-1,y+1,1]+1;
                 f[x,y,2]:=h[x,y];
               end;
            end;
          inc(x);dec(y);
        end;
   end;
  xx:=1;yy:=n+1;
  for i:=1 to n  do
    begin
      x:=xx+i;y:=yy-i;
      for j:=1 to n do
        begin
          if a[x-1,y+1]='\' then h[x,y]:=1
          else h[x,y]:=h[x-1,y+1]+1;
          if a[x,y]='\' then
            begin
              if a[x-1,y]='/' then begin f[x,y,1]:=1;f[x,y,2]:=h[x,y];end
              else
              if(h[x,y]=f[x-1,y-1,2])and(a[x-1,y-1]='\')then
                begin
                  f[x,y,1]:=f[x-1,y-1,1]+1;
                  f[x,y,2]:=h[x,y];
                end;
              if(f[x,y,1]<>0)and(f[x,y,2]<>0)and(f[x,y+1,1]<>0)and(f[x,y+1,2]<>0)then
                begin
                  if(f[x,y,1]=f[x,y+1,2])and(f[x,y,2]=f[x,y+1,1])then inc(ans);
                end;
            end;
          inc(x);inc(y);
        end;
    end;
  writeln(ans);
  close(input);close(output);
end.