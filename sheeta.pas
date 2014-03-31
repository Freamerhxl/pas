program dfx;
var
	i,j,l,n,m:longint;
	a,sum,b:array[0..100001]of longint;
        ans,k:int64;
procedure gui(l,mid,r:longint);
var i,j,p:longint;
begin
        i:=l;   j:=mid+1;       p:=l;
        while p<=r do
        begin
                if (i<=mid)and((j>r)or(sum[i]<sum[j])) then
                begin
                        b[p]:=sum[i];
                        i:=i+1;
                end
                else
                begin
                        b[p]:=sum[j];
                        j:=j+1;
                        k:=k+mid-i+1;
                end;
                p:=p+1;
        end;
        for p:=l to r do
                sum[p]:=b[p];
end;


procedure main(l,r:longint);
var i,j,mid:longint;
begin
        if l>=r then exit;
        mid:=(l+r)shr 1;
        main(l,mid);
        main(mid+1,r);
        gui(l,mid,r);
end;

begin
	assign(input,'sheeta.in');	reset(input);
	assign(output,'sheeta.out');	rewrite(output);
                read(n,m);
                ans:=0;
                for i:=1 to n do
                begin
                        ans:=ans+i;
                        read(a[i]);
                        sum[i]:=sum[i-1]+a[i];
                end;
                for i:=n downto 0 do
                        sum[i+1]:=sum[i]-i*m;
                k:=0;
                main(1,n+1);
                ans:=ans-k;
                write(ans);
	close(input);		close(output);
end.