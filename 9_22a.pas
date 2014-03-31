program dfx;
var
	i,j,k,l,n,m,ans,p:longint;
        where,ok,arrive:array[0..10]of longint;
        a:array[0..101,0..101]of longint;
procedure floyd;
begin
        for k:=1 to n do
        for i:=1 to n do
        for j:=1 to n do
        if (i<>j)and(i<>k)and(k<>j)and(a[i,j]>a[i,k]+a[k,j]) then
        	a[i,j]:=a[i,k]+a[k,j];
end;

procedure dfs(num:longint);
var     i,j:longint;
begin
        if num=p then
        begin
                j:=0;
                for i:=1 to p+1 do
                        j:=j+a[arrive[i-1],arrive[i]];
                if j<ans then ans:=j;
        end
        else
        begin
                for i:=1 to p do
                if      ok[i]=0 then
                begin
                        ok[i]:=1;    arrive[num+1]:=where[i];
                        dfs(num+1);
                        ok[i]:=0;
                end;
        end;
end;

begin
        assign(input,'a.in');   reset(input);
                ans:=maxlongint;
                readln(n);
                for i:=1 to n do
                for j:=1 to n do
                read(a[i,j]);
                read(p);
                for i:=1 to p do
                        read(where[i]);
                floyd;
                arrive[0]:=1;   arrive[p+1]:=n;
                dfs(0);
                write(ans);
	close(input);		close(output);
end.