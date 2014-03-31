var g:array[0..201,0..201]of longint;
    dis,vah,p,now,pre:array[0..201]of longint;
    i,j,n,m,k,mf,nf,s,t,x,y,z,minh,mini:longint;
    flag:boolean;
begin
  assign(input,'Isap.in');reset(input);
  assign(output,'Isap.out');rewrite(output);
  nf:=maxlongint;
  readln(m,n);
  s:=1;t:=n;
  for i:=1 to m do
    begin
      readln(x,y,z);
      inc(g[x,y],z);
    end;
  nf:=maxlongint;x:=s;vah[0]:=n;
  for i:=1to n do p[i]:=1;
  while dis[s]<n do
    begin
      now[x]:=nf;flag:=false;
      for i:=p[x]to n do
       if(g[x,i]>0)and(dis[x]=dis[i]+1)then
         begin
           flag:=true;
           p[x]:=i;if g[x,i]<nf then nf:=g[x,i];
           pre[i]:=x;
           x:=i;
           if x=t then
             begin
               mf:=mf+nf;
               while x<>s do
               begin
               dec(g[pre[x],x],nf);
               inc(g[x,pre[x]],nf);
               x:=pre[x];
               end;
               nf:=maxlongint;
             end;
          break;
         end;
       if flag then continue;
       minh:=n-1;
       for i:=1 to n do
        if(dis[i]<minh)and(g[x,i]>0)then
        begin
          minh:=dis[i];
          mini:=i;
        end;
       p[x]:=mini;
       dec(vah[dis[x]]);
       if vah[dis[x]]=0 then break;
       dis[x]:=minh+1;inc(vah[minh+1]);
       if x<>s then
         begin
           x:=pre[x];
           nf:=now[x];
         end;
    end;
  writeln(mf);
  close(input);close(output);
end.