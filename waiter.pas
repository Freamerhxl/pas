const maxn=2501;
var f:array[0..maxn,0..maxn]of longint;
    a:array[0..maxn]of longint;
    i,j,k,ans,n:longint;
begin
  assign(input,'waiter.in');reset(input);
  assign(output,'waiter.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    read(a[i]);
  if n<=1 then
    writeln(0)
  else
  if n=2 then
    writeln(a[1]*a[2])
  else
  begin
  for i:=2 to n-1 do
   begin
     for j:=0 to i-2 do
       begin
         if f[i-1,j]+a[i]*a[i-1]>f[i,j]then
           f[i,j]:=f[i-1,j]+a[i]*a[i-1];

         if f[i-1,j]+a[i]*a[j]>f[i-1,i]then
           f[i-1,i]:=f[i-1,j]+a[i]*a[j];

         if f[j,i-1]+a[j]*a[i]>f[i,i-1]then
           f[i,i-1]:=f[j,i-1]+a[j]*a[i];

         if f[j,i-1]+a[i]*a[i-1]>f[j,i]then
           f[j,i]:=f[j,i-1]+a[i]*a[i-1];
       end;
   end;
   for i:=0 to n-2 do
     begin
       if f[n-1,i]+a[n-1]*a[n]+a[i]*a[n]>ans then
         ans:=f[n-1,i]+a[n-1]*a[n]+a[i]*a[n];
       if f[i,n-1]+a[n-1]*a[n]+a[i]*a[n]>ans then
         ans:=f[i,n-1]+a[n-1]*a[n]+a[i]*a[n];
     end;
   writeln(ans);
  end;
  close(input);close(output);
end.