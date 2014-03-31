var f:array[0..1,0..1001,0..7,0..15]of qword;
    a,w,k,b,q,p,i,j,m,n,now,last:longint;
    ans:qword;
begin
  assign(input,'wisdom.in');reset(input);
  assign(output,'wisdom.out');rewrite(output);
  readln(a,w,k);readln(b,q,p);
  while(p>=100)do
    begin
      if k>=100then
      begin
        b:=b-15;
        k:=k-100;
      end
      else
        begin
          b:=b-w;k:=k+10;
        end;
      if b<1 then break;
      p:=p-100;a:=a-25;inc(n);
      if a<1 then
        begin
          writeln(1);
          close(output);halt;
        end;
    end;
   if n>5 then n:=5;
   f[0,a,n,p div 10]:=1;
   while b>0 do
     begin
        if k>=100then
        begin
          b:=b-15;
          k:=k-100;
        end
        else
         begin
           b:=b-w;k:=k+10;
         end;
        if b<1 then break;
        now:=1-now;last:=1-now;
        fillchar(f[now],sizeof(f[now]),0);
        for i:=1 to a do
        for j:=0 to 6 do
        for m:=0 to 11 do
          if f[last,i,j,m]>0 then
            begin
              if m>9 then
                begin
                  n:=i-25;if n<0 then n:=0;
                  inc(f[now,n,j+1,m-10],f[last,i,j,m]);
                end
              else
              if j>=5 then
                begin
                  inc(f[now,i,0,m+2],f[last,i,j,m]);
                end
              else
                begin
                  n:=i-q; if n<0 then n:=0;
                  inc(f[now,n,j+1,m],f[last,i,j,m]);
                  inc(f[now,i,0,m+2],f[last,i,j,m]);
                end;
            end;
        for i:=0 to 6 do
        for j:=0 to 11 do
         ans:=ans+f[now,0,i,j];
    end;
  if ans>0 then
    writeln(ans)
  else
    writeln('No answer');
  close(input);close(output);
end.