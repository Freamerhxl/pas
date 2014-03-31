program dfx;
var
	i,j,k,l,n,m,ans,now:longint;
	h,f:array[0..1000]of longint;
        flag:boolean;
procedure main;
begin
end;

begin
	assign(input,'c.in');	reset(input);
	assign(output,'c.out');	rewrite(output);
                readln(n);
                for i:=1 to n do
                begin
                        read(h[i]);
                        h[i+n]:=h[i];
                end;
                now:=n;

                repeat
                     l:=0;
                     for i:=1 to now do
                     begin
                        fillchar(f,sizeof(f),0);
                        for j:=i to i+now-1 do
                        begin
                                f[j]:=1;
                                for k:=i to j-1 do
                                if (h[k]>h[j])and(f[k]+1>f[j]) then
                                        f[j]:=f[k]+1;
                                if f[j]>l then
                        end;
                     end;
                until flag;
	close(input);		close(output);
end.
