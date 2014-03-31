var
 a , b : array[0..10001] of longint;
 f : array[0..256] of char;
 c : char;
 n , k , len , i , sum : longint;

procedure qsorta(l , r : longint);
 var
  i , j , mid , temp : longint;
 begin
  i := l;  j := r;
  mid := a[(l + r) shr 1];
   repeat
    while a[i] < mid do inc(i);
    while a[j] > mid do dec(j);
     if i <= j then
      begin
       temp := a[i];
       a[i] := a[j];
       a[j] := temp;
       inc(i);  dec(j);
      end;
   until i > j;
    if i < r then qsorta(i , r);
    if l < j then qsorta(l , j);
 end;

procedure qsortb(l , r : longint);
 var
  i , j , mid , temp : longint;
 begin
  i := l;  j := r;
  mid := b[(l + r) shr 1];
   repeat
    while b[i] < mid do inc(i);
    while b[j] > mid do dec(j);
     if i <= j then
      begin
       temp := b[i];
       b[i] := b[j];
       b[j] := temp;
       inc(i);  dec(j);
      end;
   until i > j;
    if i < r then qsortb(i , r);
    if l < j then qsortb(l , j);
 end;

function midtemp(l , r : longint) : longint;
 var
  mid : longint;
 begin
  while l < r do
   begin
    mid := (l + r) shr 1;
    if f[mid] >= c then r := mid else l := mid + 1;
   end;
  exit(l);
 end;

begin
 assign(input,'data1.in');reset(input);
 assign(output,'p1.out');rewrite(output);
 readln(n);
 sum := 0;
 for k := 1 to n do
  begin
   len := 0;
   read(c);
   while c <> ' ' do
    begin
     if c > f[len] then
      begin
       inc(len);
       f[len] := c;
      end
     else
      f[midtemp(1 , len)] := c;
      b[k] := len;
     read(c);
    end;
   readln(a[k]);
 end;

 qsorta(1 , n);
 qsortb(1 , n);
 for i := 1 to n do
  sum := sum + a[i] * b[n - i + 1];
 writeln(sum);
 close(input);
 close(output);
end.
