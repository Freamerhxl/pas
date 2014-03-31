program dfx;
var
	i,j,k,l,n,m,ans,top:longint;
	a:array[0..100000,1..2]of longint;
        dp,next:array[0..100000]of longint;

function find(x:longint):longint;
var u,v,o:longint;
begin
        u:=1;   v:=top;
        while u<=v do
        begin
                o:=(u+v)shr 1;
                if x>=dp[o] then u:=o+1
                else
                begin
                        v:=o;
                        if x>=dp[v-1] then exit(v);
                end;
        end;
        find:=u;
end;


procedure quick(u,v:longint);
var
        i,j,x1,x2:longint;
begin
        i:=u;   j:=v;
        x1:=a[(i+j)shr 1,1];
        x2:=a[(i+j)shr 1,2];
        while i<=j do
        begin
                while (a[i,1]<x1)or(a[i,1]=x1)and(a[i,2]<x2) do inc(i);
                while (a[j,1]>x1)or(a[j,1]=x1)and(a[j,2]>x2) do dec(J);
                if i<=j then
                begin
                        a[0]:=a[i];     a[i]:=a[j];     a[j]:=a[0];
                        inc(i);         dec(j);
                end;
        end;
        if i< v then quick(i,v);
        if u<j then quick(u,j);
end;

begin
	assign(input,'purple.in');	reset(input);
	assign(output,'purple.out');	rewrite(output);
                read(n);
                for i:=1 to n do
                        read(a[i,1],a[i,2]);
                quick(1,n);

                top:=1;
                dp[1]:=a[1,2];
                for i:=2 to n do
                begin
                        j:=find(a[i,2]);
                        if j>top then
                                inc(top);
                        dp[j]:=a[i,2];
                end;
                write(top);
	close(input);		close(output);
end.
