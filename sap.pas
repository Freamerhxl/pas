var g:array[1..200,1..200] of longint;
    vh,dis,di,pre,his:array[0..200] of longint;
    m,n,i,j,delta,tot,s,t,x,y,w,min,minj:longint;
    flag:boolean;
function min2(x,y:longint):longint;
begin
  if x<y then exit(x)
         else exit(y);
end;
begin
  assign(input,'sap.in');
  assign(output,'sap.out');
  reset(input); rewrite(output);
  readln(m,n);
  fillchar(g,sizeof(g),0);
  for i:=1 to m do
    begin
      readln(x,y,w);
      inc(g[x,y],w);
    end;
  fillchar(dis,sizeof(dis),0);
  fillchar(his,sizeof(his),0);
  fillchar(pre,sizeof(pre),0);
  fillchar(vh,sizeof(vh),0);
  vh[0]:=n;
  for i:=1 to n do di[i]:=1;
  s:=1; t:=n;
  i:=s; delta:=maxlongint; tot:=0;
  while dis[s]<n do
    begin
      his[i]:=delta;
      flag:=false;
      for j:=di[i] to n do
        if (g[i,j]>0) and (dis[j]+1=dis[i]) then
          begin
            flag:=true;
            di[i]:=j;
            delta:=min2(delta,g[i,j]);
            pre[j]:=i;
            i:=j;
            if i=t then
              begin
                inc(tot,delta);
                x:=t; y:=pre[x];
                while x<>s do
                  begin
                    inc(g[x,y],delta);
                    dec(g[y,x],delta);
                    x:=pre[x]; y:=pre[y];
                  end;
                i:=s;
                delta:=maxlongint;
              end;
            break;
          end;
      if flag then continue;
      min:=n-1;
      for j:=1 to n do
        if (g[i,j]>0) and (min>dis[j]) then
          begin
            min:=dis[j];
            minj:=j;
          end;
      di[i]:=minj;
      dec(vh[dis[i]]);
      if vh[dis[i]]=0 then break;
      dis[i]:=min+1;
      inc(vh[dis[i]]);
      if i<>s then
        begin i:=pre[i]; delta:=his[i]; end;
    end;
  writeln(tot);
  close(input); close(output);
end.