var maxl,minl,maxr,minr,maxu,minu,maxd,mind:array[0..101]of longint;
    sum:array[0..101,0..101]of longint;
    i,j,n,m,k,p,k1,k2,ans:longint;
begin
  assign(input,'matrix.in');reset(input);
//  assign(output,'matrix.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
  for j:=1 to m do
    begin
      read(sum[i,j]);
      sum[i,j]:=sum[i-1,j]+sum[i,j];
    end;
  fillchar(maxl,sizeof(maxl),$f7);
  fillchar(minl,sizeof(minl),$7f);
  fillchar(maxr,sizeof(maxr),$f7);
  fillchar(minr,sizeof(minr),$7f);
  fillchar(maxu,sizeof(maxu),$f7);
  fillchar(minu,sizeof(minu),$7f);
  fillchar(maxd,sizeof(maxd),$f7);
  fillchar(mind,sizeof(mind),$7f);
  for i:=1 to n do
  for j:=i to n do
    begin
      k1:=0;k2:=0;
      for p:=1 to m do
        begin
          if k1<0 then k1:=0; k1:=k1+sum[j,p]-sum[i-1,p];
          if k2>0 then k2:=0; k2:=k2+sum[j,p]-sum[i-1,p];
          if k1>maxr[p]then maxr[p]:=k1;
          if k2<minr[p]then minr[p]:=k2;
          if k1>maxu[i]then maxu[i]:=k1;
          if k2<minu[i]then minu[i]:=k2;
          if k1>maxd[j]then maxd[j]:=k1;
          if k2<mind[j]then mind[j]:=k2;
        end;
      k1:=0;k2:=0;
      for p:=m downto 1 do
        begin
          if k1<0 then k1:=0;k1:=k1+sum[j,p]-sum[i-1,p];
          if k2>0 then k2:=0;k2:=k2+sum[j,p]-sum[i-1,p];
          if k1>maxl[p]then maxl[p]:=k1;
          if k2<minl[p]then minl[p]:=k2;
        end;

    end;
  ans:=-maxlongint;
  for i:=2 to n do
    begin
      if maxd[i-1]>maxd[i]then maxd[i]:=maxd[i-1];
      if mind[i-1]<mind[i]then mind[i]:=mind[i-1];
    end;
  for i:=n-1 downto 1 do
    begin
      if maxu[i+1]>maxu[i]then maxu[i]:=maxu[i+1];
      if minu[i+1]<minu[i]then minu[i]:=minu[i+1];
    end;
  for i:=2 to m do
    begin
      if maxr[i-1]>maxr[i]then maxr[i]:=maxr[i-1];
      if minr[i-1]<minr[i]then minr[i]:=minr[i-1];
    end;
  for i:=m-1 downto 1 do
    begin
      if maxl[i+1]>maxl[i]then maxl[i]:=maxl[i+1];
      if minl[i+1]<minl[i]then minl[i]:=minl[i+1];
    end;
  for i:=1 to n-1 do
    begin
      if maxd[i]*maxu[i+1]>ans then ans:=maxd[i]*maxu[i+1];
      if mind[i]*minu[i+1]>ans then ans:=mind[i]*minu[i+1];
    end;
  for i:=1 to m-1 do
    begin
      if maxr[i]*maxl[i+1]>ans then ans:=maxr[i]*maxl[i+1];
      if minr[i]*minl[i+1]>ans then ans:=minr[i]*minl[i+1];
    end;
  writeln(ans);
  close(input);close(output);
end.