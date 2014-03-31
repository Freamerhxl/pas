program dfx;
var
	i,j,k,n,ans,x,y,time,tot,who:longint;
	t,into:array[0..30]of longint;
        ss:array[0..30,0..1]of longint;
        outo,r:array[0..30,0..30]of longint;
        ok:array[0..30]of boolean;
procedure go(now,day,num,tt:longint);
var i,j,k:longint;     flag:boolean;
begin
        tot:=tot-t[now];
        if day+(tot/time)>=ans then
        begin
                tot:=tot+t[now];
                exit;
        end;
        ok[now]:=true;
        if num=n then
        begin
                if day<ans then ans:=day;
                ok[now]:=false;
                exit;
        end;

        k:=outo[now,0];
        for i:=1 to k do
        dec(into[outo[now,i]]);

        flag:=false;
        for i:=1 to n do
        begin
                who:=ss[i,0];
                if (into[who]=0)and(not ok[who]) then
                if tt>=t[who] then
                begin
                        flag:=true;
                        go(who,day,num+1,tt-t[who]);
                end
                else
                        if flag then break
                        else
                        go(who,day+1,num+1,time-t[who]);
        end;

        for i:=1 to k do
        inc(into[outo[now,i]]);
        ok[now]:=false;
        tot:=tot+t[now];
end;

begin
	assign(input,'cost.in');	reset(input);
	assign(output,'cost.out');	rewrite(output);
                readln(n,time);
                for i:=1to n do
                begin
                        read(t[i]);
                        ss[i,0]:=i;
                        ss[i,1]:=t[i];
                        tot:=tot+t[i];
                end;
                for i:=1 to n-1 do
                for j:=i+1 to n do
                if ss[i,1]>ss[j,1] then
                begin
                        ss[0]:=ss[i];   ss[i]:=ss[j];   ss[j]:=ss[0];
                end;
                readln;
                while not eof do
                begin
                        read(x,y);
                        if r[x,y]=0 then
                        begin
                                inc(outo[x,0]);
                                outo[x,outo[x,0]]:=y;
                                inc(into[y]);
                                r[x,y]:=1;
                        end;
                end;


                ans:=maxlongint;
                for i:=1 to n do
                if into[i]=0 then
                go(i,1,1,time-t[i]);
                write(ans);
	close(input);		close(output);
end.