var f:array[0..101,0..101,0..3]of longint;
    data:array[0..101,1..3]of longint;
    i,j,n,m,k,ans,ii,jj,x1,y1,x2,y2:longint;
begin
  assign(input,'d.in');reset(input);
  assign(output,'d.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
    readln(data[i,1],data[i,2],data[i,3]);
  for i:=1 to n do
  for j:=1 to 3 do
   f[1,i,j]:=data[i,j];
  for i:=2 to n do
  begin
  for j:=1 to i-1 do
  for ii:=1 to 3 do
  begin
  x1:=(ii+1)mod 3+1;
  y1:=ii mod 3+1;
  for jj:=1 to 3 do
  begin
    x2:=(jj+1)mod 3+1;
    y2:=jj mod 3+1;
    if(data[i,x1]<=data[j,x2])and(data[i,y1]<=data[j,y2])and(f[1,j,jj]+data[i,ii]>f[1,i,ii])then
      f[1,i,ii]:=f[1,j,jj]+data[i,ii];
    if(data[i,x1]<=data[j,y2])and(data[i,y1]<=data[j,x2])and(f[1,j,jj]+data[i,ii]>f[1,i,ii])then
      f[1,i,ii]:=f[1,j,jj]+data[i,ii];
  end;
  end;
  end;
  for k:=2 to m do
  begin
  for i:=k to n do
    begin
      for j:=k-1 to i-1 do
      for ii:=1 to 3 do
      for jj:=1 to 3 do
      if f[k-1,j,jj]+data[i,ii]>f[k,i,ii]then f[k,i,ii]:=f[k-1,j,jj]+data[i,ii];

      for j:=k to i-1 do
      for ii:=1 to 3 do
      begin
        x1:=(ii+1)mod 3+1;
        y1:=ii mod 3+1;
        for jj:=1 to 3 do
          begin
            x2:=(jj+1)mod 3+1;
            y2:=jj mod 3+1;
            if(data[i,x1]<=data[j,x2])and(data[i,y1]<=data[j,y2])and(f[k,j,jj]+data[i,ii]>f[k,i,ii])then
            f[k,i,ii]:=f[k,j,jj]+data[i,ii];
            if(data[i,x1]<=data[j,y2])and(data[i,y1]<=data[j,x2])and(f[k,j,jj]+data[i,ii]>f[k,i,ii])then
            f[k,i,ii]:=f[k,j,jj]+data[i,ii];
          end;
      end;
    end;
  end;
  for i:=m to n do
  for j:=1 to 3 do
    if f[m,i,j]>ans then ans:=f[m,i,j];
  writeln(ans);
  close(input);close(output);
end.