const p=11129;
var n,c,pp:longint;
    ans:int64;
function f(n:longint):longint;
var temp:longint;
begin
  if n=0 then exit(1);
  if n=1 then exit((c-1)mod(p));
  temp:=f(n>>1) mod (p);
  temp:=(temp*temp)mod (p);
  temp:=(temp*f(n mod 2))mod (p);
  f:=temp;
end;
function get(n,co:longint):int64;
 var a,b,c,d:int64;
     i:longint;
begin
  a:=1;b:=0;
  for i:=2 to n do
    begin
      c:=(b*(co-1)+a-b);
      if odd(i)then d:=c+1
        else d:=c-1;
      b:=c mod(p);
      a:=d mod(p);
    end;
  get:=b*(co-1)mod (p);
  get:=get*co mod (p);
end;
begin
  assign(input,'c.in');reset(input);
  assign(output,'c.out');rewrite(output);
  readln(n,c,pp);
  if pp=0 then
    begin
      ans:=((c mod(p))*(f(n-1)mod(p)))mod p;
    end
  else
  if pp=1 then
    begin
      ans:=get(n,c);
    end
  else
  if pp=2 then
    begin
      if n=1 then ans:=c mod p
      else if n=2 then ans:=((c-1)*c)mod p
      else
        begin
          ans:=get(n-1,c-1)mod(p);
          ans:=(ans*c)mod p
        end;
    end;
  writeln(ans mod p);
  close(input);close(output);
end.