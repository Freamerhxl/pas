const p=100000000;
var   a,b,c,ans,m:array[0..150]of longint;
      st:array[0..2001]of char;
      i,j,n,mm,k,op,kk:longint;
      ch:char;
      s:string;
      flag:boolean;
begin
  assign(input,'sset.in');reset(input);
  assign(output,'sset.out');rewrite(output);
  read(n);
  if n<3 then
    begin
      read(mm);
      if n<2 then
        writeln(-1)
      else
        begin
          if mm>3 then
            writeln(-1)
          else
           writeln(mm);
        end;
    end
  else
    begin
      read(ch);s:='';mm:=0;
      while not eof do
        begin
          read(ch);
          if not(ch in['0'..'9'])then break;
          inc(kk);
          st[kk]:=ch;
        end;
      op:=1;mm:=0;
      for i:=kk downto 1 do
        begin
          mm:=mm+(ord(st[i])-48)*op;
          op:=op*10;
          if op=p then
            begin
              inc(k);m[k]:=mm;mm:=0;op:=1;
            end;
        end;
      if mm>0 then
        begin
          inc(k);m[k]:=mm;
        end;
      m[0]:=k;
      a[0]:=1;a[1]:=1;b[0]:=1;b[1]:=n;
      while true do
        begin
          fillchar(c,sizeof(c),0);

          for i:=1 to b[0]do
            c[i]:=b[i]-a[i];
          c[0]:=b[0];
          for i:=1 to c[0]-1 do
            if c[i]<0 then
              begin
                c[i]:=c[i]+p;
                dec(c[i+1]);
              end;
          while c[c[0]]=0 do dec(c[0]);

          inc(c[1]);
          for i:=1 to c[0]do
            begin
              c[i+1]:=c[i+1]+c[0]div p;
              c[i]:=c[i]mod p;
            end;
          while c[c[0]+1]>0 do inc(c[0]);

          flag:=true;
          if m[0]>c[0]then
            flag:=false
          else
            if m[0]=c[0]then
              begin
                for i:=m[0]downto 1 do
                  if m[i]>c[i]then
                    begin
                      flag:=false;
                      break;
                    end;
              end;
          if flag then
            begin
              dec(m[1]);
              for i:=1 to m[0]-1 do
                if m[i]<0 then
                  begin
                    m[i]:=m[i]+p;
                    dec(m[i+1]);
                  end;
              while m[m[0]]=0 do dec(m[0]);
              if m[0]>a[0]then ans[0]:=m[0]
                else ans[0]:=a[0];
              for i:=1 to  ans[0]do
                ans[i]:=m[i]+a[i];
              for i:=1 to ans[0]do
                begin
                  ans[i+1]:=ans[i+1]+ans[i]div p;
                  ans[i]:=ans[i]mod p;
                end;
              while ans[ans[0]+1]>0 do inc(ans[0]);
              write(ans[ans[0]]);
              for i:=ans[0]-1 downto 1 do
                begin
                  if ans[i]<10000000 then write(0);
                  if ans[i]<1000000 then write(0);
                  if ans[i]<100000 then write(0);
                  if ans[i]<10000 then write(0);
                  if ans[i]<1000 then write(0);
                  if ans[i]<100 then write(0);
                  if ans[i]<10 then write(0);
                  write(ans[i]);
                end;
              break;
            end;

          for i:=1 to m[0]do
            m[i]:=m[i]-c[i];
          for i:=1 to m[0]-1 do
            if m[i]<0 then
              begin
                m[i]:=m[i]+p;
                dec(m[i+1]);
              end;
          while m[m[0]]=0 do dec(m[0]);

          for i:=1 to a[0]do
            a[i]:=a[i]*2;
          inc(a[1]);
          for i:=1 to a[0]do
            begin
              a[i+1]:=a[i+1]+a[i]div p;
              a[i]:=a[i]mod p;
            end;
          while a[a[0]+1]>0 do inc(a[0]);

          for i:=1 to b[0]do
            b[i]:=b[i]*2;
          for i:=1 to b[0]do
            begin
              b[i+1]:=b[i+1]+b[i]div p;
              b[i]:=b[i]mod p;
            end;
          while b[b[0]+1]>0 do inc(b[0]);
          dec(b[1]);
          for i:=1 to b[0]-1 do
            if b[i]<0 then
              begin
                b[i]:=b[i]+p;
                dec(b[i+1]);
              end;
          while b[b[0]]=0 do dec(b[0]);
        end;
    end;
  close(input);close(output);
end.
