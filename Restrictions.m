function B = Restrictions(w,n)
    w = convertStringsToChars(w);
    Y = PetersonGenerator(n)';
    Alphas = sym('a',[1 (n-1)]); %These are the symbols for representing restrictions
    t = sym('t'); %Convert the alphas into these t's
    y = find(~cellfun('isempty',Y)); %Logical cells with reduced words
    s = size(y,1); %Number of elements in Peterson (Should be 2^(n-1))
    RWF = ReducedWordForms(w);
    w = strsplit(w(2:end),'s');
    w = cellfun(@str2num, w); %Word to restrict to in numerical form
    if (w(1) == 0)
        w = [];
    end
    l = length(w);
    Word = strings(s,1);
    Restriction = sym('r',[1 s],'integer').';
    tForm = sym('t',[1 s],'integer').';
    o = size(RWF,1);
    for i = 1:s
        r = Y(y(i));
        Word(i) = r;
        r = convertStringsToChars(r);
        r = strsplit(r(2:end),'s');
        r = cellfun(@str2num, r);
        rl = length(r);
        Restriction(i) = 0;
        tForm(i) = 0;
        if(isempty(w))
            Restriction(i) = 1;
            tForm(i) = 1;
        elseif(rl >= l)
            %Sara Billey's Formula
            I = zeros(rl^3,l);
            for j = 1:o
                I = BilleyIndices(RWF(j,:),r,l,rl,I,1,1,zeros(1,l-1));
            end
            I = I(any(I,2),:); %Shave off empty rows
            c = size(I,1);
            for j = 1:c
                Betas = sym('b',[1 l]);
                tcounts = zeros(1,l);
                for k = 1:l
                    left = r(I(j,k));
                    right = left + 1;
                    for m = (I(j,k)-1):-1:1
                        if (left - r(m) == 0)
                            left = left + 1;
                        elseif (left - r(m) == 1)
                            left = left -1;
                        end
                        if (right - r(m) == 0)
                            right = right + 1;
                        elseif (right - r(m) == 1)
                            right = right - 1;
                        end
                    end
                    Betas(k) = 0;
                    tcounts(k) = right - left;
                    for m = left:(right - 1)
                        Betas(k) = Betas(k) + Alphas(m);
                    end
                end
                P = sym('p',[1 2]); %Products of all the betas and t's
                P(1) = 1;
                P(2) = 1;
                for k = 1:l
                    P(1) = P(1)*Betas(k);
                    P(2) = P(2)*t*tcounts(k);
                end
                Restriction(i) = Restriction(i) + P(1);
                tForm(i) = tForm(i) + P(2);
            end
        end
        Restriction(i) = simplify(Restriction(i));
    end
    Restriction = arrayfun(@string, Restriction);
    tForm = arrayfun(@string, tForm);
    B = [Word Restriction tForm];
    %B = table(Word, Restriction, tForm);
end