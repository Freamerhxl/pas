var n,ans:integer;
    t,s,x,y:longint;
    done:array[0..200,0..20000]of boolean;
    a,b,c:array[0..2000000]of integer;
procedure swap(var a,b:longint);
begin
  a:=a xor b;b:=a xor b;a:=a xor b;
end;
begin
  readln(n);
  a[0]:=0;b[0]:=1;
  done[0,1]:=true;
  s:=1;
  repeat
    if(a[t]=n)or(b[t]=n)then
      begin
        ans:=c[t];break;
      end;

    x:=a[t]+a[t];y:=a[t];
    if(x=n)or(y=n)then
      begin
        ans:=c[t]+1;break;
      end;

    if x>y then swap(x,y);
    if(x<=200)and(y<=20000)then
    if done[x,y]=false then
      begin
        a[s]:=x;b[s]:=y;c[s]:=c[t]+1;inc(s);done[x,y]:=true;
      end;

    x:=a[t]+a[t];y:=b[t];
    if(x=n)or(y=n)then
      begin
        ans:=c[t]+1;break;
      end;
    if x>y then swap(x,y);
    if(x<=200)and(y<=20000)then
    if done[x,y]=false then
      begin
        a[s]:=x;b[s]:=y;c[s]:=c[t]+1;inc(s);done[x,y]:=true;
      end;

    x:=a[t]+b[t];y:=a[t];
    if(x=n)or(y=n)then
      begin
        ans:=c[t]+1;break;
      end;
    if x>y then swap(x,y);
    if(x<=200)and(y<=20000)then
    if done[x,y]=false then
      begin
        a[s]:=x;b[s]:=y;c[s]:=c[t]+1;inc(s);done[x,y]:=true;
      end;

    x:=a[t]+b[t];y:=b[t];
    if(x=n)or(y=n)then
      begin
        ans:=c[t]+1;break;
      end;
    if x>y then swap(x,y);
    if(x<=200)and(y<=20000)then
    if done[x,y]=false then
      begin
        a[s]:=x;b[s]:=y;c[s]:=c[t]+1;inc(s);done[x,y]:=true;
      end;

    x:=b[t]+b[t];y:=a[t];
    if(x=n)or(y=n)then
      begin
        ans:=c[t]+1;break;
      end;
    if x>y then swap(x,y);
    if(x<=200)and(y<=20000)then
    if done[x,y]=false then
      begin
        a[s]:=x;b[s]:=y;c[s]:=c[t]+1;inc(s);done[x,y]:=true;
      end;

    x:=b[t]+b[t];y:=b[t];
    if(x=n)or(y=n)then
      begin
        ans:=c[t]+1;break;
      end;
    if x>y then swap(x,y);
    if(x<=200)and(y<=20000)then
    if done[x,y]=false then
      begin
        a[s]:=x;b[s]:=y;c[s]:=c[t]+1;inc(s);done[x,y]:=true;
      end;

    x:=abs(a[t]-b[t]);y:=b[t];
    if(x=n)or(y=n)then
      begin
        ans:=c[t]+1;break;
      end;
    if x>y then swap(x,y);
    if(x<=200)and(y<=20000)then
    if done[x,y]=false then
      begin
        a[s]:=x;b[s]:=y;c[s]:=c[t]+1;inc(s);done[x,y]:=true;
      end;

    x:=abs(a[t]-b[t]);y:=a[t];
    if(x=n)or(y=n)then
      begin
        ans:=c[t]+1;break;
      end;
    if x>y then swap(x,y);
    if(x<=200)and(y<=20000)then
    if done[x,y]=false then
      begin
        a[s]:=x;b[s]:=y;c[s]:=c[t]+1;inc(s);done[x,y]:=true;
      end;
    inc(t);
  until t=s;
  writeln(ans);
end.
