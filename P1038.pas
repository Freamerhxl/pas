var tree:array[0..4001]of longint;
       t:array[0..16]of longint;
    n,m,i,n2,x,y:longint;
procedure make(nn:longint);
var i,j,k:longint;
begin
  i:=nn;j:=nn+n-1;
  while i>1 do
    begin
      k:=i;
      while k<j do
        begin
          if tree[k]<tree[k+1]then tree[k>>1]:=tree[k]
            else tree[k>>1]:=tree[k+1];
          k:=k+2;
        end;
      if odd(j)=false then tree[j>>1]:=tree[j];
      i:=i>>1;j:=j>>1;
    end;
end;
function find(x,y:longint):longint;
var i,j,r:longint;
begin
  i:=n2+x-1;j:=n2+y-1;r:=i;
  while i<=j do
    begin
      if tree[i]<tree[r]then r:=i;
      if tree[j]<tree[r]then r:=j;
      if i and 1=1 then inc(i);
      if j and 1=0 then dec(j);
      i:=i>>1;j:=j>>1;
    end;
  exit(tree[r]);
end;
begin
  assign(input,'data.in');reset(input);
  readln(n,m);
  t[1]:=1;
  for i:=2 to maxlongint do
    begin
      t[i]:=t[i-1]*2;
      if t[i]>=n then break;
    end;
  n2:=t[i];
  for i:=n2 to n2+n-1 do
    read(tree[i]);
  make(n2);
  for i:=1 to m do
    begin
      readln(x,y);
      if i<m then write(find(x,y),' ')
      else writeln(find(x,y));
    end;
end.