var f:array[-1..501,-1..101,-1..101]of integer;
    st:ansistring;
    i,j,k,n,m,c1,c2,ans,x,y:longint;
function fmax(a,b:integer):integer;
begin if a>b then exit(a)else exit(b); end;
function fmin(a,b:integer):integer;
begin if a<b then exit(a)else exit(b); end;
begin
  assign(input,'welcome.in');reset(input);
  assign(output,'welcome.out');rewrite(output);
  readln(n,m);
  readln(st);
  for i:=1 to length(st)do
    begin
      if st[i]='j' then inc(c1) else inc(c2);
    end;
  fillchar(f,sizeof(f),$f7);
  f[0,0,0]:=0;f[1,0,0]:=0;
  for i:=2 to n do
  begin
  x:=ord(st[i-1]='z');
  y:=ord(st[i]='j');
  for j:=0 to fmin(c1,m) do
  for k:=0 to fmin(c2,m) do
    begin
      f[i,j,k]:=fmax(f[i-1,j,k],f[i-2,j-y,k-x]+1);
      if (j=k)then if f[i,j,k]>ans then ans:=f[i,j,k];
    end;
  end;
  writeln(ans);
  close(input);close(output);
end.
