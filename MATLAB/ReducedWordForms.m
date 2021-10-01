function R = ReducedWordForms(w)
    %Find all reduced word forms of a reduced word w
    %Terribly, terribly, terribly slow, I need to improve the use of this
    if (isempty(w))
        R = [];
        return;
    end
    n = 1; %Number of words in S
    w = strsplit(w(2:end),'s');
    w = cellfun(@str2num, w);
    l = length(w); %All reduced words have the same length
    R = zeros(l^2,l); %This will contain reduced numerical words
    for k = 1:l
        R(1,k) = w(k);
    end
    i = 1;
    while(i <= n) %Index of reduced word
        for j = 1:(l - 1) %Index of position within reduced word
            if(abs(R(i,j) - R(i,j + 1)) == 1)
                if(j + 1 < l && R(i,j) == R(i,j + 2))
                    w = zeros(1,l);
                    for k = 1:l
                        w(k) = R(i,k);
                    end
                    temp = w(j);
                    w(j) = w(j + 1);
                    w(j + 2) = w(j + 1);
                    w(j + 1) = temp;
                    if(~any(ismember(R,w,'rows')))
                        n = n + 1;
                        for k = 1:l
                            R(n,k)=w(k);
                        end
                    end
                end
            else
                w = zeros(1,l);
                for k = 1:l
                    w(k) = R(i,k);
                end
                temp = w(j);
                w(j) = w(j + 1);
                w(j + 1) = temp;
                if(~any(ismember(R,w,'rows')))
                    n = n + 1;
                    for k = 1:l
                        R(n,k)=w(k);
                    end
                end
            end
        end
        i = i + 1;
    end
    %{
    String output is not actually useful, so this was pointless
    R = strings(n,1); %This will contain all reduced word forms
    for i = 1:n
        y = '';
        for j = 1:l
            y = strcat(y,strcat('s',string(S(i,j))));
        end
        R(i) = y;
    end
    %}
    R(~any(R,2),:) = [];
end