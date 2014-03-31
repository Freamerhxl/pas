program dfx;
var
	i,j,k,l,n,m,ans,QQ:longint;
	a:array[0..500]of longint;
	f:array[0..500,0..500]of longint;
	sum:array[0..500,0..1]of longint;

function min(x,y:longint):longint;
begin
	if x<y then min:=x	else min:=y;
end;

function max(x,y:longint):longint;
begin
        if x>y then max:=x      else max:=y;
end;

procedure dp;
begin
	fillchar(f,sizeof(f),$79);
        f[0,0]:=0;
	for i:=1 to n do
        for j:=max(1,k-n+i) to min(i,k) do
	begin
		m:=j-1;
		for l:=m to i-1 do
                begin
		f[i,j]:=min(f[i,j],f[l,j-1]+(sum[i,0]-sum[l,0])*(sum[i,1]-sum[l,1]));
                //QQ:=Qq+1;
                end;
	end;
        ans:=f[n,k];
end;

begin
	assign(input,'a.in');	reset(input);
		read(n,k);
		for i:=1 to n do
		begin
			read(a[i]);
                        sum[i,0]:=sum[i-1,0];   sum[i,1]:=sum[i-1,1];
                        inc(sum[i,a[i]]);
		end;
                QQ:=0;
		dp;
                //writeln(QQ);
                write(ans);
	close(input);		close(output);
end.
