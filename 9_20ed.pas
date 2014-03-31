program dfx;
const max=1000001;
var
	i,j,k,l,n,m,ans,head,tail,x,y:longint;
	a,id,eat:array[0..max+max div 10]of longint;
        b:array[0..max+max div 10]of boolean;

procedure go;
begin
                while eat[a[tail]]>k do
                begin
                        eat[a[tail]]:=eat[a[tail]]-1;
                        tail:=tail-1;
                end;
end;

procedure main;
begin
        tail:=n;                 l:=0;
        for i:=n downto 1 do
        begin
                eat[a[i]]:=eat[a[i]]+1;
                if eat[a[i]]=k then    inc(l);
                if l=m then break;
        end;
        head:=i;
        if l<m then
                write(-1)
        else
        begin
                go;
                x:=head;        y:=tail;
                ans:=tail-head;
                while head>1 do
                begin
                        head:=head-1;
                        if a[head]=a[tail] then
                        begin
                                tail:=tail-1;
                                go;
                                l:=tail-head;
                                if l<=ans then
                                begin
                                        x:=head;     y:=tail;
                                        if l<ans then
                                        ans:=l;
                                end;
                        end
                        else
                                eat[a[head]]:=eat[a[head]]+1;
                end;
                write(x,' ',y);
        end;
end;

begin
                assign(input,'d.in');   reset(input);
                readln(n,k);
                fillchar(id,sizeof(id),-1);
                for i:=1 to n do
                begin
                        read(a[i]);
                        l:=a[i] mod max;
                        while (b[l])and(id[l]<>a[i]) do l:=(l+1)mod max;
                        if not b[l] then m:=m+1;
                        b[l]:=true;     id[l]:=a[i];       a[i]:=l;
                end;
                main;
                close(input);
end.
