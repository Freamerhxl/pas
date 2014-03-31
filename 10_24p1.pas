const p=100000000;
      pp=22222223;
var s:ansistring;
    t:array[0..2001,0..101]of longint;
    n,ans:array[0..1001]of longint;
    i,j,m,k,num,st,can,op:longint;
    temp:qword;
    done:boolean;
function campare(x:longint):longint;
var i:longint;
begin
  if t[x,0]>n[0]then exit(-1)
  else if t[x,0]<n[0]then exit(1)
  else
    begin
      campare:=0;
      for i:=n[0]downto 1 do
        if n[i]>t[x,i]then exit(1)
        else if n[i]<t[x,i]then exit(-1);
    end;
end;
begin
  t[1,1]:=1;t[1,0]:=1;
  for i:=2 to 2000 do
    begin
      for j:=1 to  t[i-1,0]do
        t[i,j]:=t[i-1,j]*2;
      t[i,0]:=t[i-1,0];
      for j:=1 to t[i,0]do
        begin
          t[i,j+1]:=t[i,j+1]+t[i,j]div p;
          t[i,j]:=t[i,j]mod p;
        end;
      while t[i,t[i,0]+1]>0 do inc(t[i,0]);
      if t[i,0]*8>308 then break;
    end;
  m:=i;
  ans[1]:=1;
  for i:=2 to m do
    ans[i]:=(ans[i-1]*2)mod pp;
  while not eof do
    begin
      readln(s);k:=1;num:=0;
      fillchar(n,sizeof(n),0);
      for i:=length(s)downto 1 do
        begin
          num:=(ord(s[i])-ord('0'))*k+num;
          k:=k*10;
          if k=p then
            begin
              inc(n[0]);n[n[0]]:=num;
              num:=0;k:=1;
            end;
        end;
      if num>0 then
        begin
          inc(n[0]);n[n[0]]:=num;
          num:=0;k:=1;
         end;
      inc(n[1]);
      for i:=1 to n[0]do
        begin
          n[i+1]:=n[i+1]+n[i]div p;
          n[i]:=n[i]mod p;
        end;
      while n[n[0]+1]>0 do inc(n[0]);
      st:=m;done:=false;
      for i:=0 to m do
        begin
          for j:=st downto 1 do
          begin
            can:=campare(j);
            if can=1 then
              begin
                for k:=1 to t[j,0]do
                  n[k]:=n[k]-t[j,k];
                for k:=1 to n[0]-1 do
                  if n[k]<0 then
                    begin
                      n[k]:=n[k]+p;
                      dec(n[k+1]);
                    end;
                while n[n[0]]=0 do dec(n[0]);
                break;
              end
            else
            if can=0 then
             begin
               done:=true;
               writeln(ans[j+i]);
               break;
             end;
         end;
            st:=j-1;
            if done then break;
        end;
    end;
end.
