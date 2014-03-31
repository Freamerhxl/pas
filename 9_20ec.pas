program dfx;
var
	i,j,k,l,n,m,ans:longint;
        a,b:array[0..1000]of longint;
	f:array[0..1000,0..1000]of longint;

function max(a,b:longint):longint;
begin
        if a>b then exit(a)     else exit(b);
end;


procedure main;
begin
        for i:=1 to n do
        for j:=1 to n do
        begin
                f[i,j]:=max(f[i-1,j],f[i,j-1]);
                if a[i]=b[j] then
                f[i,j]:=max(f[i,j],f[i-1,j-1]+1);
        end;
end;

begin
                readln(n);
                for i:=1 to n do
                read(a[i]);
                for i:=1 to n do
                read(b[i]);
                main;
                write(n-f[n,n]);
end.
