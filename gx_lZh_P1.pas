var n,m,i,j,t,x,y,c:longint;
    a:array[0..10001]of longint;
    ch:char;
begin
  readln(n);
  readln(m);
      for i:=1 to m do
        begin
          read(ch);
          if ch='N' then
            begin
              readln(t,x);
              if t>n then begin writeln('wrong');continue;end;
              y:=0;c:=0;
              for j:=1 to n do
              begin
                if c+n-j+1<t then
                  begin
                    y:=0;c:=0;break;
                  end;
                if a[j]<x then
                  begin
                    if y=0 then y:=j;
                    inc(c);if c>=t then break;
                  end
                else
                  begin
                    c:=0;y:=0;
                  end;
              end;
              if y=0 then writeln('wrong')
              else
              begin
                writeln(y);
                for j:=y to y+t-1 do
                  a[j]:=x;
              end;
            end
          else
          if ch='D' then
            begin
              readln(x,y);
              t:=0;
              for j:=x to y do
                begin
                if a[j]>t then t:=a[j];
                a[j]:=0;
                end;
              if t=0 then writeln('wrong')
              else writeln(t);
            end
          else
          if ch='A' then
            begin
              readln(x);
              if a[x]=0 then writeln('wrong')
              else writeln(a[x]);
            end;
        end;
end.