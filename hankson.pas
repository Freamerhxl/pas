var p:array[0..10001]of longint;
    can:array[0..50001]of boolean;
    i,j,n,m,t,a0,a1,b0,b1,c1,c2,c3,c4:longint;
    k,ans:int64;
begin
  assign(input,'son.in');reset(input);
  assign(output,'son.out');rewrite(output);
  m:=3;
  p[1]:=2;p[2]:=3;p[3]:=5;
  i:=1;
  while i<=m do
    begin
      for j:=p[i]to maxlongint do
        begin
          k:=int64(p[i])*int64(j);
          if k>50000 then break;
          can[k]:=true;
        end;
      for j:=p[m]+1 to 50000 do
        if can[j]=false then
          begin
            inc(m);
            p[m]:=j;break;
          end;
      inc(i);
    end;
  readln(t);
  for j:=1 to t do
    begin
      readln(a0,a1,b0,b1);
      ans:=1;
      for i:=1 to m do
        begin
          c1:=0;c2:=0;c3:=0;c4:=0;
          while(a0>1)and(a0 mod p[i]=0)do
            begin
              inc(c1);a0:=a0 div p[i];
            end;
          while(a1>1)and(a1 mod p[i]=0)do
            begin
              inc(c2);a1:=a1 div p[i];
            end;
          while(b0>1)and(b0 mod p[i]=0)do
            begin
              inc(c3);b0:=b0 div p[i];
            end;
          while(b1>1)and(b1 mod p[i]=0)do
            begin
              inc(c4);b1:=b1 div p[i];
            end;
          if(c2<c1)and(c3<c4)and(c2<>c4)then
            ans:=0
          else
            begin
              if(c2<c1)or(c3<c4)then continue;
              ans:=ans*int64(c4-c2+1);
            end;
          if ans=0 then break;
        end;
      if(a1<>b1)and((a0<>1)or(b0<>1))then
       ans:=ans*2;
      writeln(ans);
    end;
  close(input);close(output);
end.