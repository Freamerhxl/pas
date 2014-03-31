var map:array[0..101,0..101]of longint;
    dis:array[0..101]of longint;
    done:array[0..101]of boolean;
    f:array[0..355]of longint;
    i,j,n,m,k,x,y,ans,p:longint;
    st:string;
    ch:char;
begin
  readln(n,m);
  fillchar(map,sizeof(map),43);
  for i:=1 to m do
    begin
      read(x,y);read(ch);
      readln(st);
      if st[1]in['1'..'9']then
        begin
          val(st,k,k);
          if k<map[x,y]then
            begin
              map[x,y]:=k;
              map[y,x]:=k;
            end;
        end
      else
        begin
          if st='memory' then
            begin
              map[x,y]:=0;
              map[y,x]:=0;
            end
          else
          if pos('memory',st)>0 then
            begin
              if 1<map[x,y]then
                begin
                  map[x,y]:=1;
                  map[y,x]:=1;
                end;
            end
          else
            begin
              k:=1;
              for j:=1 to length(st)do
                f[j]:=1;
              for j:=2 to length(st)do
              begin
              for p:=1 to j-1 do
              if(st[j]>st[p])and(f[p]+1>f[j])then
                begin
                  f[j]:=f[p]+1;
                  if f[j]>k then k:=f[j];
                  if k>5 then break;
                end;
              if k>5 then break;
              end;
              if k>=6 then
                begin
                  if 2<map[x,y]then
                    begin
                      map[x,y]:=2;
                      map[y,x]:=2;
                    end;
                end
              else
                begin
                  if length(st)<map[x,y]then
                    begin
                      map[x,y]:=length(st);
                      map[y,x]:=length(st);
                    end;
                end;
            end;
        end;
    end;
  fillchar(dis,sizeof(dis),43);
  dis[1]:=0;
  for i:=1 to n do
    begin
      y:=maxlongint;
      for j:=1 to n do
        if(done[j]=false)and(dis[j]<y)then
         begin
           y:=dis[j];
           x:=j;
         end;
      done[x]:=true;
      for j:=1 to n do
        if(done[j]=false)and(dis[x]+map[x,j]<dis[j])then
          dis[j]:=dis[x]+map[x,j];
    end;
  writeln(dis[n]);
end.