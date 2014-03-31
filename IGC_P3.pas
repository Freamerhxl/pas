var i,j,k,l,r,mid,ans,sum,n,m,all:longint;
    a,b:array[0..51]of longint;
    done:array[0..51]of boolean;
function can(x,aa:longint):boolean;
var i:longint;
begin
  if(n-x+1)*mid-b[x]<aa then exit(false);
  if(aa<=mid)then exit(true);
  for i:=1 to m do
    if done[i]then
      begin
        if(b[x]+a[i]<=mid)then
          begin
            done[i]:=false;b[x]:=b[x]+a[i];
            if can(x,aa-a[i])then exit(true);
            done[i]:=true;b[x]:=b[x]-a[i];
          end
        else
          begin
            b[x+1]:=a[i];done[i]:=false;
            if can(x+1,aa-a[i])then exit(true);
            b[x+1]:=0;done[i]:=true;
          end;
      end;
end;
begin
  assign(input,'IGC_P3.in');reset(input);
  assign(output,'IGC_P3.out');rewrite(output);
  readln(n,m);
  for i:=1 to m do
    begin
      read(a[i]);
      sum:=sum+a[i];
      if a[i]>l then l:=a[i];
      for j:= i downto 2 do
       if a[j]>a[j-1]then
         begin
           a[j]:=a[j]xor a[j-1];
           a[j-1]:=a[j]xor a[j-1];
           a[j]:=a[j]xor a[j-1];
         end;
    end;
  r:=sum div n*3;
  mid:=(l+r)>>1;
  repeat
    fillchar(done,sizeof(done),true);
    fillchar(b,sizeof(b),0);
    if can(1,sum)then
      begin
        ans:=mid;r:=mid-1;
      end
    else l:=mid+1;
    mid:=(l+r)>>1;
  until l>r;
  writeln(ans);
  close(output);
end.