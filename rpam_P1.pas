var f,p:array[0..26,0..193]of longint;
    ti:array[0..26]of real;
    fi,d,t:array[0..26]of longint;
    i,j,n,m,k,h,r,rr,l,pp,ans,ansi,ansj,ttt:longint;
begin
  assign(input,'data.in');reset(input);
  readln(n);
  for i:=1 to n do
    readln;
  readln(n);
  while n<>0 do
    begin
      readln(h);
      h:=h*12;
      for i:=0 to n do
      for j:=0 to h do
        begin
          f[i,j]:=-12321;
          p[i,j]:=0;
        end;
      f[0,0]:=0;
      for i:=1 to n do
        read(fi[i]);  readln;
      for i:=1 to n do
        read(d[i]);     readln;
      if n>1 then
      begin
      for i:=2 to n do
        read(t[i]);
      readln;
      end
      else readln;
      l:=0;rr:=0;r:=0;
      for i:=1 to n do
        begin
          r:=rr;if d[i]=0 then k:=h else k:=fi[i]div d[i]+2;
          if r>h then r:=h;
          for j:=l to r do
          if f[i-1,j]>=0 then
          begin
           for pp:=0 to k do
           if(j+t[i]+pp<=h)then
             begin
               if f[i-1,j]+pp*fi[i]-((pp*(pp-1))>>1)*d[i]>=f[i,j+t[i]+pp]then
                 begin
                   f[i,j+t[i]+pp]:=f[i-1,j]+pp*fi[i]-((pp*(pp-1))>>1)*d[i];
                   p[i,j+t[i]+pp]:=j;
                 end;
               if j+t[i]+pp>rr then rr:=j+t[i]+pp;
             end
           else break;
          end;
        l:=l+t[i];
        end;
      ans:=0;
      for i:=1 to n do
      for j:=0 to h do
        if f[i,j]>ans then begin ansi:=i;ansj:=j;ans:=f[i,j];end;
      t[n+1]:=0;
      ttt:=h;
      for i:=1 to n do ti[i]:=0;
      for i:=ansi downto 2 do
        begin
          j:=p[i,ansj]; ttt:=ttt-(ansj-j);
          ti[i]:=((ansj-j-t[i])*5)/60;
          ansj:=j;
        end;
      ti[1]:=(ttt*5)/60;
      for i:=1 to n-1 do
        write(ti[i]:0:2,' ');
      writeln(ti[n]:0:2);
      writeln(ans);
      writeln;
      readln(n);
    end;
end.
