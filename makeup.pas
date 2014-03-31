var data:array[0..401,0..4]of longint;
       f:array[0..1001]of longint;
    i,j,n,m,k,ans:longint;
begin
  assign(input,'makeup.in');reset(input);
  assign(output,'makeup.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
    readln(data[i,1],data[i,2],data[i,3]);
  for i:=1 to n do
    begin
      for j:=5 to m do
        if(j*(data[i,1]+data[i,3])<m)then
          begin
            for k:=0 to m-j*(data[i,1]+data[i,3])do
              if f[k]+j*(data[i,2]+data[i,3])>f[k+j*(data[i,1]+data[i,3])]then
                f[k+j*(data[i,1]+data[i,3])]:=f[k]+j*(data[i,2]+data[i,3]);
          end
        else break;
      for j:=0 to m-data[i,1]do
        if f[j]+data[i,2]>f[j+data[i,1]]then
          f[j+data[i,1]]:=f[j]+data[i,2];
    end;
  ans:=0;
  for i:=0 to m do
    if f[i]>ans then ans:=f[i];
  writeln(ans);
  close(input);close(output);
end.