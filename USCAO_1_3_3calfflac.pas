{
ID: fphxlon2
PROG: calfflac
LANG: PASCAL
}
var a,b:array[0..20001]of char;
    w:array[0..20001]of longint;
    i,l,n,r,m,ansl,ansr:longint;
    ch:char;
begin
  assign(input,'calfflac.in');reset(input);
  assign(output,'calfflac.out');rewrite(output);
  while not eof do
    begin
      read(ch);inc(n);b[n]:=ch;
      if b[n]in ['A'..'Z','a'..'z']then
        begin
          inc(m);a[m]:=upcase(b[n]);
          w[m]:=n;
        end;
    end;
  if n=1 then
    begin
      writeln(1);writeln(a[1]);
      close(output);halt;
    end;
  ansl:=1;ansr:=1;
  for i:=2 to m do
    begin
      l:=i-1;r:=i+1;
      while(l>0)and(r<=m)do
        begin
          if a[l]<>a[r]then
            break;
          dec(l);inc(r);
        end;
      inc(l);dec(r);
      if(r-l>ansr-ansl)then
        begin
         ansl:=l;ansr:=r;
        end
      else if(ansr-ansl=r-l)and(l<ansl)then
        begin
          ansl:=l;ansr:=r;
        end;
      if a[i]=a[i-1]then
        begin
          l:=i-2;r:=i+1;
          while(l>0)and(r<=m)do
           begin
          if a[l]<>a[r]then
            break;
          dec(l);inc(r);
        end;
      inc(l);dec(r);
      if(r-l>ansr-ansl)then
        begin
         ansl:=l;ansr:=r;
        end
      else if(ansr-ansl=r-l)and(l<ansl)then
        begin
          ansl:=l;ansr:=r;
        end;
        end;
    end;
  writeln(ansr-ansl+1);
  for i:=w[ansl]to w[ansr]do
    write(b[i]);
  writeln;
  close(input);close(output);
end.