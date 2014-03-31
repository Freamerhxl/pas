var h:array[0..100001]of longint;
    f:array[0..21,0..21]of longint;
    a:array[0..21]of longint;
    i,j,n,m,k,p,w,op,t,ans:longint;
procedure swap(var a,b:longint);
begin
  a:=a xor b;
  b:=a xor b;
  a:=a xor b;
end;
procedure up(j:longint);
var i:longint;
begin
  i:=j>>1;
  while i>0 do
    begin
      if h[j]<h[i]then
        begin
          swap(h[i],h[j]);j:=i;i:=j>>1;
        end
      else exit;
    end;
end;
procedure down(i:longint);
var j:longint;
begin
  j:=i<<1;
  while j<=n do
    begin
      if(j+1<=n)and(h[j+1]<h[j])then inc(j);
      if h[i]>h[j]then
        begin
          swap(h[i],h[j]);i:=j;j:=i<<1;
        end
      else break;
    end;
end;
begin
  assign(input,'Orz.in');reset(input);
  assign(output,'Orz.out');rewrite(output);
  readln(n,m,k);
  t:=0;
  for i:=1 to n do
    begin
      read(h[i]);
      inc(t);
      up(t);
    end;
  for p:=1 to k do
    begin
      fillchar(f,sizeof(f),$7f);

      for i:=1 to m do
        begin
          read(op);
          a[op]:=h[1];h[1]:=h[n];dec(n);down(1);
        end;

      for i:=1 to m do
        a[m+i]:=a[i];

      for i:=1 to 2*m do
        begin
          a[i]:=a[i-1]+a[i];
          f[i,i]:=0;
        end;

      for i:=1 to m-1 do
        begin
          for t:=1 to 2*m do
            begin
              w:=i+t;
              if w>2*m then break;
              for op:=t to w-1 do
                if f[t,op]+f[op+1,w]+a[w]-a[t-1]<f[t,w]then
                  f[t,w]:=f[t,op]+f[op+1,w]+a[w]-a[t-1];
            end;
        end;

      op:=maxlongint;

      for i:=1 to m do
       if f[i,i+m-1]<op then
         op:=f[i,i+m-1];

      inc(n);h[n]:=a[m];up(n);
      ans:=ans+op;
    end;
  writeln(ans);
  close(input);close(output);
end.