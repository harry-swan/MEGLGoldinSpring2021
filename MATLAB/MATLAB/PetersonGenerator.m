function Y = PetersonGenerator(n)
    cache = strcat('Y',string(n));
    try
        Y = evalin('base', cache);
        return;
    catch
    end
    usr = 1; %Current number of unique simple reflections per element
    Y = strings(n*(n-1)/2+1,n^3); %Elements in the Peterson!
    Y(1,1) = 's0'; %Annoyingly, MatLab starts indices at 1, not 0
    i = ones(n*(n-1)/2); %Peterson Indices
    s = 1:n-1;
    while(usr < n)
        w = nchoosek(s,usr); %Convert these combinations to Peterson form
        m = size(w,1); %Number of combinations
        j = 1;
        while(j <= m)
            k = 1;
            y = '';
            len = 0; %Keep track of s count for length
            c = 0;
            while(k <= usr)
                if((k == usr || w(j,k) + 1 ~= w(j,k + 1))  && c == 0)
                    y = strcat(y,strcat('s',string(w(j,k))));
                    len = len + 1;
                elseif(c > 0)
                    l = k;
                    while(l >= c)
                        x = strcat(strcat('s',string(w(j,l)),x));
                        l = l - 1;
                        len = len + 1;
                    end
                    if(k == usr || w(j,k) + 1 ~= w(j,k + 1))
                        y = strcat(y,x);
                        c = 0;
                    end
                else
                    x = strcat('s',string(w(j,k)));
                    len = len + 1;
                    c = k;  %Keep position of consecutive elements
                end
                k = k + 1;
            end
            Y(len + 1,i(len)) = y;
            i(len) = i(len) + 1;
            j = j + 1;
        end
        usr = usr + 1;
    end
    keep = any(~cellfun('isempty',Y), 1);
    Y = Y(:,keep);
    assignin('base',cache,Y);
end