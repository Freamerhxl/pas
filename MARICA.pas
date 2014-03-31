var map:array[0..1001,0..1001]of boolean;
    dis,link:array[0..1001,0..1001]of longint;
    h,w,p,d:array[0..1001]of longint;
    done:array[0..1001]of boolean;
    i,j,n,m,k,x,y,z,ans:longint;
procedure up(j:longint);
var i,t:longint;
begin
  t:=h[j];i:=j>>1;
  while i>0 do
    begin
      if d[t]<d[h[i]]then
        begin
          h[j]:=h[i];w[h[j]]:=j;j:=i;i:=j>>1;
        end
      else break;
    end;
  h[j]:=t;w[t]:=j;
end;
procedure down(i:longint);
var j,t:longint;
begin
  t:=h[i];j:=i<<1;
  while j<=n do
    begin
      if(j+1<=n)and(d[h[j+1]]<d[h[j]])then inc(j);
      if d[t]>d[h[j]]then
        begin
          h[i]:=h[j];w[h[i]]:=i;i:=j;j:=i<<1;
        end
      else break;
    end;
  h[i]:=t;w[t]:=i;
end;
begin
  assign(input,'MARICA.in');reset(input);
  assign(output,'MARICA.out');rewrite(output);
  readln(n,m);
  fillchar(dis,sizeof(dis),43);
  for i:=1 to m do
    begin
      readln(x,y,z);
      map[x,y]:=true;map[y,x]:=true;
      dis[x,y]:=z;dis[y,x]:=z;
      inc(link[x,0]);link[x,link[x,0]]:=y;
      inc(link[y,0]);link[y,link[y,0]]:=x;
    end;
  fillchar(d,sizeof(d),43);
  d[1]:=0;
  fillchar(done,sizeof(done),true);
  for i:=1 to n do
   begin
     h[i]:=i;w[i]:=i;
   end;
  for i:=1 to n do
    begin
      x:=h[1];z:=d[x];done[x]:=false;d[x]:=d[0]+1;if x=n then break;
      down(1);
      for j:=1 to link[x,0]do
        if(done[link[x,j]])and(z+dis[x,link[x,j]]<d[link[x,j]])then
          begin
            d[link[x,j]]:=z+dis[x,link[x,j]];p[link[x,j]]:=x;
            up(w[link[x,j]]);
          end;
    end;
  y:=n;
  while y<>1 do
    begin
      for i:=1 to n do
        begin
          h[i]:=i;w[i]:=i;
          d[i]:=d[0];done[i]:=true;
        end;
      d[1]:=0;
      map[p[y],y]:=false;map[y,p[y]]:=false;
      for i:=1 to n do
        begin
          x:=h[1];z:=d[x];done[x]:=false;d[x]:=d[0]+1;if x=n then break;
          down(1);
          for j:=1 to link[x,0]do
            if(done[link[x,j]])and(map[x,link[x,j]])and(z+dis[x,link[x,j]]<d[link[x,j]])then
              begin
                d[link[x,j]]:=z+dis[x,link[x,j]];
                up(w[link[x,j]]);
              end;
        end;
     map[p[y],y]:=true;map[y,p[y]]:=true;
     if done[n]=false then
     if z<d[0]then
     if z>ans then ans:=z;
     y:=p[y];
    end;
  writeln(ans);
  close(input);close(output);
end.