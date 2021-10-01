# MEGLGoldinSpring2021
Note that s0 represents the identity element (i.e. no reflection).

Restrictions will give the results of restricting a provided (reduced) word to every element of the Peterson variety for a given n.
If the provided word is not reduced, the function will find a reduced word form of the word.
Example:
>> Restrictions('s1s3s2s3', 5)

ans = 

  16×3 string array

    "s0"                      "0"                                    "0"     
    "s1"                      "0"                                    "0"     
    "s2"                      "0"                                    "0"     
    "s3"                      "0"                                    "0"     
    "s4"                      "0"                                    "0"     
    "s1s3"                    "0"                                    "0"     
    "s1s4"                    "0"                                    "0"     
    "s2s4"                    "0"                                    "0"     
    "s1s2s1"                  "0"                                    "0"     
    "s2s3s2"                  "0"                                    "0"     
    "s3s4s3"                  "0"                                    "0"     
    "s1s2s1s4"                "0"                                    "0"     
    "s1s3s4s3"                "0"                                    "0"     
    "s1s2s3s1s2s1"            "a1*(a1 + a2)*(a2 + a3)*(a1 + a2…"    "12*t^4"
    "s2s3s4s2s3s2"            "0"                                    "0"     
    "s1s2s3s4s1s2s3s1s2s1"    "(a1 + a2)*(a1 + a2 + a3)*(a2 + …"    "96*t^4"
    
Pullback will give the pullback of a provided (reduced) word to the Flag variety in terms of the Peterson classes.
If the provided word is not reduced, the function will find a reduced word form of the word.
Example:
>> Pullback('s1s3s2s3', 5)

ans = 

    "2*tP{1,2,3} + 2P{1,2,3,4}"
    
PetersonRestrictions/FlagRestrictions will run Restrictions on every element of the Peterson/Flag variety.
All output is given in one table, with the reduced word listed above the results of Restrictions on it.
Example:
>> PetersonRestrictions(3)

ans = 

  20×3 string array

    ""          "s0"              ""     
    "s0"        "1"               "1"    
    "s1"        "1"               "1"    
    "s2"        "1"               "1"    
    "s1s2s1"    "1"               "1"    
    ""          "s1"              ""     
    "s0"        "0"               "0"    
    "s1"        "a1"              "t"    
    "s2"        "0"               "0"    
    "s1s2s1"    "a1 + a2"         "2*t"  
    ""          "s2"              ""     
    "s0"        "0"               "0"    
    "s1"        "0"               "0"    
    "s2"        "a2"              "t"    
    "s1s2s1"    "a1 + a2"         "2*t"  
    ""          "s1s2"            ""     
    "s0"        "0"               "0"    
    "s1"        "0"               "0"    
    "s2"        "0"               "0"    
    "s1s2s1"    "a1*(a1 + a2)"    "2*t^2"
