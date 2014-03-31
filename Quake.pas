var f:Array[0..101,0..501]of longint;
    a:array[0..101]of longint;
    i,j,n,m,k,flag,v,ans:longint;
    can:boolean;
begin
  assign(input,'Quake.in');reset(input);
  assign(output,'Quake.out');rewrite(output);
  readln(n,v,k);
  for i:=2 to n do
    read(a[i]);
  fillchar(f,sizeof(f),$f7);
  flag:=f[0,0];
  if(v<a[n])or(v-a[n]>k)then
    writeln('YI DING YAO JIAN CHI JI HUA SHENG YU')
  else
    begin
      f[n,v]:=v;
      for i:=n-1 downto 2 do
      for j:=a[i+1]to a[i+1]+k do
        if f[i+1,j]>flag then
          begin
            if(j-1>=a[i])and(f[i+1,j]+j-1>f[i,j-1])and(j-1<=a[i]+k)then
              f[i,j-1]:=f[i+1,j]+j-1;
            if(j>=a[i])and(f[i+1,j]+j>f[i,j])and(j<=a[i]+k)
              then f[i,j]:=f[i+1,j]+j;
            if(j+1>=a[i])and(f[i+1,j]+j+1>f[i,j+1])and(j+1<=a[i]+k)then
              f[i,j+1]:=f[i+1,j]+j+1;
          end;
      ans:=-1;
      for i:=a[2]to a[2]+k  do
        if f[2,i]>ans then
          ans:=f[2,i];
      if ans>=0 then writeln(ans/(n-1):0:2)
      else writeln('YI DING YAO JIAN CHI JI HUA SHENG YU');
    end;
  close(input);close(output);
end.